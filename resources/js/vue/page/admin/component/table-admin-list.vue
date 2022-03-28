<template>
    <div class="table-response card shadow border-0 p-3">
        <h3>รายการพนักงาน</h3>
        <hr />
        <table class="table table-borderless">
            <thead>
                <tr>
                    <th scope="row">Username</th>
                    <th scope="row">ชื่อ</th>
                    <th scope="row">เบอร์โทรศัพท์</th>
                    <!-- <th scope="row">Create At</th> -->
                    <th class="text-center" scope="row" colspan="3">จัดการ</th>
                </tr>
            </thead>
            <tbody v-if="isTableReady">
                <tr v-for="(admin, index) in adminList" v-bind:key="index">
                    <td>{{ admin.username_admin }}</td>
                    <td>{{ admin.name_admin }}</td>
                    <td>{{ admin.tel_admin }}</td>
                    <!-- <td>{{ admin.created_at }}</td> -->
                    <td class="text-center" v-on:click="viewDetailAdmin(admin.id_admin)"><router-link to="/admin/craete-admin"><i class="fas fa-eye"></i></router-link></td>
                    <td class="text-center" ><i class="fas fa-cog"></i></td>
                    <td class="text-center" v-on:click="deleteAdmin(admin.id_admin)"><i class="fas fa-trash-alt"></i></td>
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
            adminList : [],
            admin: Object
        }
    },
    methods:{
        getAllAdmin(){
            axios.get("/api/admin/get-all-admin")
            .then((response) =>{
                this.adminList = response.data;   
                this.isTableReady = true;     
            })
        },
        viewDetailAdmin(adminId){
            axios.get("/api/admin/search-admin/"+adminId)
            .then((response) =>{
                this.admin = response.data;   
                console.table(this.admin);     
            })  
        },
        deleteAdmin(adminId){
            this.$swal({
                title: "แจ้งเตือน",
                text: "คุณต้องการลบบัญชีพนักงาน ใช่หรือไม่ ?",
                icon: "warning",
                showCancelButton: true,
                confirmButtonText: 'Yes, delete it!',
                cancelButtonText: 'No, cancel!',
                reverseButtons: true
            }).then((result) => {
                if(result.isConfirmed){
                    axios.delete("/api/admin/delete-admin/", {data: { "id_admin" : adminId}})
                    .then((response) =>{
                    this.getAllAdmin()
                    })  
                }
            })
        }
    },
    mounted(){
        this.getAllAdmin()
    }
}
</script>