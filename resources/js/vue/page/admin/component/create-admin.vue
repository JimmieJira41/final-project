<template>
  <div class="container card borderless shadow p-3">
    <form class="form-group">
      <h3>ข้อมูลพนักงาน</h3>
      <hr />
      <div class="row p-3">
        <div class="col">
          <label for="email">ชื่อบัญชี</label>
          <input
            v-model="email"
            type="text"
            class="form-control"
            id="email"
            placeholder="กรอกชื่อบัญชี"
          />
        </div>
        <div class="col">
          <label for="password">รหัสผ่าน</label>
          <input
            v-model="password"
            type="password"
            class="form-control"
            id="password"
            placeholder="กรอกรหัสผ่าน"
          />
        </div>
        <div class="col">
          <label for="password_confirmation">ยืนยันรหัสผ่าน</label>
          <input
            v-model="password_confirmation"
            type="password"
            class="form-control"
            id="password_confirmation"
            placeholder="กรอกรหัสผ่านเพื่อยืนยัน"
          />
        </div>
        <div class="col">
          <label for="permission">สิทธิ์การเข้าถึง</label>
          <select
            v-model="id_permission"
            class="form-select"
            aria-label="permission"
            placeholder="เลือกสิทธิ์การเข้าถึง"
          >
            <!-- <option selected> </option> -->
            <option value="1">พนักงาน</option>
            <option value="2">เจ้าของร้าน</option>
          </select>
        </div>
      </div>
      <div class="row p-3">
        <div class="col-4">
          <label for="firstname">ชื่อ</label>
          <input
            v-model="firstname"
            type="text"
            class="form-control"
            id="firstname"
            placeholder="กรอกชื่อ"
          />
        </div>
        <div class="col-4">
          <label for="lastname">นามสกุล </label>
          <input
            v-model="lastname"
            type="text"
            class="form-control"
            id="lastname"
            placeholder="กรอกนามสกุล"
          />
        </div>
        <div class="col-4">
          <label for="tel">เบอร์โทรศัพท์ </label>
          <input
            v-model="tel"
            type="tel"
            class="form-control"
            id="tel"
            placeholder="กรอกเบอร์โทรศัพท์"
          />
        </div>
      </div>
    </form>
    <div class="row">
      <div class="col-lg-12 col-md-12 col-sm-12 col-12 my-3 text-end">
        <button class="btn btn-primary mx-2" v-on:click="submitNewAdmin()">
          ยืนยัน
        </button>
        <button class="btn btn-secondary" v-on:click="this.$router.go(-1)">
          ยกเลิก
        </button>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data: function () {
    return {
      email: "",
      password: "",
      password_confirmation: "",
      firstname: "",
      lastname: "",
      tel: "",
      id_permission: "",
      headers: {
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer " + this.$cookies.get("token"),
        },
      },
    };
  },
  methods: {
    submitNewAdmin() {
      const body = {
        email: this.email,
        password: this.password,
        password_confirmation: this.password_confirmation,
        name: this.firstname + " " + this.lastname,
        tel: this.tel,
        id_permission: this.id_permission,
      };
      this.$swal({
        title: "แจ้งเตือน",
        text: "คุณต้องการสร้างรายการพนักงาน ใช่หรือไม่ ?",
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: "ยืนยัน",
        cancelButtonText: "ยกเลิก",
      }).then((result) => {
        if (result.isConfirmed) {
          axios
            .post("/api/admin/new-admin", body, this.headers)
            .then((response) => {
              if (response) {
                this.$swal({
                  title: "สร้างรายการพนักงานสำเร็จ",
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
  },
};
</script>
