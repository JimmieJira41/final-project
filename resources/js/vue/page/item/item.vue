<template>
    <div class="container">
        <div>
            <h1 class="text-center">จัดการข้อมูลสินค้า</h1>
        </div>
        <div class="text-end pb-2">
            <button class="btn btn-primary" type="button"><router-link to="/item/create-item">สร้างรายการสินค้า</router-link></button>
        </div>
        <TableItemList></TableItemList>
    </div>
</template>
<script>
import TableItemList from './component/table-item-list.vue'
export default{
    components:{
        'TableItemList' : TableItemList
    }
}
</script>
