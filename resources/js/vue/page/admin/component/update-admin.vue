<template>
  <div class="container card borderless shadow p-3">
    <form class="form-group">
      <h3>ข้อมูลพนักงาน</h3>
      <hr />
      <div class="row p-3">
        <div class="col">
          <label for="username_admin">ชื่อบัญชี</label>
          <input
            v-model="username_admin"
            type="text"
            class="form-control"
            id="username_admin"
            placeholder="กรอกชื่อบัญชี"
          />
        </div>
        <div class="col">
          <label for="password_admin">รหัสผ่าน</label>
          <input
            v-model="password_admin"
            type="password"
            class="form-control"
            id="password_admin"
            placeholder="กรอกรหัสผ่าน"
          />
        </div>
        <div class="col">
          <label for="permission_admin">สิทธิ์การเข้าถึง</label>
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
          <label for="firstname_admin">ชื่อ</label>
          <input
            v-model="firstname_admin"
            type="text"
            class="form-control"
            id="firstname_admin"
            placeholder="กรอกชื่อ"
          />
        </div>
        <div class="col-4">
          <label for="lastname_admin">นามสกุล </label>
          <input
            v-model="lastname_admin"
            type="text"
            class="form-control"
            id="lastname_admin"
            placeholder="กรอกนามสกุล"
          />
        </div>
        <div class="col-4">
          <label for="tel_admin">เบอร์โทรศัพท์ </label>
          <input
            v-model="tel_admin"
            type="tel"
            class="form-control"
            id="tel_admin"
            placeholder="กรอกเบอร์โทรศัพท์"
          />
        </div>
      </div>
    </form>
    <div class="text-end">
      <button class="btn btn-primary col-2 mx-2" v-on:click="submitUpdateAdmin()">
        ยืนยัน
      </button>
      <button class="btn btn-secondary col-2" v-on:click="this.$router.go(-1)">
        ยกเลิก
      </button>
    </div>
  </div>
</template>
<script>
export default {
  data: function () {
    return {
      id_admin: "",
      username_admin: "",
      password_admin: "",
      firstname_admin: "",
      lastname_admin: "",
      tel_admin: "",
      id_permission: "",
    };
  },
  methods: {
    getAdminById(adminId) {
      console.log("pass get admin");
      axios.get("/api/admin/get-admin/" + adminId).then((response) => {
        if (response) {
          let name = response.data.name_admin.split(" ");        
          this.username_admin = response.data.username_admin;
          this.password_admin = response.data.password_admin;
          this.firstname_admin = name[0];
          this.lastname_admin = name[1];
          this.tel_admin = response.data.tel_admin;
        }
      });
    },
    submitUpdateAdmin() {
      const body = {
        id_admin: this.id_admin,
        username_admin: this.username_admin,
        password_admin: this.password_admin,
        name_admin: this.firstname_admin + " " + this.lastname_admin,
        tel_admin: this.tel_admin,
        id_permission: this.id_permission,
      };
      this.$swal({
        title: "แจ้งเตือน",
        text: "คุณต้องการอัพเดรตข้อมูลพนักงาน ใช่หรือไม่ ?",
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: "ยืนยัน",
        cancelButtonText: "ยกเลิก",
      }).then((result) => {
        if (result.isConfirmed) {
          axios.put("/api/admin/update-admin", body).then((response) => {
            if (response) {
              this.$swal({
                title: "อัพเดรตข้อมูลพนักงานสำเร็จ",
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
  mounted() {
    this.id_admin = this.$route.params.id;
    this.getAdminById(this.id_admin);
  },
};
</script>
