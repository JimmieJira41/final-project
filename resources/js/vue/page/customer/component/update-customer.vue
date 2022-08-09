<template>
  <div class="container">
    <div>
      <h2 class="mb-4">แก้ไขรายการลูกค้า</h2>
    </div>
    <div class="card borderless shadow p-3">
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
            <Multiselect
              @select="getAmphuresList()"
              v-model="province_id_selected"
              :searchable="true"
              valueProp="id"
              label="name_th"
              trackBy="name_th"
              :options="province_list"
              placeholder="กรุณาเลือกจังหวัด"
            />
          </div>
          <div class="col-12 col-sm-12 col-md-6 col-lg-3 col-xl-3">
            <label for="amphure_address_customer">อำเภอ</label>
            <Multiselect
              @select="getTombonsList()"
              v-model="amphure_id_selected"
              :searchable="true"
              valueProp="id"
              label="name_th"
              trackBy="name_th"
              :options="amphure_list"
              placeholder="กรุณาเลือกอำเภอ"
              noOptionsText="กรุณาเลือกจังหวัดก่อนเลือกอำเภอ"
            />
          </div>
          <div class="col-12 col-sm-12 col-md-6 col-lg-3 col-xl-3">
            <label for="tombon_address_customer">ตำบล</label>
            <Multiselect
              @select="setTombon()"
              v-model="tombon_id_selected"
              :searchable="true"
              valueProp="id"
              label="name_th"
              trackBy="name_th"
              :options="tombon_list"
              placeholder="กรุณาเลือกตำบล"
              noOptionsText="กรุณาเลือกอำเภอก่อนเลือกตำบล"
            />
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
          </div>
        </div>
      </form>
      <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-12 my-3 text-end">
          <button
            class="btn btn-primary mx-2"
            v-on:click="submitUpdateCustomer()"
          >
            ยืนยัน
          </button>
          <button class="btn btn-danger" v-on:click="this.$router.go(-1)">
            ยกเลิก
          </button>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import Multiselect from "@vueform/multiselect";
