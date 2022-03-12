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

use function PHPSTORM_META\type;
use function PHPUnit\Framework\isType;

class OrderManagement extends Controller
{
    public function create(Request $request)
    {
        $time = Carbon::now();
        if (!$request['id_customer']) {
            return response("please enter id_customer!");
        }
        if (!$request['id_address']) {
            return response("please enter id_address!");
        }
        if (!$request['items']) {
            return response("please enter item!");
        }
        if (!$request['create_by']) {
            return response("please enter create_by!");
        }
        foreach ($request['items'] as $item_save) {
            $item = item::where("id_item", $item_save['id_item'])->get(['total_use', 'id_stock']);
            if (!count($item)) {
                return response("This item is not found!");
            } else {
                // echo typeof($item);
                $stock = stock::where('id_stock', $item[0]['id_stock'])->first();
                $cal_total_use = $item[0]['total_use'] * $item_save['number'];
                if (!$stock) {
                    return response("This stock is not found!");
                } else {
                    $order = new order();
                    $order->id_customer = $request['id_customer'];
                    $order->id_address = $request['id_address'];
                    $order->create_by = $request['create_by'];
                    $order->created_at = $time;
                    $order->updated_at = $time;
                    $order->id_item = $item_save['id_item'];
                    $order->number = $item_save['number'];
                    if ($cal_total_use > $stock->total_stock) {
                        return response("This stock is not enough to use!");
                    } else {
                        if ($order->save()) {
                            $stock->total_stock = $stock->total_stock - $cal_total_use;
                            $stock->update();
                        } else {
                            return response('create new order fail');
                        }
                    }
                }
            }
        }
    }
    public function update(Request $request)
    {
        $time = Carbon::now();
        if (!$request['id_order']) {
            return response("please enter ID order!");
        }

        $order = order::find($request['id_order']);
        if ($order) {
            foreach ($request['items'] as $item_input) {
                if ($item_input) {
                    $item = item::where('id_item', $item_input['id_item'])->get(['total_use', 'id_stock']);
                    if (!count($item)) {
                        return response("This item is not found!");
                    } else {
                        $stock = stock::where('id_stock', $item[0]['id_stock'])->first();
                        if (!$stock) {
                            return response("This stock is not found!");
                        } else {
                            $item_relate_order = item::where('id_item', $order['id_item'])->get(['total_use', 'id_stock']);
                            $stock_relate_order = stock::where('id_stock', $item_relate_order[0]['id_stock'])->first();
                            print_r("stock : " . response($stock_relate_order));
                            $revert_total_stock = $item_relate_order[0]['total_use'] * $order->number;
                            $stock_relate_order->total_stock = $stock_relate_order->total_stock + $revert_total_stock;
                            $stock_relate_order->update();
                            print_r("stock update : " . response($stock_relate_order));
                            printf("request :" . $item_input['id_item'] . " " . "order :" . $order->id_item . " " . "stock :" . $stock->id_stock);
                            $stock_update = $item_input['id_item'] == $order->id_item ? $stock_relate_order : $stock;
                            // update order
                            if ($request['id_address']) {
                                $order->id_address = $request['id_address'];
                            }
                            if ($item_input) {
                                $order->id_item = $item_input['id_item'];
                            }
                            if ($item_input['number']) {
                                $order->number = $item_input['number'];
                            }
                            if ($request['create_by']) {
                                $order->create_by = $request['create_by'];
                            }
                            $order->updated_at = $time;
                            $cal_total_use = $item[0]['total_use'] * $item_input['number'];
                            if ($cal_total_use > $stock_update->total_stock) {
                                return response("This stock is not enough to use!");
                            } else {
                                if ($order->save()) {
                                    $stock_update->total_stock = $stock_update->total_stock - $cal_total_use;
                                    if ($stock_update->update()) {
                                        print_r("stock current : " . response($stock_update));
                                        return response()->json($order);
                                    }
                                } else {
                                    return response('update order fail', 417);
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    public function delete(Request $request)
    {
        if (!$request['id_order']) {
            return response("please enter ID order!");
        }

        $order = order::find($request['id_order']);
        if ($order) {
            $item = item::where('id_item', $order['id_item'])->get(['total_use', 'id_stock']);
            if (!count($item)) {
                return response("This item is not found!");
            } else {
                $stock = stock::where('id_stock', $item[0]['id_stock'])->first();
                if (!$stock) {
                    return response("This stock is not found!");
                } else {
                    $item_relate_order = item::where('id_item', $order['id_item'])->get(['total_use', 'id_stock']);
                    $stock_relate_order = stock::where('id_stock', $item_relate_order[0]['id_stock'])->first();
                    $revert_total_stock = $item_relate_order[0]['total_use'] * $order->number;
                    $stock_relate_order->total_stock = $stock_relate_order->total_stock + $revert_total_stock;
                    if ($stock_relate_order->update()) {
                        if (order::where('id_order', $request['id_order'])->delete()) {
                            return response("delete item success!");
                        } else {
                            return response("delete item fail!");
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
    public function getOrderById(Request $request)
    {
        $order = order::where('id_order', $request->keyword)->get()->first();
        $customer = customer::where('id_customer', $order->id_customer)->get()->first();
        $address = address::where('id_address', $order->id_address)->get()->first();
        $item = item::where('id_item', $order->id_item)->get()->first();
        $order->customer = $customer;
        $order->address = $address;
        $order->item = $item;
        return response()->json($order);
    }

    // public function getOrderByCustomerId(Request $request)
    // {
    //     $itemList = [];
    //     $orderList = order::where('id_customer', $request->keyword)->get();
    //     foreach($orderList as $order){
    //         $item = item::where('id_item', $order->id_item)->get()->first();
    //         $item->number = $$order->number
    //         $order->item = $item;
    //     }
    //     return response()->json($orderList);
    // }

    public function cutOffOrder()
    {
        $history = new history();
        $orderList = order::all();
        if (sizeof($orderList) > 0) {
            foreach ($orderList as $order) {
                $history->id_order = $order->id_order;
                $history->id_item = $order->id_item;
                $history->id_customer = $order->id_customer;
                $history->id_address = $order->id_address;
                $history->number = $order->number;
                $history->created_at = $order->created_at;
                $history->create_by = $order->create_by;
                $history->updated_at = $order->updated_at;
                if ($history->save()) {
                    order::truncate();
                }
            }
        return response()->json($history);
        } else {
        return response()->json('not have order!');
        }
    }
}
