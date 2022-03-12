<template>
<div>
    <div class="table-response card shadow border-0 p-3">
        <div class="row">
            <div class="col-6 m-0">รายการสั่งซื้อ</div>
            <div class="col-6 m-0">
                <div class="btn btn-primary">ออเดอร์ทั้งหมด</div>
                <div class="btn btn-warning">แบ่งตามรายการสินค้า</div>
                <div class="btn btn-success">แบ่งตามรายชื่อลูกค้า</div>
            </div>
        </div>
        <table class="table table-borderless">
            <thead>
                <tr>
                    <th scope="row">รหัส</th>
                    <th scope="row">รายละเอียด</th>
                    <th scope="row">จำนวน (กล่อง)</th>
                    <th scope="row">เวลาสร้างออเดอร์</th>
                    <!-- <th scope="row">Create At</th> -->
                    <th class="text-center" scope="row" colspan="3">จัดการ</th>
                </tr>
            </thead>
            <tbody v-if="isTableReady">
                <tr v-for="(order, index) in orderList" v-bind:key="index">
                    <td>{{order.id_order}}</td>
                    <td>{{ order.item[0].description_item }}</td>
                    <td>{{ order.number }}</td>
                    <td>{{ order.created_at }}</td>
                    <!-- <td>{{ admin.created_at }}</td> -->
                    <!-- <td class="text-center" v-on:click="viewDetailOrder(order.id_order)"><i class="fas fa-eye"></i></td> -->
                    <td class="text-center" ><router-link :to="'/order/update-order/'+order.id_customer+'/'+order.id_order+'/'+order.id_item"><i class="fas fa-cog"></i></router-link></td>
                    <td class="text-center" v-on:click="deleteOrder(order.id_order)"><i class="fas fa-trash-alt"></i></td>
                </tr>
            </tbody>    
        </table>
        <div class="btn-option-feature text-end">
            <div class="btn btn-primary m-1" v-on:click="cutOffOrder()">ตัดรอบรายการสั่งซื้อ</div>
            <div class="btn btn-warning m-1">พิมพ์ใบปะหน้า</div>
        </div>
    </div>
</div>
</template>
<script>
export default{
    data: function(){
        return {
            isTableReady : false,
            orderList : [],
            order: Object
        }
    },
    methods:{
        getAllOrder(){
            axios.get("/api/order/get-all-order")
            .then((response) =>{
                this.orderList = response.data;   
                this.isTableReady = true;     
            })
        },
        viewDetailOrder(orderId){
            axios.get("/api/order/search-order/"+orderId)
            .then((response) =>{
                this.order = response.data;   
                console.table(this.order);     
            })  
        },
        deleteOrder(orderId){
            this.$swal({
                title: "แจ้งเตือน",
                text: "คุณต้องการลบรายการสั่งซื้อ ใช่หรือไม่ ?",
                icon: "warning",
                showCancelButton: true,
                confirmButtonText: 'ยืนยัน',
                cancelButtonText: 'ยกเลิก',
                reverseButtons: true
            }).then((result) => {
                if(result.isConfirmed){
                    axios.delete("/api/order/delete-order/", {data: { "id_order" : orderId}})
                    .then((response) =>{
                    this.getAllOrder()
                    })  
                }
            })
        },cutOffOrder(){
            axios.post("/api/order/cut-off-order")
            .then((response) =>{
                console.log("cut off order processing");  
            })  
        }
    },
    mounted(){
        this.getAllOrder()
    }
}
</script>