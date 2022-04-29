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



class KerryExport implements FromCollection, WithHeadings, WithColumnWidths
{
    /**
     * @return \Illuminate\Support\Collection
     */
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
        $key = "";
        $time = Carbon::now("Asia/Bangkok");
        $month = substr("0" . $time->month, -2);
        $year = substr(strval($time->year + 543), -2);
        // array_slice($year,2,1);
        $date = strval($time->day . "" . $month . "" . $year . "kw");
        $orderList = order::where('status_order', false)->get();
        $collection = collect();
        foreach ($orderList as $order) {
            $customer = customer::where('id_customer', $order->id_customer)->get()->first();
            $name = strval($customer->firstname_customer . ' ' . $customer->lastname_customer);
            foreach (explode(",", $order->id_sub_order) as $idSubOrder) {
                $subOrder = subOrder::find($idSubOrder);
                $item = item::where('id_item', $subOrder['id_item'])->get()->first();
                $address = address::where('id_address', $customer->default_id_address)->get()->first();
                for ($i = 1; $i <= $subOrder['number']; $i++) {
                    $line1 = strval($address->description_address . ' ต.' . $address->tombon_address);
                    $detail = (object)
                    [
                        'No' => sizeof($collection) + 1,
                        'Recipient Name' => $name,
                        'Mobile No.' => strval($customer->tel_customer),
                        'Email' => '',
                        'Address #1' => strval($address->description_address),
                        'Address #2' => strval('ต.'.$address->tombon_address.' อ.'.$address->amphure_address.' จ.'.$address->province_address),
                        'Zip Code' => strval($address->zipcode_address),
                        'COD Amt (Baht)' => '',
                        'Remark' => strval($item->title_item),
                        'Ref #1' => '',
                        'Ref #2' => '',
                        'Sender Ref' => '',
                    ];
                    // [
                    //     'เลขบัญชีที่รับสินค้า' => '5285619212',
                    //     'ช่องทางการขาย' => '',
                    //     'รหัสการจัดส่ง' => $date . sizeof($collection) + 1,
                    //     'รหัสบริการจัดส่ง' => 'PDO',
                    //     'บริษัท' => '',
                    //     'ชื่อผู้รับ' => $name,
                    //     'ที่อยู่บรรทัดที่ 1' => $line1,
                    //     'ที่อยู่บรรทัดที่ 2' => strval($item->title_item),
                    //     'ที่อยู่บรรทัดที่ 3' => '',
                    //     'เขต (อำเภอ)' => strval($address->amphure_address),
                    //     'จังหวัด' => strval($address->province_address),
                    //     'รหัสไปรษณีย์' => strval($address->zipcode_address),
                    //     'รหัสประเทศปลายทาง' => 'TH',
                    //     'หมายเลขโทรศัพท์' => strval($customer->tel_customer),
                    //     'อีเมล์' => '',
                    //     'น้ำหนักสินค้า (กรัม)' => '100',
                    //     'ความยาว (ซม)' => '',
                    //     'ความกว้าง (ซม)' => '',
                    //     'ความสูง (ซม)' => '',
                    //     'สกุลเงิน' => 'THB',
                    //     'ยอดรวมมูลค่าสินค้า' => '',
                    //     'ประกัน' => '',
                    //     'มูลค่าการทำประกัน' => '',
                    //     'เก็บเงินปลายทาง' => '',
                    //     'มูลค่าการเก็บเงินปลายทาง' => '',
                    //     'รายละเอียดการจัดส่ง' => '',
                    //     'หมายเหตุ' => '',
                    //     'ชื่อบริษัทผู้จัดส่ง' => '',
                    //     'ชื่อผู้จัดส่ง' => '',
                    //     'ที่อยู่ผู้จัดส่งบรรทัดที่ 1' => '',
                    //     'ที่อยู่ผู้จัดส่งบรรทัดที่ 2' => '',
                    //     'ที่อยู่ผู้จัดส่งบรรทัดที่ 3' => '',
                    //     'เขต (อำเภอ) ผู้จัดส่ง' => '',
                    //     'จังหวัดผู้จัดส่ง' => '',
                    //     'รหัสไปรษณีย์ผู้จัดส่ง' => '',
                    //     'รหัสประเทศปลายทางผู้จัดส่ง' => '',
                    //     'หมายเลขโทรศัพท์ผู้จัดส่ง' => '',
                    //     'อีเมล์ผู้จัดส่ง' => '',
                    //     'รหัสบริการส่งคืนสินค้า' => '',
                    //     'ชื่อบริษัทที่ส่งคืน' => '',
                    //     'ชื่อที่ส่งคืน' => '',
                    //     'ที่อยู่ที่ส่งคืนบรรทัดที่ 1' => '',
                    //     'ที่อยู่ที่ส่งคืนบรรทัดที่ 2' => '',
                    //     'ที่อยู่ที่ส่งคืนบรรทัดที่ 3' => '',
                    //     'เขต (อำเภอ) ที่ส่งคืน' => '',
                    //     'จังหวัดที่ส่งคืน' => '',
                    //     'รหัสไปรษณีย์ที่ส่งคืน' => '',
                    //     'รหัสประเทศปลายทางที่ส่งคืน' => '',
                    //     'หมายเลขโทรศัพท์ที่ส่งคืน' => '',
                    //     'อีเมล์ที่ส่งคืน' => '',
                    //     'บริการ 1' => '',
                    //     'บริการ 2' => '',
                    //     'กระบวนการ Handover' => '',
                    //     'โหมดการส่งคืนของ' => '',
                    //     'การอ้างอิงการเรียกเก็บเงิน 1' => '',
                    //     'การอ้างอิงการเรียกเก็บเงิน 2' => '',
                    //     'IsMult' => '',
                    //     'ตัวเลือกการจัดส่ง' => '',
                    //     'รหัสชิ้น' => '',
                    //     'คำอธิบายรายชิ้น' => '',
                    //     'น้ำหนักรายชิ้น' => '',
                    //     'การเรียกเก็บเงินปลายทางรายชิ้น' => '',
                    //     'มูลค่าการทำประกันรายชิ้น' => '',
                    //     'การอ้างอิงการเรียกเก็บเงินรายชิ้น 1' => '',
                    //     'การอ้างอิงการเรียกเก็บเงินรายชิ้น 2'
                    // ];
                    // [
                    //     'เลขบัญชีที่รับสินค้า' => '5285619212',
                    //     'รหัสการจัดส่ง' => $date.sizeof($collection)+1,
                    //     'รหัสบริการจัดส่ง' => 'PDO',
                    //     'ชื่อผู้รับ' => $name,
                    //     'ที่อยู่บรรทัดที่ 1' => $line1,
                    //     'ที่อยู่บรรทัดที่ 2' => strval($item->title_item),
                    //     'ที่อยู่บรรทัดที่ 3' => '',
                    //     'เขต (อำเภอ)' => strval($address->amphure_address),
                    //     'จังหวัด' => strval($address->province_address),
                    //     'รหัสไปรษณีย์' => strval($address->zipcode_address),
                    //     'รหัสประเทศปลายทาง' => 'TH',
                    //     'หมายเลขโทรศัพท์' => strval($customer->tel_customer),
                    //     'น้ำหนักสินค้า (กรัม)' => '100',
                    //     'สกุลเงิน' => 'THB',
                    //     'เก็บเงินปลายทาง' => '',
                    //     'มูลค่าการเก็บเงินปลายทาง' => '',
                    //     'IsMult' => '',
                    //     'ตัวเลือกการจัดส่ง' => '',
                    //     'รหัสชิ้น' => ''
                    // ];
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
