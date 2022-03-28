<?php

namespace App\Http\Controllers;


use App\Models\history;
use App\Models\historyResponse;
use App\Models\item;

use Illuminate\Http\Request;


class HistoryManagement extends Controller
{
    public function getHistoryByCustomerId(Request $request)
    {
        $historyResponse = new historyResponse();
        $historyList = history::where('id_customer', $request->keyword)->get();
        foreach($historyList as $history){
            $item = item::where('id_item', $history->id_item)->get()->first();
            $history->item = $item;
        }
        $historyResponse->count = sizeof($historyList);
        $historyResponse->historyList = $historyList;

        return response()->json($historyResponse);
    }

    public function getAllHistoryOrder()
    {
        $historyListResponse = [];
        $historyList = history::all()->sortByDesc('created_at');
        foreach ($historyList as $history) {
            $item = item::where('id_item', $history->id_item)->get();
            $history->item = $item;
            array_push($historyListResponse, $history);
        }
        return response()->json($historyListResponse);
    }


   
}
