<?php

namespace App\Exports;

use Carbon\Carbon;

use App\Models\order;
use App\Models\customer;
use App\Models\address;
use App\Models\item;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithColumnWidths;
use Maatwebsite\Excel\Concerns\FromCollection;



class CustomerContactExport implements FromCollection, WithHeadings, WithColumnWidths
{
    /**
     * @return \Illuminate\Support\Collection
     */
    public function headings(): array
    {
        return [
            'เลขบัญชีที่รับสินค้า',
            'รหัสการจัดส่ง',
            'รหัสบริการจัดส่ง',
            'ชื่อผู้รับ',
            'ที่อยู่บรรทัดที่ 1',
            'ที่อยู่บรรทัดที่ 2',
            'ที่อยู่บรรทัดที่ 3',
            'เขต (อำเภอ)',
            'จังหวัด',
            'รหัสไปรษณีย์',
            'รหัสประเทศปลายทาง',
            'หมายเลขโทรศัพท์',
            'น้ำหนักสินค้า (กรัม)',
            'สกุลเงิน',
            'เก็บเงินปลายทาง',
            'มูลค่าการเก็บเงินปลายทาง',
            'IsMult',
            'ตัวเลือกการจัดส่ง',
            'รหัสชิ้น'
        ];
    }
    public function collection()
    {
        $time = Carbon::now("Asia/Bangkok");
        $month = substr("0".$time->month,-2);
        $year = substr(strval($time->year+543),-2);
        // array_slice($year,2,1);
        $date = strval($time->day."".$month."".$year."KW");
        $orderList = order::all();
        $collection = collect();
        foreach ($orderList as $order) {
            $customer = customer::where('id_customer', $order->id_customer)->get()->first();
            $name = strval($customer->firstname_customer . ' ' . $customer->lastname_customer);
            // echo ($name);
            $item = item::where('id_item', $order->id_item)->get()->first();
            $address = address::where('id_address', $customer->default_id_address)->get()->first();
            // echo ($address);
            $line1 = strval($address->description_address . ' ต.' . $address->tombon_address);
            $line2 = $item->title;
            // $detail = [
            //     '5285619212',
            //     '',
            //     'PDO',
            //     $name,
            //     $line1,
            //     strval($item->title_item),
            //     '',
            //     strval($address->amphure_address),
            //     strval($address->province_address),
            //     strval($address->zipcode_address),
            //     'TH',
            //     strval($customer->tel_customer),
            //     '100',
            //     'THB',
            //     '',
            //     '',
            //     '',
            //     '',
            //     '',

            // ];
            $detail = (object)[
                'เลขบัญชีที่รับสินค้า' => '5285619212',
                'รหัสการจัดส่ง' => $date,
                'รหัสบริการจัดส่ง' => 'PDO',
                'ชื่อผู้รับ' => $name,
                'ที่อยู่บรรทัดที่ 1' => $line1,
                'ที่อยู่บรรทัดที่ 2' => strval($item->title_item),
                'ที่อยู่บรรทัดที่ 3' => '',
                'เขต (อำเภอ)' => strval($address->amphure_address),
                'จังหวัด' => strval($address->province_address),
                'รหัสไปรษณีย์' => strval($address->zipcode_address),
                'รหัสประเทศปลายทาง' => 'TH',
                'หมายเลขโทรศัพท์' => strval($customer->tel_customer),
                'น้ำหนักสินค้า (กรัม)' => '100',
                'สกุลเงิน' => 'THB',
                'เก็บเงินปลายทาง' => '',
                'มูลค่าการเก็บเงินปลายทาง' => '',
                'IsMult' => '',
                'ตัวเลือกการจัดส่ง' => '',
                'รหัสชิ้น' => ''
            ];
            $collection->push($detail);
            
        }
        return $collection;
    }
    public function columnWidths(): array
    {
        return [
            'A' => 15, 
            'B' => 13,
            'C' => 6,
            'D' => 24,
            'E' => 75,
            'F' => 37,
            'G' => 16,
            'H' => 16,
            'I' => 16,
            'J' => 7,
            'K' => 7,
            'L' => 11,
            'M' => 7,
            'N' => 7,
        ];
    }
}
