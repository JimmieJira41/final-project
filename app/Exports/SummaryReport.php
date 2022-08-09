<?php

namespace App\Exports;

use App\Models\order;
use App\Models\item;
use App\Models\stock;
use App\Models\response;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithColumnWidths;
use Maatwebsite\Excel\Concerns\FromCollection;

class SummaryReport implements FromCollection, WithHeadings, WithColumnWidths
{

    protected $delivery_date;
    protected $detail_list;
    /**
     * @return \Illuminate\Support\Collection
     */
    function __construct($request)
    {
        $this->delivery_date = $request->delivery_date;
        $this->detail_list = $request->detail_list;
    }

    public function headings(): array
    {
        return
            [
                'รายการ',
                'จำนวนเงิน',
                '',
                'รายการสต็อก',
                'จำนวนที่ใช้',
                'จำนวนคงเหลือ',

            ];
    }
    public function collection()
    {
        $collection = collect();
        $total_expenses = 0;
        foreach ($this->detail_list as $detail) {
            $content = (object)[];
            // print_r($detail);
            $content->{'รายการ'} = $detail['header'];
            $content->{'จำนวนเงิน'} = $detail['value'];
            if ($detail['header'] != 'รายได้ทั้งหมด') {
                $total_expenses += $detail['value'];
            }
            $collection->push($content);
        }
        $content = (object)[
            'รายการ' => 'รวมทั้งหมด',
            'จำนวนเงิน' => $total_expenses
        ];
        $collection->push($content);

        $stockList = [];
        $orderListResponse = new response();
        $idStockList = [];
        $totalOrderNumber = 0;
        $totalSale = 0;
        $orders = order::where('delivery_date', $this->delivery_date)->get(['id_sub_order', 'total_cost_order']);
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
                            $stock = stock::where('id_stock', $id_stock)->get(['id_stock', 'title_stock', 'total_stock'])->first();
                            $stock->total_used = $total_used;
                            array_push($idStockList, $id_stock);
                            array_push($stockList, $stock);
                        } else {
                            $index = array_search($id_stock, $idStockList);
                            $stockList[$index]->total_used += $total_used;
                        }
                    }
                }
            }
            $totalSale = $totalSale + $order->total_cost_order;
        }
        $sizeCollection = sizeof($collection);
        // echo($sizeCollection);
        foreach ($stockList as $index => $stock) {
            $content = (object)[
                'รายการ' => '',
                'จำนวนเงิน' => '',
                '' => '',
                'รายการสต็อก' => $stock->title_stock,
                'จำนวนที่ใช้' => $stock->total_used,
                'จำนวนคงเหลือ' => $stock->total_stock
            ];
            if ($sizeCollection > $index && $sizeCollection != 0) {
                $collection[$index]->{''} = '';
                $collection[$index]->{'รายการสต็อก'} = $stock->title_stock;
                $collection[$index]->{'จำนวนที่ใช้'} = $stock->total_used;
                $collection[$index]->{'จำนวนคงเหลือ'} = $stock->total_stock;
            } else {
                $collection->push($content);
            }
        }
        // print_r($collection);
        return $collection;
    }
    public function columnWidths(): array
    {
        return [
            'A' => 25,
            'B' => 20,
            'D' => 25,
            'E' => 20,
            'F' => 20,
        ];
    }
}
