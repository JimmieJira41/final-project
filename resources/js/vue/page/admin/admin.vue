<template>
    <div class="container">
       <div>
            <h1 class="text-center">จัดการข้อมูลพนักงาน</h1>
       </div>
        <div class="text-end pb-2">
            <button class="btn btn-primary" type="button"><router-link to="/admin/craete-admin">สร้างรายการสั่งซื้อ</router-link></button>
        </div>   
        <TableAdminList></TableAdminList>
    </div>
</template>
<script>
import TableAdminList from './component/table-admin-list.vue'
export default{
    components:{
        'TableAdminList' : TableAdminList,
    },
}
</script>