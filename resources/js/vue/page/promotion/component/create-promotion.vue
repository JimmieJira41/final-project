<template>
  <div class="container card borderless shadow p-3">
    <form class="form-group">
      <h3>ข้อมูลโปรโมชั่น</h3>
      <hr />
      <div class="row p-3">
        <div class="col-12 col-sm-12 col-md-6 col-lg-3 col-xl-3">
          <label for="title_promotion">ชื่อโปรโมชั่น</label>
          <input
            v-model="title_promotion"
            type="text"
            class="form-control text-center"
            id="title_promotion"
            placeholder="กรอกชื่อโปรโมชั่น"
          />
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-3 col-xl-3">
          <label for="number_promotion">จำนวนที่ใช้ (กิโลกรัม)</label>
          <input
            v-model="number_promotion"
            type="number"
            class="form-control text-center"
            id="number_promotion"
            placeholder="กรอกจำนวนสินค้าที่่ใช้"
          />
        </div>
      </div>
    </form>
    <div class="row">
      <div class="col-lg-12 col-md-12 col-sm-12 col-12 my-3 text-end">
        <button
          class="btn btn-primary mx-2"
          v-on:click="submitNewPromotion()"
        >
          ยืนยัน
        </button>
        <button
          class="btn btn-danger"
          v-on:click="this.$router.go(-1)"
        >
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
      title_promotion: "",
      number_promotion: "",
    };
  },
  methods: {
    submitNewPromotion() {
      const body = {
        title_promotion: this.title_promotion,
        number_promotion: this.number_promotion,
      };
      this.$swal({
        title: "แจ้งเตือน",
        text: "คุณต้องการสร้างโปรโมชั่น ใช่หรือไม่ ?",
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: "ยืนยัน",
        cancelButtonText: "ยกเลิก",
      }).then((result) => {
        if (result.isConfirmed) {
          axios.post("/api/promotion/new-promotion", body).then((response) => {
            if (response) {
              this.$swal({
                title: "สร้างโปรโมชั่นสำเร็จ",
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
