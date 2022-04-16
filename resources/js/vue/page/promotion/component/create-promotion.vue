<template>
  <div class="container card borderless shadow p-3">
    <form class="form-group">
      <h3>ข้อมูลโปรโมชั่น</h3>
      <hr />
      <div class="row p-3">
        <div class="col">
          <label for="title_promotion">ชื่อโปรโมชั่น</label>
          <input
            v-model="title_promotion"
            type="text"
            class="form-control"
            id="title_promotion"
            placeholder="กรอกชื่อโปรโมชั่น"
          />
        </div>
        <div class="col">
          <label for="number_promotion">จำนวนที่ใช้ (กิโลกรัม)</label>
          <input
            v-model="number_promotion"
            type="number"
            class="form-control"
            id="number_promotion"
            placeholder="กรอกจำนวนสินค้าที่่ใช้"
          />
        </div>
      </div>
    </form>
    <div class="text-end">
      <button class="btn btn-primary col-2 mx-2" v-on:click="submitNewPromotion()">ยืนยัน</button>
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
      title_promotion: "",
      number_promotion: ""
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
