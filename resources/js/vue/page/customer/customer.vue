<template>
    <div class="container">
        <div>
            <h1 class="text-center">จัดการข้อมูลลูกค้า</h1>
        </div>
        <div class="text-end pb-2">
            <button class="btn btn-primary" type="button"><router-link to="/customer/craete-customer">สร้างรายการลูกค้า</router-link></button>
        </div> 
        <div>
            <TableCustomerList></TableCustomerList>
        </div>
    </div>
</template>
<script> 
import TableCustomerList from './component/table-customer-list.vue'
export default{
    components:{
        'TableCustomerList' : TableCustomerList
    },
}
</script>
