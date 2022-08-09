<template>
  <div class="container">
    <div>
      <h2 class="mb-4">สร้างรายการลูกค้า</h2>
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
              autocomplete="off"
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
              autocomplete="off"
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
              autocomplete="off"
            />
          </div>
          <div class="col-12 col-sm-12 col-md-6 col-lg-4 col-xl-4">
            <label for="line_customer">Line</label>
            <input
              v-model="line_customer"
              type="text"
              class="form-control"
              id="line_customer"
              placeholder=""
              autocomplete="off"
            />
          </div>
          <div class="col-12 col-sm-12 col-md-6 col-lg-4 col-xl-4">
            <label for="facebook_customer">Facebook</label>
            <input
              v-model="facebook_customer"
              type="tel"
              class="form-control"
              id="facebook_customer"
              placeholder=""
              autocomplete="off"
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
              @select="getAmphures()"
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
              @select="getTombons()"
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
              autocomplete="off"
            />
          </div>
        </div>
      </form>
      <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-12 my-3 text-end">
          <button
            class="btn btn-primary mx-1"
            v-on:click="submitCreateCustomer()"
          >
            ยืนยัน
          </button>
          <button class="btn btn-danger mx-1" v-on:click="this.$router.go(-1)">
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
      firstname_customer: "",
      lastname_customer: "",
      tel_customer: "",
      line_customer: "",
      facebook_customer: "",
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
    submitCreateCustomer() {
      const body = {};
      body.firstname_customer = this.firstname_customer;
      body.lastname_customer = this.lastname_customer;
      body.facebook_contact_customer = this.facebook_customer;
      body.line_contact_customer = this.line_customer;
      body.tel_customer = this.tel_customer;
      body.default_id_address = "";
      body.id_addresses = "";
      body.description_address = this.description_address_customer;
      body.province_address = this.province_address_customer;
      body.amphure_address = this.amphure_address_customer;
      body.tombon_address = this.tombon_address_customer;
      body.zipcode_address = this.zipcode_address_customer;
      console.log(body);
      this.$swal({
        title: "แจ้งเตือน",
        text: "คุณต้องการสร้างรายการลูกค้ารายใหม่ ใช่หรือไม่ ?",
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: "ยืนยัน",
        cancelButtonText: "ยกเลิก",
      }).then((result) => {
        if (result.isConfirmed) {
          axios
            .post("/api/customer/new-customer", body, this.headers)
            .then((response) => {
              if (response) {
                this.$swal({
                  title: "สร้างรายการลูกค้ารายใหม่สำเร็จ",
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
    getProvinces() {
      axios
        .get("/api/address/get-all-province", this.headers)
        .then((response) => {
          if (response) {
            this.province_list = response.data;
            console.log(this.province_list);
          }
        });
    },
    getAmphures() {
      axios
        .get(
          "/api/address/get-amphures/" + this.province_id_selected,
          this.headers
        )
        .then((response) => {
          this.logSeleted();
          if (response) {
            this.amphure_id_selected = null;
            this.amphure_list = response.data;
            this.province_list.forEach((province) => {
              if (province.id == this.province_id_selected) {
                this.province_address_customer = province.name_th;
              }
            });
            console.log("จังหวัด : " + this.province_address_customer);
          }
        });
    },
    getTombons() {
      axios
        .get(
          "/api/address/get-tombons/" + this.amphure_id_selected,
          this.headers
        )
        .then((response) => {
          if (response) {
            this.tombon_id_selected = null;
            this.tombon_list = response.data;
            this.amphure_list.forEach((amphure) => {
              if (amphure.id == this.amphure_id_selected) {
                this.amphure_address_customer = amphure.name_th;
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
    logSeleted() {
      console.log(this.province_id_selected);
    },
  },
  mounted() {
    this.getProvinces();
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
<style src="@vueform/multiselect/themes/default.css"></style>