export default {
  components: {
    Multiselect,
  },
  data: function () {
    return {
      id_customer: "",
      firstname_customer: "",
      lastname_customer: "",
      tel_customer: "",
      default_id_address: "",
      id_address: "",
      description_address_customer: "",
      province_address_customer: "",
      amphure_address_customer: "",
      tombon_address_customer: "",
      zipcode_address_customer: "",
      province_id_selected: null,
      province_list: [],
      amphure_id_selected: null,
      amphure_list: [],
      tombon_id_selected: null,
      tombon_list: [],
      headers: {
        headers: {
          "Content-Type": "application/json",
          Authorization: "Bearer " + this.$cookies.get("token"),
        },
      },
    };
  },
  methods: {
    getCustomerById(customerId) {
      axios
        .get("/api/customer/get-customer/" + customerId, this.headers)
        .then((response) => {
          if (response) {
            this.firstname_customer = response.data.firstname_customer;
            this.lastname_customer = response.data.lastname_customer;
            this.tel_customer = response.data.tel_customer;
            this.default_id_address = response.data.default_id_address;
            this.description_address_customer =
              response.data.address.description_address;
            this.province_address_customer =
              response.data.address.province_address;
            this.amphure_address_customer =
              response.data.address.amphure_address;
            this.tombon_address_customer = response.data.address.tombon_address;
            this.zipcode_address_customer =
              response.data.address.zipcode_address;
          }
        });
    },
    submitUpdateCustomer() {
      const body = {};
      body.id_customer = this.id_customer;
      body.firstname_customer = this.firstname_customer;
      body.lastname_customer = this.lastname_customer;
      body.tel_customer = this.tel_customer;
      body.default_id_address = this.default_id_address;
      body.id_address = this.default_id_address;
      body.description_address = this.description_address_customer;
      body.province_address = this.province_address_customer;
      body.amphure_address = this.amphure_address_customer;
      body.tombon_address = this.tombon_address_customer;
      body.zipcode_address = this.zipcode_address_customer;
      console.log(body);
      this.$swal({
        title: "แจ้งเตือน",
        text: "คุณต้องการแก้ไขรายการลูกค้า ใช่หรือไม่ ?",
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: "ยืนยัน",
        cancelButtonText: "ยกเลิก",
      }).then((result) => {
        if (result.isConfirmed) {
          axios
            .put("/api/customer/update-customer", body, this.headers)
            .then((response) => {
              if (response) {
                this.$swal({
                  title: "แก้ไขรายการลูกค้าสำเร็จ",
                  icon: "success",
                  confirmButtonText: "ยืนยัน",
                }).then((result) => {
                  this.$router.go(-1);
                });
              }
            });
        }
      });
    },
    // getProvinces(province_address_customer) {
    //   axios.get("/api/address/get-all-province").then((response) => {
    //     if (response) {
    //       this.province_list = response.data;
    //       this.province_list.forEach((province) => {
    //         if (province.name_th === province_address_customer) {
    //           this.province_id_selected = province.id;
    //         }
    //       });
    //       console.log("จังหวัด: " + this.province_address_customer);
    //       getAmphures(this.province_id_selected);
    //     }
    //   });
    // },
    getProvinces() {
      axios
        .get("/api/address/get-all-province", this.headers)
        .then((response) => {
          if (response) {
            this.province_list = response.data;
            this.province_list.forEach((province) => {
              if (province.name_th == this.province_address_customer) {
                this.province_id_selected = province.id;
              }
            });
            console.log("จังหวัด: " + this.province_address_customer);
            this.getAmphures(this.province_id_selected);
          }
        });
    },
    getAmphures(province_id) {
      axios
        .get("/api/address/get-amphures/" + province_id, this.headers)
        .then((response) => {
          if (response) {
            this.amphure_list = response.data;
            this.amphure_list.forEach((amphure) => {
              if (amphure.name_th == this.amphure_address_customer) {
                this.amphure_id_selected = amphure.id;
              }
            });
            console.log("อำเภอ: " + this.amphure_address_customer);
            this.getTombons(this.amphure_id_selected);
          }
        });
    },
    getAmphuresList() {
      this.amphure_id_selected = null;
      this.tombon_id_selected = null;
      axios
        .get(
          "/api/address/get-amphures/" + this.province_id_selected,
          this.headers
        )
        .then((response) => {
          if (response) {
            this.amphure_list = response.data;
            console.log("จังหวัด : " + this.province_address_customer);
          }
        });
    },
    getTombonsList() {
      this.tombon_id_selected = null;
      axios
        .get(
          "/api/address/get-tombons/" + this.amphure_id_selected,
          this.headers
        )
        .then((response) => {
          if (response) {
            this.tombon_list = response.data;
            console.log(this.tombon_list);
          }
        });
    },
    getTombons(amphure_id) {
      axios
        .get("/api/address/get-tombons/" + amphure_id, this.headers)
        .then((response) => {
          if (response) {
            this.tombon_list = response.data;
            this.tombon_list.forEach((tombon) => {
              if (tombon.name_th == this.tombon_address_customer) {
                this.tombon_id_selected = tombon.id;
              }
            });
            console.log(this.tombon_list);
          }
        });
    },
    setTombon() {
      this.tombon_list.forEach((tombon) => {
        if (tombon.id == this.tombon_id_selected) {
          this.tombon_address_customer = tombon.name_th;
          this.zipcode_address_customer = tombon.zip_code;
        }
      });
      this.getZipcode(this.tombon_id_selected);
    },
    getZipcode(tombon_id) {
      axios
        .get("/api/address/get-zipcode/" + tombon_id, this.headers)
        .then((response) => {
          if (response) {
            this.zipcode_address_customer = response.data[0].zipcode;
          }
        });
    },
    setSelectAddress() {
      console.log("pass");
      this.province_list.forEach((province) => {
        console.log("จังหวัด :" + province.name_th);
        if (province.name_th == this.province_address_customer) {
          console.log("pass");
          this.province_id_selected = province.id;
          this.getAmphures();
          console.log(this.province_id_selected);
          console.log(this.amphure_list);
        }
      });
      this.amphure_list.forEach((amphure) => {
        console.log("จังหวัด :" + amphure.name_th);
        if (amphure.name_th == this.amphure_address_customer) {
          console.log("pass");
          this.amphure_id_selected = amphure.id;
          this.getTombons();
        }
      });
      this.tombon_list.forEach((tombon) => {
        if (tombon.name_th == this.tombon_address_customer) {
          console.log("pass");
          this.tombon_id_selected = tombon.id;
          this.getZipcode();
        }
      });
    },
  },
  beforeMount() {
    this.id_customer = this.$route.params.id;
    this.getCustomerById(this.id_customer);
    this.getProvinces();
  },
  mounted() {
    this.setSelectAddress();
  },
};
</script>
<style scoped>
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}

/* Firefox */
input[type="number"] {
  -moz-appearance: textfield;
}
label {
  margin-top: 0.5em;
  margin-bottom: 0.5em;
}
</style>
