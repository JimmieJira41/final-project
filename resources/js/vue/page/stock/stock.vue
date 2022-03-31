<template>
    <div class="container">
        <div class="text-center">
            <h1>จัดการข้อมูลสต็อก</h1>
        </div>
        <div class="text-end pb-2">
            <button class="btn btn-primary" type="button"><router-link to="/stock/craete-stock">สร้างรายการสต็อกสินค้า</router-link></button>
        </div> 
        <TableStockList></TableStockList>
    </div>
</template>
<script>
import TableStockList from './component/table-stock-list.vue'
export default{
    components:{
        'TableStockList' : TableStockList
    },
    data: function () {
    return {
      side_bar: true,
    };
  },
}
</script>