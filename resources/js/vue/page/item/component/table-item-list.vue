<template>
    <div class="table-response card shadow border-0 p-3">
        <h3>รายการสินค้า</h3>
        <hr>
        <table class="table table-borderless">
            <thead>
                <tr>
                    <th scope="row">รายการ</th>
                    <th scope="row">รายละเอียด</th>
                    <th scope="row">จำนวนที่ใช้</th>
                    <!-- <th scope="row">Create At</th> -->
                    <th class="text-center" scope="row" colspan="3">จัดการ</th>
                </tr>
            </thead>
            <tbody v-if="isTableReady">
                <tr v-for="(item, index) in itemList" v-bind:key="index">
                    <td>{{ item.title_item }}</td>
                    <td>{{ item.description_item }}</td>
                    <td>{{ item.total_use}}</td>
                    <!-- <td>{{ admin.created_at }}</td> -->
                    <td class="text-center" v-on:click="viewDetailItem(item.id_item)"><i class="fas fa-eye"></i></td>
                    <td class="text-center" ><router-link :to="'/item/update-item/'+item.id_item"><i class="fas fa-cog"></i></router-link></td>
                    <td class="text-center" v-on:click="deleteItem(item.id_item)"><i class="fas fa-trash-alt"></i></td>
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
            itemList : [],
            item: Object
        }
    },
    methods:{
        getAllItem(){
            axios.get("/api/item/get-all-item")
            .then((response) =>{
                this.itemList = response.data;   
                this.isTableReady = true;     
            })
        },
        viewDetailItem(itemId){
            axios.get("/api/item/search-item/"+itemId)
            .then((response) =>{
                this.item = response.data;   
                console.table(this.item);     
            })  
        },
        deleteItem(itemId){
            this.$swal({
                title: "แจ้งเตือน",
                text: "คุณต้องการลบบัญชีพนักงาน ใช่หรือไม่ ?",
                icon: "warning",
                showCancelButton: true,
                confirmButtonText: 'ยืนยัน',
                cancelButtonText: 'ยกเลิก',
                reverseButtons: true
            }).then((result) => {
                if(result.isConfirmed){
                    axios.delete("/api/item/delete-item/", {data: { "id_item" : itemId}})
                    .then((response) =>{
                    this.getAllItem()
                    })  
                }
            })
        }
    },
    mounted(){
        this.getAllItem()
    }
}
</script>