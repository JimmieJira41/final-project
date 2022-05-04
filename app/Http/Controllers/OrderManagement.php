<?php

namespace App\Http\Controllers;

use App\Models\address;
use Illuminate\Http\Request;

use App\Models\order;

use App\Models\item;

use App\Models\stock;

use App\Models\customer;

use App\Models\history;

use Carbon\Carbon;

use App\Exports\DHLExport;
use App\Exports\KerryExport;
use App\Models\response;
use App\Models\subOrder;
use App\Models\promotion;
use Maatwebsite\Excel\Facades\Excel;

use Illuminate\Support\Facades\DB;
use SebastianBergmann\Diff\Diff;

use function PHPSTORM_META\type;
use function PHPUnit\Framework\isType;

class OrderManagement extends Controller
{
    public function prepareOrder()
    {
        $order = new response();
        $lastOrder = DB::table('orders')->latest('created_at')->first();
        if ($lastOrder) {
            $id_order = $lastOrder->id_order;
            // $id_order = "KW00001";
            $track = explode("KW", $id_order);
            // print_r($track);
            // echo("first : ".$track[1]);
            $track = (int)$track[1] + 1;
            $head = "KW";
            $track = str_pad($track, 5, "0", STR_PAD_LEFT);
            $id_order = $head . $track;
            // echo("second : ".$track);
        } else {
            $head = "KW";
            $track = str_pad("1", 5, "0", STR_PAD_LEFT);
            $id_order = $head . $track;
            // echo("id_order : ".$track);
        }
        $order->id_order =  $id_order;
        return response()->json($order);
    }
    public function create(Request $request)
    {
        $subOrders = [];
        $order = new order();
        $time = Carbon::now();
        if (!$request['id_order']) {
            return response("please enter id_order!", 417);
        }
        if (!$request['id_customer']) {
            return response("please enter id_customer!", 417);
        }
        if (!$request['id_address']) {
            return response("please enter id_address!", 417);
        }
        if (!$request['items']) {
            return response("please enter item!", 417);
        }
        if (!$request['create_by']) {
            return response("please enter create_by!", 417);
        }
        foreach ($request['items'] as $item_save) {
            $item = item::where("id_item", $item_save['id_item'])->get(['total_use', 'id_stock']);
            if (!count($item)) {
                return response("This item is not found!", 417);
            } else {
                // echo typeof($item);
                $stock = stock::where('id_stock', $item[0]['id_stock'])->first();
                $cal_total_use = $item[0]['total_use'] * $item_save['number'];
                if ($item_save['extra_number']) {
                    $cal_total_use = $cal_total_use + $item_save['extra_number'];
                }
                if ($item_save['id_promotion']) {
                    $promotion = promotion::where('id_promotion', $item_save['id_promotion'])->get()->first();
                    $cal_total_use = $cal_total_use + $promotion->number_promotion;
                }
                if (!$stock) {
                    return response(["ไม่พบสต็อกสินค้า !"], 417);
                } else {
                    $subOrder = new subOrder();
                    $subOrder->id_order = $request['id_order'];
                    // $subOrder->id_customer = $request['id_customer'];
                    // $subOrder->id_address = $request['id_address'];
                    $subOrder->status_order = $request['status_order'];
                    $subOrder->create_by = $request['create_by'];
                    $subOrder->created_at = $time;
                    $subOrder->updated_at = $time;
                    $subOrder->id_item = $item_save['id_item'];
                    $subOrder->number = $item_save['number'];
                    $subOrder->cost_order = $item_save['cost_item'];
                    if ($item_save['id_promotion']) {
                        $subOrder->id_promotion = $item_save['id_promotion'];
                    }
                    if ($item_save['extra_number']) {
                        $subOrder->extra_number = $item_save['extra_number'];
                    }
                    // if($item_save['note']){
                    //     $subOrder->note = $item_save['note'];
                    // }
                    if ($cal_total_use > $stock->total_stock) {
                        return response()->json(['จำนวนสินค้าในสต็อกไม่เพียงพอ !'], 417);
                        // return response("This stock is not enough to use!", 417);
                    } else {
                        if ($subOrder->save()) {
                            $stock->total_stock = $stock->total_stock - $cal_total_use;
                            $stock->update();
                            array_push($subOrders, $subOrder->id_sub_order);
                            $order->total_cost_order = $order->total_cost_order + $subOrder->cost_order;
                        } else {
                            return response()->json(['ไม่สามารถสร้างรายการสั่งซื้อได้ โปรดติดต่อเจ้าหน้าที่ !'], 417);
                        }
                    }
                }
            }
        }
        $order->id_order = $request->id_order;
        $order->name_customer = $request->name_customer;
        $order->id_sub_order = implode(",", $subOrders);
        $order->id_customer = $request->id_customer;
        $order->id_address = $request->id_address;
        $order->status_order = $request['status_order'];
        $order->status_payment = $request['status_payment'];
        $order->create_by = $request->create_by;
        $order->delivery_date = $request->delivery_date;
        if ($order->save()) {
            return response()->json($order);
        }
    }
    public function update(Request $request)
    {
        $time = Carbon::now();
        $order = order::find($request['id_order']);
        $checkItemExistFlag = false;
        $subOrderList = [];
        $idSubOrderExistList = [];
        $idSubOrderUpdateList = [];
        $iditemOrderExistList = [];
        if ($order) {
            $idSubOrderExistList = explode(",", $order->id_sub_order);
            foreach ($idSubOrderExistList as $idSubOrder) {
                $subOrder = subOrder::find($idSubOrder);
                array_push($subOrderList, $subOrder);
                array_push($iditemOrderExistList, $subOrder->id_item);
            }
            foreach ($subOrderList as $subOrder) {
                // $itemExist = item::where('id_item', $subOrder['id_item'])->get(['total_use', 'id_stock']);
                foreach ($request['subOrders'] as $item_input) {
                    if ($item_input && $item_input['id_item'] == $subOrder['id_item']) {
                        $item = item::where('id_item', $item_input['id_item'])->get(['total_use', 'id_stock']);
                        if (!count($item)) {
                            return  response()->json(['ไม่พบรายการสินค้า !'], 417);
                        } else {
                            $stock = stock::where('id_stock', $item[0]['id_stock'])->first();
                            if (!$stock) {
                                return response()->json(['ไม่พบสต็อกสินค้า !'], 417);
                            } else {
                                $item_relate_order = item::where('id_item', $subOrder['id_item'])->get(['total_use', 'id_stock']);
                                $stock_relate_order = stock::where('id_stock', $item_relate_order[0]['id_stock'])->first();
                                // print_r("stock : " . response($stock_relate_order));
                                $revert_total_stock = $item_relate_order[0]['total_use'] * $subOrder->number;
                                if ($subOrder['extra_number']) {
                                    $revert_total_stock = $revert_total_stock + $subOrder['extra_number'];
                                }
                                if ($subOrder['id_promotion']) {
                                    $promotion = promotion::where('id_promotion', $subOrder['id_promotion'])->get()->first();
                                    $revert_total_stock = $revert_total_stock + $promotion->number_promotion;
                                }
                                $stock_relate_order->total_stock = $stock_relate_order->total_stock + $revert_total_stock;
                                // $stock_relate_order->update();
                                // print_r("stock update : " . response($stock_relate_order));
                                // printf("request :" . $item_input['id_item'] . " " . "order :" . $subOrder->id_item . " " . "stock :" . $stock->id_stock);
                                $stock_update = $item_input['id_item'] == $subOrder->id_item ? $stock_relate_order : $stock;
                                // update order
                                // if ($request['id_address']) {
                                //     $subOrder->id_address = $request['id_address'];
                                // }
                                if ($item_input['id_item']) {
                                    $subOrder->id_item = $item_input['id_item'];
                                }
                                if ($item_input['number']) {
                                    $subOrder->number = $item_input['number'];
                                }
                                if ($request['create_by']) {
                                    $subOrder->create_by = $request['create_by'];
                                }
                                $subOrder->cost_order = $item_input['cost_item'];
                                if ($item_input['id_promotion']) {
                                    $subOrder->id_promotion = $item_input['id_promotion'];
                                }
                                if ($item_input['extra_number']) {
                                    $subOrder->extra_number = $item_input['extra_number'];
                                }
                                $subOrder->updated_at = $time;
                                $cal_total_use = $item[0]['total_use'] * $item_input['number'];
                                if ($item_input['extra_number']) {
                                    $cal_total_use = $cal_total_use + $item_input['extra_number'];
                                }
                                if ($item_input['id_promotion']) {
                                    $promotion = promotion::where('id_promotion', $item_input['id_promotion'])->get()->first();
                                    $cal_total_use = $cal_total_use + $promotion->number_promotion;
                                }
                                if ($cal_total_use > $stock_update->total_stock) {
                                    return response()->json(['จำนวนสินค้าในสต็อกไม่เพียงพอ !'], 417);
                                } else {
                                    $stock_relate_order->update();
                                    if ($subOrder->update()) {
                                        array_push($idSubOrderUpdateList, $subOrder->id_sub_order);
                                        $stock_update->total_stock = $stock_update->total_stock - $cal_total_use;
                                        if ($stock_update->update()) {
                                            // print_r("stock current : " . response($stock_update));
                                            // return response()->json($order);
                                        }
                                    } else {
                                        return response()->json(['อัพเดรตรายการสั่งซื้อไม่สำเร็จ !'], 417);
                                    }
                                }
                            }
                        }
                    } else if (!array_search($item_input['id_item'], $iditemOrderExistList) && !$checkItemExistFlag) {
                        // echo "pass new order";
                        print_r($iditemOrderExistList);
                        $item = item::where("id_item", $item_input['id_item'])->get(['total_use', 'id_stock']);
                        if (!count($item)) {
                            return response()->json(['ไม่พบรายการสินค้า !'], 417);
                        } else {
                            // echo typeof($item);
                            $stock = stock::where('id_stock', $item[0]['id_stock'])->first();
                            $cal_total_use = $item[0]['total_use'] * $item_input['number'];
                            if ($item_input['extra_number']) {
                                $cal_total_use = $cal_total_use + $item_input['extra_number'];
                            }
                            if ($item_input['id_promotion']) {
                                $promotion = promotion::where('id_promotion', $item_input['id_promotion'])->get()->first();
                                $cal_total_use = $cal_total_use + $promotion->number_promotion;
                            }
                            if (!$stock) {
                                return response()->json(['ไม่พบสต็อกสินค้า !'], 417);
                            } else {
                                $subOrder = new subOrder();
                                $subOrder->id_order = $request['id_order'];
                                $subOrder->create_by = $request['create_by'];
                                $subOrder->created_at = $time;
                                $subOrder->updated_at = $time;
                                $subOrder->id_item = $item_input['id_item'];
                                $subOrder->number = $item_input['number'];
                                $subOrder->cost_order =  $item_input['cost_item'];
                                if ($item_input['id_promotion']) {
                                    $subOrder->id_promotion = $item_input['id_promotion'];
                                }
                                if ($item_input['extra_number']) {
                                    $subOrder->extra_number = $item_input['extra_number'];
                                }
                                // if($item_sav
                                if ($cal_total_use > $stock->total_stock) {
                                    return response()->json(['ไม่พบสต็อกสินค้า !'], 417);
                                } else {
                                    if ($subOrder->save()) {
                                        $stock->total_stock = $stock->total_stock - $cal_total_use;
                                        $stock->update();
                                        array_push($idSubOrderUpdateList, $subOrder->id_sub_order);
                                    } else {
                                        return response()->json(['อัพเดรตรายการสั่งซื้อไม่สำเร็จ !'], 417);
                                    }
                                }
                            }
                        }
                    }
                }
                $checkItemExistFlag = true;
            }
            $diffList = array_diff($idSubOrderExistList, $idSubOrderUpdateList);
            foreach ($diffList as $diff) {
                if (array_search($diff, $idSubOrderExistList)) {
                    // echo("delete".$diff);
                    subOrder::find($diff)->delete();
                }
            }
            $order->id_sub_order = implode(",", $idSubOrderUpdateList);
            $order->name_customer = $request['name_customer'];
            $order->id_customer = $request['id_customer'];
            $order->id_address = $request['id_address'];
            $order->status_payment = $request['status_payment'];
            $order->delivery_date = $request['delivery_date'];
            $order->update();
        }
        // foreach(explode(",", $order->subOrder) as $idSubOrder){
        //     $subOrder = subOrder::find($idSubOrder);
        //     if($subOrder){
        //         if ($item_input && $item_input['id_item'] != "") {
        //             $item = item::where('id_item', $item_input['id_item'])->get(['total_use', 'id_stock']);
        //             if (!count($item)) {
        //                 return response("This item is not found!");
        //             } else {
        //                 $stock = stock::where('id_stock', $item[0]['id_stock'])->first();
        //                 if (!$stock) {
        //                     return response("This stock is not found!");
        //                 } else {
        //                     $item_relate_order = item::where('id_item', $order['id_item'])->get(['total_use', 'id_stock']);
        //                     $stock_relate_order = stock::where('id_stock', $item_relate_order[0]['id_stock'])->first();
        //                     // print_r("stock : " . response($stock_relate_order));
        //                     $revert_total_stock = $item_relate_order[0]['total_use'] * $order->number;
        //                     $stock_relate_order->total_stock = $stock_relate_order->total_stock + $revert_total_stock;
        //                     $stock_relate_order->update();
        //                     // print_r("stock update : " . response($stock_relate_order));
        //                     // printf("request :" . $item_input['id_item'] . " " . "order :" . $order->id_item . " " . "stock :" . $stock->id_stock);
        //                     $stock_update = $item_input['id_item'] == $order->id_item ? $stock_relate_order : $stock;
        //                     // update order
        //                     if ($request['id_address']) {
        //                         $order->id_address = $request['id_address'];
        //                     }
        //                     if ($item_input) {
        //                         $order->id_item = $item_input['id_item'];
        //                     }
        //                     if ($item_input['number']) {
        //                         $order->number = $item_input['number'];
        //                     }
        //                     if ($request['create_by']) {
        //                         $order->create_by = $request['create_by'];
        //                     }
        //                     $order->cost_order = $item_input['cost_item'];
        //                     $order->updated_at = $time;
        //                     $cal_total_use = $item[0]['total_use'] * $item_input['number'];
        //                     if ($cal_total_use > $stock_update->total_stock) {
        //                         return response("This stock is not enough to use!");
        //                     } else {
        //                         if ($order->save()) {
        //                             $stock_update->total_stock = $stock_update->total_stock - $cal_total_use;
        //                             if ($stock_update->update()) {
        //                                 // print_r("stock current : " . response($stock_update));
        //                                 // return response()->json($order);
        //                             }
        //                         } else {
        //                             return response('update order fail', 417);
        //                         }
        //                     }
        //                 }
        //             }
        //         } else {
        //             $item = item::where('id_item', $order['id_item'])->get(['total_use', 'id_stock']);
        //             if (!count($item)) {
        //                 return response("This item is not found!");
        //             } else {
        //                 $stock = stock::where('id_stock', $item[0]['id_stock'])->first();
        //                 if (!$stock) {
        //                     return response("This stock is not found!");
        //                 } else {
        //                     $item_relate_order = item::where('id_item', $order['id_item'])->get(['total_use', 'id_stock']);
        //                     $stock_relate_order = stock::where('id_stock', $item_relate_order[0]['id_stock'])->first();
        //                     $revert_total_stock = $item_relate_order[0]['total_use'] * $order->number;
        //                     $stock_relate_order->total_stock = $stock_relate_order->total_stock + $revert_total_stock;
        //                     if ($stock_relate_order->update()) {
        //                         $order->delete();
        //                     }
        //                 }
        //             }
        //         }
        //     } else {
        //         echo "pass new order";
        //         $item = item::where("id_item", $item_input['id_item'])->get(['total_use', 'id_stock']);
        //         if (!count($item)) {
        //             return response("This item is not found!");
        //         } else {
        //             // echo typeof($item);
        //             $stock = stock::where('id_stock', $item[0]['id_stock'])->first();
        //             $cal_total_use = $item[0]['total_use'] * $item_input['number'];
        //             if (!$stock) {
        //                 return response("This stock is not found!");
        //             } else {
        //                 $order = new order();
        //                 $order->id_customer = $request['id_customer'];
        //                 $order->id_address = $request['id_address'];
        //                 $order->create_by = $request['create_by'];
        //                 $order->created_at = $time;
        //                 $order->updated_at = $time;
        //                 $order->id_item = $item_input['id_item'];
        //                 $order->number = $item_input['number'];
        //                 $order->cost_order = $item_input['cost_item'];
        //                 if ($cal_total_use > $stock->total_stock) {
        //                     return response("This stock is not enough to use!");
        //                 } else {
        //                     if ($order->save()) {
        //                         $stock->total_stock = $stock->total_stock - $cal_total_use;
        //                         $stock->update();
        //                     } else {
        //                         return response('create new order fail');
        //                     }
        //                 }
        //             }
        //         }
        //     }
        // }
    }
    public function delete(Request $request)
    {
        if (!$request['id_order']) {
            return response("please enter ID order!");
        }
        $order = order::find($request['id_order']);
        if ($order) {
            foreach (explode(",", $order['id_sub_order']) as $idSubOrder) {
                $subOrder = subOrder::find($idSubOrder);
                $item = item::where('id_item', $subOrder['id_item'])->get(['total_use', 'id_stock']);
                if (!count($item)) {
                    return response("This item is not found!");
                } else {
                    $stock = stock::where('id_stock', $item[0]['id_stock'])->first();
                    if (!$stock) {
                        return response("This stock is not found!");
                    } else {
                        $item_relate_order = item::where('id_item', $subOrder['id_item'])->get(['total_use', 'id_stock']);
                        $stock_relate_order = stock::where('id_stock', $item_relate_order[0]['id_stock'])->first();
                        $revert_total_stock = $item_relate_order[0]['total_use'] * $subOrder->number;
                        if ($subOrder['extra_number']) {
                            $revert_total_stock = $revert_total_stock + $subOrder['extra_number'];
                        }
                        if ($subOrder['id_promotion']) {
                            $promotion = promotion::where('id_promotion', $subOrder['id_promotion'])->get()->first();
                            $revert_total_stock = $revert_total_stock + $promotion->number_promotion;
                        }
                        $stock_relate_order->total_stock = $stock_relate_order->total_stock + $revert_total_stock;
                        if ($stock_relate_order->update()) {
                            if (subOrder::where('id_sub_order', $idSubOrder)->delete()) {
                                if (order::where('id_order', $request['id_order'])->delete()) {
                                    return response("delete item success!");
                                }
                            } else {
                                return response("delete item fail!");
                            }
                        }
                    }
                }
            }
        } else {
            return response("order not found");
        }
    }
    public function getAll()
    {
        $orderListResponse = [];
        $orderList = order::all()->sortByDesc('created_at');
        foreach ($orderList as $order) {
            $item = item::where('id_item', $order->id_item)->get();
            $order->item = $item;
            array_push($orderListResponse, $order);
        }
        return response()->json($orderListResponse);
    }
    public function getAllOrderGroupByItem(Request $request)
    {
        $orderListResponse = [];
        $idItemList = [];
        $orders = order::where('delivery_date', $request->keyword)->get('id_sub_order');
        foreach ($orders as $order) {
            $idSubOrderList = explode(',', $order->id_sub_order);
            foreach ($idSubOrderList as $idSubOrder) {
                $subOrderList = DB::table('sub_orders')
                    ->select('id_item', DB::raw('SUM(number) as total_number'))
                    ->groupBy('id_item')
                    ->where('status_order', false)
                    ->where('id_sub_order', $idSubOrder)
                    ->get();
                foreach ($subOrderList as $subOrder) {
                    $item = item::where('id_item', $subOrder->id_item)->get();
                    if(!in_array($subOrder->id_item,$idItemList)){
                        $subOrder->item = $item;
                        array_push($idItemList,$subOrder->id_item);
                        array_push($orderListResponse, $subOrder);
                    }else{
                        $index = array_search($subOrder->id_item,$idItemList);
                        $orderListResponse[$index]->total_number += 1;
                    }
                }
                    // foreach ($orderListResponse as $response){
                    //     array_push($idItemList,$response->id_item);
                    // }                   
                    // if(!in_array($item->id_item,$idItemList)){
                    //     $subOrder->item = $item;
                    //     array_push($orderListResponse, $subOrder);
                    // }else{
                    //     $index = array_search($item,$orderListResponse);
                    //     $orderListResponse[$index]->total_number += 1;
                    // }
                // }
            }
        }

        return response()->json($orderListResponse);
    }
    public function getAllOrderGroupByCustomer(Request $request)
    {
        $itemList = [];
        // $subOrderResponse = new response();
        $orderList = order::where('status_order', false)
            ->whereDate('delivery_date', $request->keyword)
            ->get(['id_order', 'name_customer', 'id_sub_order', 'status_payment', 'total_cost_order'])->sortByDesc('delivery_date');
        foreach ($orderList as $order) {
            foreach (explode(",", $order->id_sub_order) as $idSubOrder) {
                $subOrder = subOrder::where('id_sub_order', $idSubOrder)->get(['id_item', 'number'])->first();
                $item = item::where('id_item', $subOrder->id_item)->get(['title_item'])->first();
                $item->number = $subOrder->number;
                array_push($itemList, $item);
                // $order->item[] = $item;
                // $order->item[sizeof($order->items)-1] = $subOrder->number; 
                // $order->item->number = $subOrder->number;
                // $order->number = $subOrder->number;
            }
            $order->item = $itemList;
            $itemList = [];
        }

        // $orderOfCustomer = [];
        // $idCustomerList = DB::table('orders')
        //     ->select('id_customer')
        //     ->groupBy('id_customer')
        //     ->get();
        // $customerList = customer::all();
        // $orderList = order::all(['id_customer', 'id_item', 'number'])->sortByDesc('created_at');
        // foreach ($idCustomerList as $idCustomer) {
        //     $orderResponse = new response();
        //     $orderResponse->id_customer = $idCustomer->id_customer;
        //     foreach ($customerList as $customer) {
        //         if ($idCustomer->id_customer == $customer['id_customer']) {
        //             $orderResponse->name_customer = strval($customer['firstname_customer'] . " " . $customer['lastname_customer']);
        //             foreach ($orderList as $order) {
        //                 if ($order->id_customer == $idCustomer->id_customer) {
        //                     $item = item::where('id_item', $order->id_item)->get();
        //                     $order->item = $item;
        //                     array_push($orderOfCustomer, $order);
        //                 }
        //             }
        //             $orderResponse->orderList = $orderOfCustomer;
        //         }
        //     }
        //     array_push($orderListResponse, $orderResponse);
        // }
        return response()->json($orderList);
    }
    public function getOrderById(Request $request)
    {
        $subOrderList = [];
        $orderResponse = new response();
        $order = order::where('id_order', $request->keyword)->get()->first();
        $customer = customer::where('id_customer', $order->id_customer)->get()->first();
        $address = address::where('id_address', $order->id_address)->get()->first();
        foreach (explode(",", $order->id_sub_order) as $id_sub_order) {
            $subOrder = subOrder::where('id_sub_order', $id_sub_order)->get(['id_item', 'number', 'id_promotion', 'extra_number', 'note'])->first();
            $item = item::where('id_item', $subOrder->id_item)->get(['description_item', 'title_item', 'cost_item'])->first();
            // $item->number = $subOrder->number;
            $subOrder->title_item = $item->title_item;
            $subOrder->description_item = $item->description_item;
            $subOrder->cost_item = $item->cost_item;
            // $subOrder->id_promotion = $item->id_promotion;
            // $subOrder->extra_number = $item->extra_number;
            // $subOrder->note = $item->note;
            array_push($subOrderList,  $subOrder);
            // $order->item[] = $item;
            // $order->item[sizeof($order->items)-1] = $subOrder->number; 
            // $order->item->number = $subOrder->number;
            // $order->number = $subOrder->number;
        }
        $orderResponse->id_order = $order->id_order;
        $orderResponse->delivery_date = $order->delivery_date;
        $orderResponse->status_payment = $order->status_payment;
        $orderResponse->customer = $customer;
        $orderResponse->address = $address;
        $orderResponse->subOrders = $subOrderList;
        return response()->json($orderResponse);
    }


