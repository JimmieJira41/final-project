<template>
    <div class="table-response card shadow border-0 p-3">
        <h3>รายการสต็อกสินค้า</h3>
        <table class="table table-borderless">
            <thead>
                <tr>
                    <th scope="row">รายการ</th>
                    <th scope="row">รายละเอียด</th>
                    <th scope="row">จำนวนคงเหลือ</th>
                    <th class="text-center" scope="row" colspan="3">จัดการ</th>
                </tr>
            </thead>
            <tbody v-if="isTableReady">
                <tr v-for="(stock, index) in stockList" v-bind:key="index">
                    <td>{{ stock.title_stock }}</td>
                    <td>{{ stock.description_stock }}</td>
                    <td>{{ stock.total_stock }}</td>
                    <!-- <td>{{ admin.created_at }}</td> -->
                    <td class="text-center" v-on:click="viewDetailStock(stock.id_stock)"><i class="fas fa-eye"></i></td>
                    <td class="text-center" ><router-link :to="'/stock/update-stock/'+stock.id_stock"><i class="fas fa-cog"></i></router-link></td>
                    <td class="text-center" v-on:click="deleteStock(stock.id_stock)"><i class="fas fa-trash-alt"></i></td>
                </tr>
            </tbody>    
        </table>
    </div>
</template>
<script>
export default{
    data: function(){
        return {
            isTableReady : false,
            stockList : [],
            stock: Object
        }
    },
    methods:{
        getAllStock(){
            axios.get("/api/stock/get-all-stock")
            .then((response) =>{
                this.stockList = response.data;   
                this.isTableReady = true;     
            })
        },
        // editDetailStock(stockId){
        //     this.$router.push({ name: 'UpdateStock', params: {id: stockId}});
        // },
        viewDetailStock(stockId){
            axios.get("/api/stock/search-stock/"+stockId)
            .then((response) =>{
                this.stock = response.data;   
                console.table(this.stock);     
            })  
        },
        deleteStock(stockId){
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
                    axios.delete("/api/stock/delete-stock/", {data: { "id_stock" : stockId}})
                    .then((response) =>{
                    this.getAllStock()
                    })  
                }
            })
        }
    },
    mounted(){
        this.getAllStock()
    }
}
</script>