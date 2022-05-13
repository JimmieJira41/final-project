<?php

namespace App\Exports;

use Carbon\Carbon;

use App\Models\order;
use App\Models\customer;
use App\Models\address;
use App\Models\item;
use App\Models\subOrder;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithColumnWidths;
use Maatwebsite\Excel\Concerns\FromCollection;

class CheckReportExport implements FromCollection, WithHeadings, WithColumnWidths
{

    protected $delivery_date;
    /**
     * @return \Illuminate\Support\Collection
     */
    function __construct($request)
    {
        $this->delivery_date = $request->delivery_date;
    }

    public function headings(): array
    {
        return
            [
                'ชื่อลูกค้า',
                'รายการสินค้า',
                'จำนวนรวม'

            ];
    }
    public function collection()
    {
        $itemList = [];
        $collection = collect();
        $orderListResponse = [];
        $idItemList = [];
        $detail = (object)[];

        $orderList = order::where('status_order', false)
            ->whereDate('delivery_date', $this->delivery_date)
            ->get(['id_order', 'name_customer', 'id_sub_order', 'status_payment', 'total_cost_order'])->sortByDesc('delivery_date');
        foreach ($orderList as $order) {
            foreach (explode(",", $order->id_sub_order) as $idSubOrder) {
                $subOrder = subOrder::where('id_sub_order', $idSubOrder)->get(['id_item', 'number'])->first();
                $item = item::where('id_item', $subOrder->id_item)->get(['title_item'])->first();
                $item->number = $subOrder->number;
                array_push($itemList, $item);
            }
            $order->item = $itemList;

            $detail->{'ชื่อลูกค้า'} = $order->name_customer;
            foreach ($itemList as $item) {
                $detail->{'รายการสินค้า'} = $item->title_item;
                $detail->{'จำนวนรวม'} = $item->number;
                $collection->push($detail);
                $detail = (object)['ชื่อลูกค้า' => ''];
            }
            $itemList = [];
        }

        $detail = (object)[
            [

                'ชื่อลูกค้า' => '',
                'รายการสินค้า' => '',
                'จำนวนรวม' => ''
            ],
            [
                'ชื่อลูกค้า' => '',
                'รายการสินค้า' => 'รายการสินค้า',
                'จำนวนรวม' => 'จำนวนรวม'
            ]
        ];
        $collection->push($detail);

        $orders = order::where('delivery_date', $this->delivery_date)->get('id_sub_order');
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
                    if (!in_array($subOrder->id_item, $idItemList)) {
                        $subOrder->item = $item;
                        array_push($idItemList, $subOrder->id_item);
                        array_push($orderListResponse, $subOrder);
                    } else {
                        $index = array_search($subOrder->id_item, $idItemList);
                        $orderListResponse[$index]->total_number += 1;
                    }
                }
            }
        }
        foreach ($orderListResponse as $order) {
            $detail = (object)[
                '' => '',
                'รายการสินค้า' => $order->item[0]->description_item,
                'จำนวนรวม' =>  $order->total_number
            ];
            $collection->push($detail);
        }

        return $collection;
    }
    public function columnWidths(): array
    {
        return [
            'A' => 15,
            'B' => 40,
            'C' => 15
        ];
    }
}
