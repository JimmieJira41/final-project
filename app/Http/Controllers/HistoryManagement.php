<?php

namespace App\Http\Controllers;


use App\Models\order;
use App\Models\subOrder;
// use App\Models\historyResponse;
use App\Models\item;

use Illuminate\Http\Request;


class HistoryManagement extends Controller
{
    // public function getHistoryByCustomerId(Request $request)
    // {
    //     $historyResponse = new historyResponse();
    //     $historyList = history::where('id_customer', $request->keyword)->get();
    //     foreach($historyList as $history){
    //         $item = item::where('id_item', $history->id_item)->get()->first();
    //         $history->item = $item;
    //     }
    //     $historyResponse->count = sizeof($historyList);
    //     $historyResponse->historyList = $historyList;

    //     return response()->json($historyResponse);
    // }

    public function getAllHistoryOrder()
    {
        $itemList = [];
        $orderList = order::where('status_order', true)->get(['id_order', 'name_customer', 'id_sub_order', 'status_payment', 'total_cost_order'])->sortByDesc('created_at');
        foreach ($orderList as $order) {
            foreach (explode(",", $order->id_sub_order) as $idSubOrder) {
                $subOrder = subOrder::where('id_sub_order', $idSubOrder)->get(['id_item', 'number'])->first();
                $item = item::where('id_item', $subOrder->id_item)->get(['title_item'])->first();
                $item->number = $subOrder->number;
                array_push($itemList, $item);
            }
            $order->item = $itemList;
            $itemList = [];
        }
        return response()->json($orderList);
    }
}
