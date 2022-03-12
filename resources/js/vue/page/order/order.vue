<template>
    <div class="container">
        <div>
            <h1 class="text-center">จัดการรายการสั่งซื้อ</h1>
        </div>
        <div class="text-end pb-2">
            <button class="btn btn-primary" type="button"><router-link to="/order/create-order">สร้างรายการสั่งซื้อ</router-link></button>
        </div>
        <TableOrderList></TableOrderList>
    </div>
</template>
<script>
import TableOrderList from './component/table-order-list.vue'
export default{
    components:{
        'TableOrderList' : TableOrderList
    }
}
</script>
