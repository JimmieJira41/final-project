<?php

namespace App\Http\Controllers;

use App\Models\history;
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
        if (!$request['end_date']) {
            if ($request['filter'] == 'order') {
                if ($request['type'] == 'day') {
                    $historyList = DB::table('histories')
                        ->select('id_item', DB::raw('SUM(number) as total_number'))
                        ->whereDate('created_at', $request['start_date'])
                        ->groupBy('id_item')
                        ->get();
                }
                if ($request['type'] == 'month') {
                    $historyList = DB::table('histories')
                        ->select('id_item', DB::raw('SUM(number) as total_number'))
                        ->whereMonth('created_at', $request['start_date'])
                        ->groupBy('id_item')
                        ->get();
                }
                if ($request['type'] == 'year') {
                    $historyList = DB::table('histories')
                        ->select('id_item', DB::raw('SUM(number) as total_number'))
                        ->whereYear('created_at', $request['start_date'])
                        ->groupBy('id_item')
                        ->get();
                }
            }
            if ($request['filter'] == 'cost') {
                if ($request['type'] == 'day') {
                    $historyList = DB::table('histories')
                        ->select('id_item', DB::raw('SUM(cost_order) as total_cost'))
                        ->whereDate('created_at', $request['start_date'])
                        ->groupBy('id_item')
                        ->get();
                }
                if ($request['type'] == 'month') {
                    $historyList = DB::table('histories')
                        ->select('id_item', DB::raw('SUM(cost_order) as total_cost'))
                        ->whereMonth('created_at', $request['start_date'])
                        ->groupBy('id_item')
                        ->get();
                }
                if ($request['type'] == 'year') {
                    $historyList = DB::table('histories')
                        ->select('id_item', DB::raw('SUM(cost_order) as total_cost'))
                        ->whereYear('created_at', $request['start_date'])
                        ->groupBy('id_item')
                        ->get();
                }
            }
        } else {
            if ($request['filter'] == 'order') {
                if ($request['type'] == 'day') {
                    $historyList = DB::table('histories')
                        ->select('id_item', DB::raw('SUM(number) as total_number'))
                        ->whereBetween(DB::raw('DATE(created_at)'), [$request['start_date'], $request['end_date']])
                        ->groupBy('id_item')
                        ->get();
                }
                if ($request['type'] == 'month') {
                    $historyList = DB::table('histories')
                        ->select('id_item', DB::raw('SUM(number) as total_number'))
                        ->whereBetween(DB::raw('to_char(created_at, \'MM\')'), [$request['start_date'], $request['end_date']])
                        ->groupBy('id_item')
                        ->get();
                }
                if ($request['type'] == 'year') {
                    $historyList = DB::table('histories')
                        ->select('id_item', DB::raw('SUM(number) as total_number'))
                        ->whereBetween(DB::raw('to_char(created_at, \'YYYY\')'), [$request['start_date'], $request['end_date']])
                        ->groupBy('id_item')
                        ->get();
                }
            }
            if ($request['filter'] == 'cost') {
                if ($request['type'] == 'day') {
                    $historyList = DB::table('histories')
                        ->select('id_item', DB::raw('SUM(cost_order) as total_cost'))
                        ->whereBetween(DB::raw('DATE(created_at)'), [$request['start_date'], $request['end_date']])
                        ->groupBy('id_item')
                        ->get();
                }
                if ($request['type'] == 'month') {
                    $historyList = DB::table('histories')
                        ->select('id_item', DB::raw('SUM(cost_order) as total_cost'))
                        ->whereBetween(DB::raw('to_char(created_at, \'MM\')'), [$request['start_date'], $request['end_date']])
                        ->groupBy('id_item')
                        ->get();
                }
                if ($request['type'] == 'year') {
                    $historyList = DB::table('histories')
                        ->select('id_item', DB::raw('SUM(cost_order) as total_cost'))
                        ->whereBetween(DB::raw('to_char(created_at, \'YYYY\')'), [$request['start_date'], $request['end_date']])
                        ->groupBy('id_item')
                        ->get();
                }
            }
        }
        if ($request['filter'] == 'order'){
            foreach ($historyList as $history) {
                $item = item::where('id_item', $history->id_item)->get()->first();
                array_push($label, $item->title_item);
                array_push($data, $history->total_number);
                $dataAnalysis->labels = $label;
                $dataAnalysis->data = $data;
            }
        }
        if ($request['filter'] == 'cost'){
            foreach ($historyList as $history) {
                $item = item::where('id_item', $history->id_item)->get()->first();
                array_push($label, $item->title_item);
                array_push($data, $history->total_cost);
                $dataAnalysis->labels = $label;
                $dataAnalysis->data = $data;
            }
        }
        return $dataAnalysis;
    }
}
