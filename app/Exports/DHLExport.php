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

class DHLExport implements FromCollection, WithHeadings, WithColumnWidths
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
            'เลขบัญชีที่รับสินค้า',
            'ช่องทางการขาย',
            'รหัสการจัดส่ง',
            'รหัสบริการจัดส่ง',
            'บริษัท',
            'ชื่อผู้รับ',
            'ที่อยู่บรรทัดที่ 1',
            'ที่อยู่บรรทัดที่ 2',
            'ที่อยู่บรรทัดที่ 3',
            'เขต (อำเภอ)',
            'จังหวัด',
            'รหัสไปรษณีย์',
            'รหัสประเทศปลายทาง',
            'หมายเลขโทรศัพท์',
            'อีเมล์',
            'น้ำหนักสินค้า (กรัม)',
            'ความยาว (ซม)',
            'ความกว้าง (ซม)',
            'ความสูง (ซม)',
            'สกุลเงิน',
            'ยอดรวมมูลค่าสินค้า',
            'ประกัน',
            'มูลค่าการทำประกัน',
            'เก็บเงินปลายทาง',
            'มูลค่าการเก็บเงินปลายทาง',
            'รายละเอียดการจัดส่ง',
            'หมายเหตุ',
            'ชื่อบริษัทผู้จัดส่ง',
            'ชื่อผู้จัดส่ง',
            'ที่อยู่ผู้จัดส่งบรรทัดที่ 1',
            'ที่อยู่ผู้จัดส่งบรรทัดที่ 2',
            'ที่อยู่ผู้จัดส่งบรรทัดที่ 3',
            'เขต (อำเภอ) ผู้จัดส่ง',
            'จังหวัดผู้จัดส่ง',
            'รหัสไปรษณีย์ผู้จัดส่ง',
            'รหัสประเทศปลายทางผู้จัดส่ง',
            'หมายเลขโทรศัพท์ผู้จัดส่ง',
            'อีเมล์ผู้จัดส่ง',
            'รหัสบริการส่งคืนสินค้า',
            'ชื่อบริษัทที่ส่งคืน',
            'ชื่อที่ส่งคืน',
            'ที่อยู่ที่ส่งคืนบรรทัดที่ 1',
            'ที่อยู่ที่ส่งคืนบรรทัดที่ 2',
            'ที่อยู่ที่ส่งคืนบรรทัดที่ 3',
            'เขต (อำเภอ) ที่ส่งคืน',
            'จังหวัดที่ส่งคืน',
            'รหัสไปรษณีย์ที่ส่งคืน',
            'รหัสประเทศปลายทางที่ส่งคืน',
            'หมายเลขโทรศัพท์ที่ส่งคืน',
            'อีเมล์ที่ส่งคืน',
            'บริการ 1',
            'บริการ 2',
            'กระบวนการ Handover',
            'โหมดการส่งคืนของ',
            'การอ้างอิงการเรียกเก็บเงิน 1',
            'การอ้างอิงการเรียกเก็บเงิน 2',
            'IsMult',
            'ตัวเลือกการจัดส่ง',
            'รหัสชิ้น',
            'คำอธิบายรายชิ้น',
            'น้ำหนักรายชิ้น',
            'การเรียกเก็บเงินปลายทางรายชิ้น',
            'มูลค่าการทำประกันรายชิ้น',
            'การอ้างอิงการเรียกเก็บเงินรายชิ้น 1',
            'การอ้างอิงการเรียกเก็บเงินรายชิ้น 2'
        ];
    }
    public function collection()
    {
        $time = Carbon::now("Asia/Bangkok");
        $day = substr("0" . $time->day, -2);
        $month = substr("0" . $time->month, -2);
        $year = substr(strval($time->year + 543), -2);
        // array_slice($year,2,1);
        $date = strval($day . "" . $month . "" . $year . "kw");
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
                    $line1 = strval($address->description_address . ' ต.' . $address->tombon_address);
                    $detail = (object)
                    [
                        'เลขบัญชีที่รับสินค้า' => '5285619212',
                        'ช่องทางการขาย' => '',
                        'รหัสการจัดส่ง' => $date . substr("0" . sizeof($collection) + 1, -2),
                        'รหัสบริการจัดส่ง' => 'PDO',
                        'บริษัท' => '',
                        'ชื่อผู้รับ' => $name,
                        'ที่อยู่บรรทัดที่ 1' => $line1,
                        'ที่อยู่บรรทัดที่ 2' => strval($item->title_item),
                        'ที่อยู่บรรทัดที่ 3' => '',
                        'เขต (อำเภอ)' => strval($address->amphure_address),
                        'จังหวัด' => strval($address->province_address),
                        'รหัสไปรษณีย์' => strval($address->zipcode_address),
                        'รหัสประเทศปลายทาง' => 'TH',
                        'หมายเลขโทรศัพท์' => strval($customer->tel_customer),
                        'อีเมล์' => '',
                        'น้ำหนักสินค้า (กรัม)' => '100',
                        'ความยาว (ซม)' => '',
                        'ความกว้าง (ซม)' => '',
                        'ความสูง (ซม)' => '',
                        'สกุลเงิน' => 'THB',
                        'ยอดรวมมูลค่าสินค้า' => '',
                        'ประกัน' => '',
                        'มูลค่าการทำประกัน' => '',
                        'เก็บเงินปลายทาง' => '',
                        'มูลค่าการเก็บเงินปลายทาง' => '',
                        'รายละเอียดการจัดส่ง' => '',
                        'หมายเหตุ' => '',
                        'ชื่อบริษัทผู้จัดส่ง' => '',
                        'ชื่อผู้จัดส่ง' => '',
                        'ที่อยู่ผู้จัดส่งบรรทัดที่ 1' => '',
                        'ที่อยู่ผู้จัดส่งบรรทัดที่ 2' => '',
                        'ที่อยู่ผู้จัดส่งบรรทัดที่ 3' => '',
                        'เขต (อำเภอ) ผู้จัดส่ง' => '',
                        'จังหวัดผู้จัดส่ง' => '',
                        'รหัสไปรษณีย์ผู้จัดส่ง' => '',
                        'รหัสประเทศปลายทางผู้จัดส่ง' => '',
                        'หมายเลขโทรศัพท์ผู้จัดส่ง' => '',
                        'อีเมล์ผู้จัดส่ง' => '',
                        'รหัสบริการส่งคืนสินค้า' => '',
                        'ชื่อบริษัทที่ส่งคืน' => '',
                        'ชื่อที่ส่งคืน' => '',
                        'ที่อยู่ที่ส่งคืนบรรทัดที่ 1' => '',
                        'ที่อยู่ที่ส่งคืนบรรทัดที่ 2' => '',
                        'ที่อยู่ที่ส่งคืนบรรทัดที่ 3' => '',
                        'เขต (อำเภอ) ที่ส่งคืน' => '',
                        'จังหวัดที่ส่งคืน' => '',
                        'รหัสไปรษณีย์ที่ส่งคืน' => '',
                        'รหัสประเทศปลายทางที่ส่งคืน' => '',
                        'หมายเลขโทรศัพท์ที่ส่งคืน' => '',
                        'อีเมล์ที่ส่งคืน' => '',
                        'บริการ 1' => '',
                        'บริการ 2' => '',
                        'กระบวนการ Handover' => '',
                        'โหมดการส่งคืนของ' => '',
                        'การอ้างอิงการเรียกเก็บเงิน 1' => '',
                        'การอ้างอิงการเรียกเก็บเงิน 2' => '',
                        'IsMult' => '',
                        'ตัวเลือกการจัดส่ง' => '',
                        'รหัสชิ้น' => '',
                        'คำอธิบายรายชิ้น' => '',
                        'น้ำหนักรายชิ้น' => '',
                        'การเรียกเก็บเงินปลายทางรายชิ้น' => '',
                        'มูลค่าการทำประกันรายชิ้น' => '',
                        'การอ้างอิงการเรียกเก็บเงินรายชิ้น 1' => '',
                        'การอ้างอิงการเรียกเก็บเงินรายชิ้น 2'
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
            'A' => 15,
            'B' => 0,
            'C' => 13,
            'D' => 6,
            'E' => 0,
            'F' => 24,
            'G' => 55,
            'H' => 37,
            'I' => 0,
            'J' => 16,
            'K' => 16,
            'L' => 16,
            'M' => 7,
            'N' => 13,
            'O' => 0,
            'P' => 7,
            'Q' => 0,
            'R' => 0,
            'S' => 0,
            'T' => 7,
            'U' => 0,
            'V' => 0,
            'W' => 0,
            'X' => 11,
            'Y' => 16,
            'Z' => 0,
            'AA' => 0,
            'AB' => 0,
            'AC' => 0,
            'AD' => 0,
            'AE' => 0,
            'AF' => 0,
            'AG' => 0,
            'AH' => 0,
            'AI' => 0,
            'AJ' => 0,
            'AK' => 0,
            'AL' => 0,
            'AM' => 0,
            'AN' => 0,
            'AO' => 0,
            'AP' => 0,
            'AQ' => 0,
            'AR' => 0,
            'AS' => 0,
            'AT' => 0,
            'AU' => 0,
            'AV' => 0,
            'AW' => 0,
            'AX' => 0,
            'AY' => 0,
            'AZ' => 0,
            'BA' => 0,
            'BB' => 0,
            'BC' => 0,
            'BD' => 0,
            'BE' => 7,
            'BF' => 16,
            'BG' => 7,
            'BH' => 0,
            'BI' => 0,
            'BJ' => 0,
            'BK' => 0,
            'BL' => 0,
            'BM' => 0,
        ];
    }
}
