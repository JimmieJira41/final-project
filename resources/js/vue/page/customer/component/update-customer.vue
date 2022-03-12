<template>
    <div class="container card borderless shadow p-3">
        <form class="form-group">
            <h3>ข้อมูลลูกค้า</h3>
            <div class="row">
                <div class="col-12 col-sm-12 col-md-6 col-lg-4 col-xl-4">
                    <label for="firstname_customer">ชื่อ</label>
                    <input
                        v-model="firstname_customer"
                        type="text"
                        class="form-control"
                        id="firstname_customer"
                        placeholder=""
                    />
                </div>
                 <div class="col-12 col-sm-12 col-md-6 col-lg-4 col-xl-4">
                    <label for="lastname_customer">นามสกุล</label>
                    <input
                        v-model="lastname_customer"
                        type="text"
                        class="form-control"
                        id="lastname_customer"
                        placeholder=""
                    />
                </div>
                <div class="col-12 col-sm-12 col-md-6 col-lg-4 col-xl-4">
                    <label for="tel_customer">เบอร์โทรศัพท์</label>
                    <input
                        v-model="tel_customer"
                        type="tel"
                        class="form-control"
                        id="tel_customer"
                        placeholder=""
                    />
                </div>
                <h3 class="my-3">ข้อมูลที่อยู่</h3>
                <div class="col-12">
                    <label for="description_address_customer">รายละเอียด</label>
                     <textarea
                        v-model="description_address_customer"
                        type="textarea"
                        class="form-control"
                        id="description_address_customer"
                        placeholder="บ้านเลขที่ ชื่อตึก จุดสังเกต"
                    />
                </div>
                <div class="col-12 col-sm-12 col-md-6 col-lg-3 col-xl-3">
                    <label for="province_address_customer">จังหวัด</label>
                     <input
                        v-model="province_address_customer"
                        type="text"
                        class="form-control"
                        id="province_address_customer"
                        placeholder=""
                    />
                    <!-- <select>
                        <option></option>
                    </select> -->
                </div>
                <div class="col-12 col-sm-12 col-md-6 col-lg-3 col-xl-3">
                    <label for="amphure_address_customer">อำเภอ</label>
                     <input
                        v-model="amphure_address_customer"
                        type="text"
                        class="form-control"
                        id="amphure_address_customer"
                        placeholder=""
                    />
                    <!-- <select>
                        <option></option>
                    </select> -->
                </div>
                <div class="col-12 col-sm-12 col-md-6 col-lg-3 col-xl-3">
                    <label for="tombon_address_customer">ตำบล</label>
                     <input
                        v-model="tombon_address_customer"
                        type="text"
                        class="form-control"
                        id="tombon_address_customer"
                        placeholder=""
                    />
                    <!-- <select>
                        <option></option>
                    </select> -->
                </div>
                <div class="col-12 col-sm-12 col-md-6 col-lg-3 col-xl-3">
                    <label for="zipcode_address_customer">รหัสไปรษณี</label>
                     <input
                        v-model="zipcode_address_customer"
                        type="text"
                        class="form-control"
                        id="zipcode_address_customer"
                        placeholder=""
                    />
                    <!-- <select>
                        <option></option>
                    </select> -->
                </div>
            </div>            
        </form>
        <div class="my-3 text-end">
            <button class="btn btn-primary mx-1 col-1" v-on:click="submitCreateCustomer()">ยืนยัน</button>
            <button class="btn btn-danger mx-1 col-1" v-on:click="this.$router.go(-1)">ยกเลิก</button>
        </div>
    </div>
</template>
<script>
export default {
    data: function(){
        return {
            firstname_customer: "",
            lastname_customer: "",
            tel_customer: "",
            description_address: "",
            province_address: "",
            amphure_address: "",
            tombon_address: "",
            zipcode_address: ""
        }    
    },methods:{
        getCustomerById(customerId){
            axios.post('/api/customer/get-customer/'+customerId).then((response)=>{
                if(response) {
                this.firstname_customer = response.data[0].firstname_customer,
                this.lastname_customer = response.data[0].lastname_customer,
                this.tel_customer = response.data[0].tel_customer
                // description_address = response.data[0].description_address,
                // province_address = response.data[0].province_address,
                // amphure_address = response.data[0].amphure_address,
                // tombon_address = response.data[0].tombon_address,
                // zipcode_address = response.data[0].zipcode_address
                    }
            })
        },
        submitUpdateCustomer(){
         const body = {};
         body.firstname_customer = this.firstname_customer;
         body.lastname_customer = this.lastname_customer;
         body.tel_customer = this.tel_customer;
         body.default_id_address = 1;
         body.id_addresses = 1;
        //  body.description_address_customer = this.description_address_customer;
        //  body.province_address_customer = this.province_address_customer;
        //  body.amphure_address_customer = this.amphure_address_customer;
        //  body.tombon_address_customer = this.tombon_address_customer;
        //  body.zipcode_address_customer = this.zipcode_address_customer;
         console.log(body);
            this.$swal({
                title: "แจ้งเตือน",
                text: "คุณต้องการสร้างสต็อกสินค้าใหม่ ใช่หรือไม่ ?",
                icon: "warning",
                showCancelButton: true,
                confirmButtonText: 'ยืนยัน',
                cancelButtonText: 'ยกกเลิก',
                reverseButtons: true
            }).then((result) => {
                if(result.isConfirmed){
                    axios.post('/api/customer/update-customer', body).then((response)=>{
                        if(response) {

                        }
                    })
                }  
            })
        }
    },
    mounted(){
        this.id_customer = this.$route.params.id;
        this.getCustomerById(this.id_customer);
    }
};
</script>
<style scoped>
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}

/* Firefox */
input[type=number] {
  -moz-appearance: textfield;
}
label{
    margin-top: 0.5em;
    margin-bottom: 0.5em;
}
</style>