    public function getAllOrderGroupByCustomerId(Request $request)
    {
        $orderListResponse = [];
        $orderOfCustomer = [];
        $orderResponse = new response();
        $customer = customer::where('id_customer', $request->keyword)->get()->first();
        $address = address::where('id_address', $customer->default_id_address)->get()->first();
        $orderList = order::select(['id_order', 'id_customer', 'id_item', 'number', 'cost_order'])->where('id_customer', $request->keyword)->get();
        foreach ($orderList as $order) {
            if ($order->id_customer == $customer->id_customer) {
                $item = item::where('id_item', $order->id_item)->get()->first();
                $order->item = $item;
                array_push($orderOfCustomer, $order);
            }
        }
        $orderResponse->id_order = $request->keyword;
        $orderResponse->customer = $customer;
        $orderResponse->address = $address;
        $orderResponse->orderList = $orderOfCustomer;
        // array_push($orderListResponse, $orderResponse);
        return response()->json($orderResponse);
    }

    public function cutOffOrder()
    {
        // $order = new history();
        $orderList = order::all();
        if (sizeof($orderList) > 0) {
            foreach ($orderList as $order) {
                if ($order->status_payment && !$order->status_order) {
                    $order->status_order = true;
                    $order->update();
                    foreach (explode(",", $order->id_sub_order) as $idSubOrder) {
                        $subOrder = subOrder::find($idSubOrder);
                        $subOrder->status_order = true;
                        $subOrder->update();
                    }
                }
            }
            // order::truncate();
            return response()->json($order);
        } else {
            return response()->json('not have order!');
        }
    }
    public function DHLExportExcel(Request $request)
    {
        return Excel::download(new DHLExport($request, 0), 'history.xlsx');
    }
    public function KerryExportExcel(Request $request)
    {
        return Excel::download(new KerryExport($request), 'history.xlsx');
    }
}
