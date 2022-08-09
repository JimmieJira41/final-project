<?php

namespace App\Http\Controllers;

use App\Exports\SummaryReport;
use App\Models\order;
use App\Models\stock;
use App\Models\subOrder;
use App\Models\item;
use App\Models\response;
use App\Models\details_report;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Facades\Excel;


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
                echo ($history);
                $item = item::where('id_item', $history->id_item)->get('title_item')->first();
                echo "title : ".$item->title_item;
                array_push($label, $item->title_item);
                array_push($data, $history->number);
                $dataAnalysis->labels = $label;
                $dataAnalysis->data = $data;
            }
        }
        if ($request['filter'] == 'cost') {
            foreach ($historyList as $history) {
                // echo $history;
                $item = item::where('id_item', $history->id_item)->get('title_item')->first();
                array_push($label, $item->title_item);
                array_push($data, $history->cost_order);
                $dataAnalysis->labels = $label;
                $dataAnalysis->data = $data;
            }
        }
        return $dataAnalysis;
    }

    public function getTotalUseStock(Request $request)
    {
        $stockList = [];
        $orderListResponse = new response();
        $idStockList = [];
        $totalOrderNumber = 0;
        $totalSale = 0;
        $orders = order::where('delivery_date', $request->keyword)->get(['id_sub_order', 'total_cost_order']);
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
                    $item = item::where('id_item', $subOrder->id_item)->get()->first();
                    $stocks = explode(",", $item->id_stock);
                    $countStock = sizeof($stocks);
                    foreach ($stocks as $id_stock) {
                        $total_used = ($item->total_use * $subOrder->total_number) / $countStock;
                        if (!in_array($id_stock, $idStockList)) {
                            // $subOrder->item = $item;
                            $stock = stock::where('id_stock', $id_stock)->get(['id_stock', 'title_stock', 'total_stock'])->first();
                            $stock->total_used = $total_used;
                            array_push($idStockList, $id_stock);
                            array_push($stockList, $stock);
                            // $totalOrderNumber += 1;
                        } else {
                            $index = array_search($id_stock, $idStockList);
                            $stockList[$index]->total_used += $total_used;
                            // $totalOrderNumber += 1;
                        }
                    }
                }
            }
            $totalSale = $totalSale + $order->total_cost_order;
        }
        // $orderListResponse->total_order_number = $totalOrderNumber;
        $orderListResponse->order_list = $stockList;
        $orderListResponse->total_sale = $totalSale;

        return response()->json($orderListResponse);
    }

    public function exportSummaryReport(Request $request)
    {
        return Excel::download(new SummaryReport($request), 'Summary.xlsx');
    }

    public function getDetailReport()
    {
        $detail_report = details_report::orderBy('id_detail_report', 'asc')->get();
        return response()->json($detail_report);
    }

    public function getDetailReportById(Request $request)
    {
        $detail_report = details_report::where('id_detail_report', $request->keyword)->get()->first();
        return response()->json($detail_report);
    }


    public function createDetailReport(Request $request)
    {
        $detail_report = new details_report();
        // if (!$request->id_detail_report) {
        //     return response()->json(['ไม่พบรหัสรายการที่ต้องการแก้ไข', 401]);
        // }
        if (!$request->title) {
            return response()->json(['กรุณากรอกชื่อรายการ', 401]);
        }
        if (!$request->type) {
            return response()->json(['กรุณาเลือกประเภทรายการ', 401]);
        }
        if (!$request->status_default) {
            $detail_report->status_default = false;
        } else {
            $detail_report->status_default = $request->status_default;
        }
        // $detail_report->id_detail_report = $request->id_detail_report;
        $detail_report->title = $request->title;
        $detail_report->type = $request->type;
        $detail_report->save();
        return response()->json(['สร้างรายการรายรับ-รายจ่ายสำเร็จ', 200]);
    }
    public function updateDetailReport(Request $request)
    {
        $detail_report = details_report::where('id_detail_report', $request->id_detail_report)->get()->first();
        if (!$request->id_detail_report) {
            return response()->json(['ไม่พบรหัสรายการที่ต้องการแก้ไข', 401]);
        }
        if (!$request->title) {
            return response()->json(['กรุณากรอกชื่อรายการ', 401]);
        }
        if (!$request->type) {
            return response()->json(['กรุณาเลือกประเภทรายการ', 401]);
        }
        if (!$request->status_default) {
            $detail_report->status_default = false;
        } else {
            $detail_report->status_default = $request->status_default;
        }
        $detail_report->id_detail_report = $request->id_detail_report;
        $detail_report->title = $request->title;
        $detail_report->type = $request->type;
        if($detail_report->update()){
            return response()->json(['อัพเดรตรายการรายรับ-รายจ่ายสำเร็จ', 200]);
        }else{
            return response()->json(['อัพเดรตรายการรายรับ-รายจ่ายไม่สำเร็จ', 500]);

        }
    }
    public function deleteDetailReport(Request $request)
    {
        if (!$request->id_detail_report) {
            return response()->json(['ไม่พบรหัสรายการที่ต้องการลบ', 401]);
        }
        $detail_report = details_report::where('id_detail_report', $request->id_detail_report)->get()->first();
        echo ($detail_report);
        if($detail_report->delete()){
            return response()->json(['ลบรายการ'.' '.$detail_report->title.' ประเภท '.$detail_report->type.' สำเร็จ!', 200]);
        }else{
            return response()->json(['ลบรายการ'.' '.$detail_report->title.' ประเภท '.$detail_report->type.' ไม่สำเร็จ!', 500]);

        }
    }
}
