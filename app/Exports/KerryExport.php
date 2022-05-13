<?php

namespace App\Exports;

use Carbon\Carbon;

use App\Models\order;
use App\Models\customer;
use App\Models\address;
use App\Models\item;
use App\Models\subOrder;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithColumnWidths;
use Maatwebsite\Excel\Concerns\FromCollection;

use function PHPSTORM_META\type;

class KerryExport implements FromCollection, WithHeadings, WithColumnWidths
{

    protected $delivery_date;
    protected $id_order_list = [];
    /**
     * @return \Illuminate\Support\Collection
     */
    function __construct($request)
    {
        $this->delivery_date = $request->delivery_date;
        $this->id_order_list = $request->id_order_list;
    }

    public function headings(): array
    {
        return [
            'No',
            'Recipient Name',
            'Mobile No.',
            'Email',
            'Address #1',
            'Address #2',
            'Zip Code',
            'COD Amt (Baht)',
            'Remark',
            'Ref #1',
            'Ref #2',
            'Sender Ref',
        ];
    }
    public function collection()
    {
        $orderList = [];
        if (sizeof($this->id_order_list) == 0) {
            $orderList = order::where('status_order', false)->whereDate('delivery_date', $this->delivery_date)->get();
        } else {
            foreach ($this->id_order_list as $id_order) {
                $order = order::where('status_order', false)->where('id_order', $id_order)->get()->first();
                array_push($orderList, $order);
            }
        }
        $collection = collect();
        foreach ($orderList as $order) {
            $customer = customer::where('id_customer', $order->id_customer)->get()->first();
            $name = strval($customer->firstname_customer . ' ' . $customer->lastname_customer);
            foreach (explode(",", $order->id_sub_order) as $idSubOrder) {
                $subOrder = subOrder::find($idSubOrder);
                $item = item::where('id_item', $subOrder['id_item'])->get()->first();
                $address = address::where('id_address', $customer->default_id_address)->get()->first();
                for ($i = 1; $i <= $subOrder['number']; $i++) {
                    $detail = (object)
                    [
                        'No' => sizeof($collection) + 1,
                        'Recipient Name' => $name,
                        'Mobile No.' => strval($customer->tel_customer),
                        'Email' => '',
                        'Address #1' => strval($address->description_address),
                        'Address #2' => strval('ต.' . $address->tombon_address . ' อ.' . $address->amphure_address . ' จ.' . $address->province_address),
                        'Zip Code' => strval($address->zipcode_address),
                        'COD Amt (Baht)' => '',
                        'Remark' => strval($item->title_item),
                        'Ref #1' => '',
                        'Ref #2' => '',
                        'Sender Ref' => '',
                    ];
                    $collection->push($detail);
                }
            }
        }
        return $collection;
    }
    public function columnWidths(): array
    {
        return [
            'A' => 5,
            'B' => 25,
            'C' => 10,
            'D' => 3,
            'E' => 35,
            'F' => 35,
            'G' => 10,
            'H' => 3,
            'I' => 35,
            'J' => 15,
            'K' => 15,
            'L' => 15
        ];
    }
}
