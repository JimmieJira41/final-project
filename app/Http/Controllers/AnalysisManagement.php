<?php

namespace App\Http\Controllers;

use App\Models\history;
use App\Models\order;
use App\Models\subOrder;
use App\Models\item;
use App\Models\response;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AnalysisManagement extends Controller
{
    public function getAnlysis(Request $request)
    {
        $dataAnalysis = new response();
        $label = [];
        $data = [];
        $historyList = [];
        $idItemList = [];
        if (!$request['end_date']) {
            if ($request['filter'] == 'order') {
                if ($request['type'] == 'day') {
                    $orderList = order::whereDate("created_at", $request['start_date'])->get();
                    // print_r($orderList);
                    foreach ($orderList as $order) {
                        $idSubOrderList = explode(",", $order->id_sub_order);
                        foreach ($idSubOrderList as $idSubOrder) {
                            $subOrder = subOrder::where("id_sub_order", $idSubOrder)->get(["id_item", "number"])->first();
                            $item = item::where("id_item", $subOrder->id_item)->get()->first();
                            if (!in_array($subOrder->id_item, $idItemList)) {
                                $subOrder->item = $item;
                                array_push($idItemList, $subOrder->id_item);
                                array_push($historyList, $subOrder);
                            } else {
                                $index = array_search($subOrder->id_item, $idItemList);
                                $historyList[$index]->number += 1;
                            }
                        }
                    }
                }
                if ($request['type'] == 'month') {
                    $orderList = order::whereMonth("created_at", $request['start_date'])->get();
                    // print_r($orderList);
                    foreach ($orderList as $order) {
                        $idSubOrderList = explode(",", $order->id_sub_order);
                        foreach ($idSubOrderList as $idSubOrder) {
                            $subOrder = subOrder::where("id_sub_order", $idSubOrder)->get(["id_item", "number"])->first();
                            $item = item::where("id_item", $subOrder->id_item)->get()->first();
                            if (!in_array($subOrder->id_item, $idItemList)) {
                                $subOrder->item = $item;
                                array_push($idItemList, $subOrder->id_item);
                                array_push($historyList, $subOrder);
                            } else {
                                $index = array_search($subOrder->id_item, $idItemList);
                                $historyList[$index]->number += 1;
                            }
                        }
                    }
                    // $historyList = DB::table('histories')
                    //     ->select('id_item', DB::raw('SUM(number) as total_number'))
                    //     ->whereMonth('created_at', $request['start_date'])
                    //     ->groupBy('id_item')
                    //     ->get();
                }
                if ($request['type'] == 'year') {
                    $orderList = order::whereYear("created_at", $request['start_date'])->get();
                    // print_r($orderList);
                    foreach ($orderList as $order) {
                        $idSubOrderList = explode(",", $order->id_sub_order);
                        foreach ($idSubOrderList as $idSubOrder) {
                            $subOrder = subOrder::where("id_sub_order", $idSubOrder)->get(["id_item", "number"])->first();
                            $item = item::where("id_item", $subOrder->id_item)->get()->first();
                            if (!in_array($subOrder->id_item, $idItemList)) {
                                $subOrder->item = $item;
                                array_push($idItemList, $subOrder->id_item);
                                array_push($historyList, $subOrder);
                            } else {
                                $index = array_search($subOrder->id_item, $idItemList);
                                $historyList[$index]->number += 1;
                            }
                        }
                    }
                    // $historyList = DB::table('histories')
                    //     ->select('id_item', DB::raw('SUM(number) as total_number'))
                    //     ->whereYear('created_at', $request['start_date'])
                    //     ->groupBy('id_item')
                    //     ->get();
                }
            }
            if ($request['filter'] == 'cost') {
                if ($request['type'] == 'day') {
                    $orderList = order::whereDate("created_at", $request['start_date'])->get();
                    // print_r($orderList);
                    foreach ($orderList as $order) {
                        $idSubOrderList = explode(",", $order->id_sub_order);
                        foreach ($idSubOrderList as $idSubOrder) {
                            $subOrder = subOrder::where("id_sub_order", $idSubOrder)->get(["id_item", "cost_order"])->first();
                            $item = item::where("id_item", $subOrder->id_item)->get()->first();
                            if (!in_array($subOrder->id_item, $idItemList)) {
                                $subOrder->item = $item;
                                array_push($idItemList, $subOrder->id_item);
                                array_push($historyList, $subOrder);
                            } else {
                                $index = array_search($subOrder->id_item, $idItemList);
                                $historyList[$index]->cost_order += $subOrder->cost_order;
                            }
                        }
                    }

                    // $historyList = DB::table('histories')
                    //     ->select('id_item', DB::raw('SUM(cost_order) as total_cost'))
                    //     ->whereDate('created_at', $request['start_date'])
                    //     ->groupBy('id_item')
                    //     ->get();
                }
                if ($request['type'] == 'month') {
                    $orderList = order::whereMonth("created_at", $request['start_date'])->get();
                    // print_r($orderList);
                    foreach ($orderList as $order) {
                        $idSubOrderList = explode(",", $order->id_sub_order);
                        foreach ($idSubOrderList as $idSubOrder) {
                            $subOrder = subOrder::where("id_sub_order", $idSubOrder)->get(["id_item", "cost_order"])->first();
                            $item = item::where("id_item", $subOrder->id_item)->get()->first();
                            if (!in_array($subOrder->id_item, $idItemList)) {
                                $subOrder->item = $item;
                                array_push($idItemList, $subOrder->id_item);
                                array_push($historyList, $subOrder);
                            } else {
                                $index = array_search($subOrder->id_item, $idItemList);
                                $historyList[$index]->cost_order += $subOrder->cost_order;
                            }
                        }
                    }

                    // $historyList = DB::table('histories')
                    //     ->select('id_item', DB::raw('SUM(cost_order) as total_cost'))
                    //     ->whereMonth('created_at', $request['start_date'])
                    //     ->groupBy('id_item')
                    //     ->get();
                }
                if ($request['type'] == 'year') {
                    $orderList = order::whereYear("created_at", $request['start_date'])->get();
                    // print_r($orderList);
                    foreach ($orderList as $order) {
                        $idSubOrderList = explode(",", $order->id_sub_order);
                        foreach ($idSubOrderList as $idSubOrder) {
                            $subOrder = subOrder::where("id_sub_order", $idSubOrder)->get(["id_item", "cost_order"])->first();
                            $item = item::where("id_item", $subOrder->id_item)->get()->first();
                            if (!in_array($subOrder->id_item, $idItemList)) {
                                $subOrder->item = $item;
                                array_push($idItemList, $subOrder->id_item);
                                array_push($historyList, $subOrder);
                            } else {
                                $index = array_search($subOrder->id_item, $idItemList);
                                $historyList[$index]->cost_order += $subOrder->cost_order;
                            }
                        }
                    }

                    // $historyList = DB::table('histories')
                    //     ->select('id_item', DB::raw('SUM(cost_order) as total_cost'))
                    //     ->whereYear('created_at', $request['start_date'])
                    //     ->groupBy('id_item')
                    //     ->get();
                }
            }
        } else {
            if ($request['filter'] == 'order') {
                if ($request['type'] == 'day') {
                    $orderList = order::whereBetween(DB::raw('DATE(created_at)'), [$request['start_date'], $request['end_date']])->get();
                    // print_r($orderList);
                    foreach ($orderList as $order) {
                        $idSubOrderList = explode(",", $order->id_sub_order);
                        foreach ($idSubOrderList as $idSubOrder) {
                            $subOrder = subOrder::where("id_sub_order", $idSubOrder)->get(["id_item", "number"])->first();
                            $item = item::where("id_item", $subOrder->id_item)->get()->first();
                            if (!in_array($subOrder->id_item, $idItemList)) {
                                $subOrder->item = $item;
                                array_push($idItemList, $subOrder->id_item);
                                array_push($historyList, $subOrder);
                            } else {
                                $index = array_search($subOrder->id_item, $idItemList);
                                $historyList[$index]->number += 1;
                            }
                        }
                    }
                    // $historyList = DB::table('histories')
                    //     ->select('id_item', DB::raw('SUM(number) as total_number'))
                    //     ->whereBetween(DB::raw('DATE(created_at)'), [$request['start_date'], $request['end_date']])
                    //     ->groupBy('id_item')
                    //     ->get();
                }
                if ($request['type'] == 'month') {
                    $orderList = order::whereBetween(DB::raw('to_char(created_at, \'MM\')'), [$request['start_date'], $request['end_date']])->get();
                    // print_r($orderList);
                    foreach ($orderList as $order) {
                        $idSubOrderList = explode(",", $order->id_sub_order);
                        foreach ($idSubOrderList as $idSubOrder) {
                            $subOrder = subOrder::where("id_sub_order", $idSubOrder)->get(["id_item", "number"])->first();
                            $item = item::where("id_item", $subOrder->id_item)->get()->first();
                            if (!in_array($subOrder->id_item, $idItemList)) {
                                $subOrder->item = $item;
                                array_push($idItemList, $subOrder->id_item);
                                array_push($historyList, $subOrder);
                            } else {
                                $index = array_search($subOrder->id_item, $idItemList);
                                $historyList[$index]->number += 1;
                            }
                        }
                    }
                    // $historyList = DB::table('histories')
                    //     ->select('id_item', DB::raw('SUM(number) as total_number'))
                    //     ->whereBetween(DB::raw('to_char(created_at, \'MM\')'), [$request['start_date'], $request['end_date']])
                    //     ->groupBy('id_item')
                    //     ->get();
                }
                if ($request['type'] == 'year') {
                    $orderList = order::whereBetween(DB::raw('to_char(created_at, \'YYYY\')'), [$request['start_date'], $request['end_date']])->get();
                    // print_r($orderList);
                    foreach ($orderList as $order) {
                        $idSubOrderList = explode(",", $order->id_sub_order);
                        foreach ($idSubOrderList as $idSubOrder) {
                            $subOrder = subOrder::where("id_sub_order", $idSubOrder)->get(["id_item", "number"])->first();
                            $item = item::where("id_item", $subOrder->id_item)->get()->first();
                            if (!in_array($subOrder->id_item, $idItemList)) {
                                $subOrder->item = $item;
                                array_push($idItemList, $subOrder->id_item);
                                array_push($historyList, $subOrder);
                            } else {
                                $index = array_search($subOrder->id_item, $idItemList);
                                $historyList[$index]->number += 1;
                            }
                        }
                    }
                    // $historyList = DB::table('histories')
                    //     ->select('id_item', DB::raw('SUM(number) as total_number'))
                    //     ->whereBetween(DB::raw('to_char(created_at, \'YYYY\')'), [$request['start_date'], $request['end_date']])
                    //     ->groupBy('id_item')
                    //     ->get();
                }
            }
            if ($request['filter'] == 'cost') {
                if ($request['type'] == 'day') {
                    $orderList = order::whereBetween(DB::raw('DATE(created_at)'), [$request['start_date'], $request['end_date']])->get();
                    // print_r($orderList);
                    foreach ($orderList as $order) {
                        $idSubOrderList = explode(",", $order->id_sub_order);
                        foreach ($idSubOrderList as $idSubOrder) {
                            $subOrder = subOrder::where("id_sub_order", $idSubOrder)->get(["id_item", "cost_order"])->first();
                            $item = item::where("id_item", $subOrder->id_item)->get()->first();
                            if (!in_array($subOrder->id_item, $idItemList)) {
                                $subOrder->item = $item;
                                array_push($idItemList, $subOrder->id_item);
                                array_push($historyList, $subOrder);
                            } else {
                                $index = array_search($subOrder->id_item, $idItemList);
                                $historyList[$index]->cost_order += $subOrder->cost_order;
                            }
                        }
                    }

                    // $historyList = DB::table('histories')
                    //     ->select('id_item', DB::raw('SUM(cost_order) as total_cost'))
                    //     ->whereBetween(DB::raw('DATE(created_at)'), [$request['start_date'], $request['end_date']])
                    //     ->groupBy('id_item')
                    //     ->get();
                }
                if ($request['type'] == 'month') {
                    $orderList = order::whereBetween(DB::raw('to_char(created_at, \'MM\')'), [$request['start_date'], $request['end_date']])->get();
                    // print_r($orderList);
                    foreach ($orderList as $order) {
                        $idSubOrderList = explode(",", $order->id_sub_order);
                        foreach ($idSubOrderList as $idSubOrder) {
                            $subOrder = subOrder::where("id_sub_order", $idSubOrder)->get(["id_item", "cost_order"])->first();
                            $item = item::where("id_item", $subOrder->id_item)->get()->first();
                            if (!in_array($subOrder->id_item, $idItemList)) {
                                $subOrder->item = $item;
                                array_push($idItemList, $subOrder->id_item);
                                array_push($historyList, $subOrder);
                            } else {
                                $index = array_search($subOrder->id_item, $idItemList);
                                $historyList[$index]->cost_order += $subOrder->cost_order;
                            }
                        }
                    }

                    // $historyList = DB::table('histories')
                    //     ->select('id_item', DB::raw('SUM(cost_order) as total_cost'))
                    //     ->whereBetween(DB::raw('to_char(created_at, \'MM\')'), [$request['start_date'], $request['end_date']])
                    //     ->groupBy('id_item')
                    //     ->get();
                }
                if ($request['type'] == 'year') {
                    $orderList = order::whereBetween(DB::raw('to_char(created_at, \'YYYY\')'), [$request['start_date'], $request['end_date']])->get();
                    // print_r($orderList);
                    foreach ($orderList as $order) {
                        $idSubOrderList = explode(",", $order->id_sub_order);
                        foreach ($idSubOrderList as $idSubOrder) {
                            $subOrder = subOrder::where("id_sub_order", $idSubOrder)->get(["id_item", "cost_order"])->first();
                            $item = item::where("id_item", $subOrder->id_item)->get()->first();
                            if (!in_array($subOrder->id_item, $idItemList)) {
                                $subOrder->item = $item;
                                array_push($idItemList, $subOrder->id_item);
                                array_push($historyList, $subOrder);
                            } else {
                                $index = array_search($subOrder->id_item, $idItemList);
                                $historyList[$index]->cost_order += $subOrder->cost_order;
                            }
                        }
                    }

                    // $historyList = DB::table('histories')
                    //     ->select('id_item', DB::raw('SUM(cost_order) as total_cost'))
                    //     ->whereBetween(DB::raw('to_char(created_at, \'YYYY\')'), [$request['start_date'], $request['end_date']])
                    //     ->groupBy('id_item')
                    //     ->get();
                }
            }
        }
        if ($request['filter'] == 'order') {
            foreach ($historyList as $history) {
                // echo $history;
                $item = item::where('id_item', $history->id_item)->get()->first();
                array_push($label, $item->title_item);
                array_push($data, $history->number);
                $dataAnalysis->labels = $label;
                $dataAnalysis->data = $data;
            }
        }
        if ($request['filter'] == 'cost') {
            foreach ($historyList as $history) {
                // echo $history;
                $item = item::where('id_item', $history->id_item)->get()->first();
                array_push($label, $item->title_item);
                array_push($data, $history->cost_order);
                $dataAnalysis->labels = $label;
                $dataAnalysis->data = $data;
            }
        }
        return $dataAnalysis;
    }
}
