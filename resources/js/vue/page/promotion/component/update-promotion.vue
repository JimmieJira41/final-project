<template>
  <div class="container">
    <div>
      <h2 class="mb-4">แก้ไขรายการโปรโมชั่น</h2>
    </div>
    <div class="card borderless shadow p-3">
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
            v-on:click="submitUpdatePromotion()"
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
export default {
  data: function () {
    return {
      id_promotion: "",
      title_promotion: "",
      number_promotion: "",
      headers: {
        headers: {
          "Content-Type": "application/json",
          Authorization: "Bearer " + this.$cookies.get("token"),
        },
      },
    };
  },
  methods: {
    getPromotionByIdPromotion() {
      axios
        .get(
          "/api/promotion/get-promotion-by-id/" + this.id_promotion,
          this.headers
        )
        .then((response) => {
          if (response) {
            this.title_promotion = response.data.title_promotion;
            this.number_promotion = response.data.number_promotion;
          }
        });
    },
    submitUpdatePromotion() {
      const body = {
        id_promotion: this.id_promotion,
        title_promotion: this.title_promotion,
        number_promotion: this.number_promotion,
      };
      this.$swal({
        title: "แจ้งเตือน",
        text: "คุณต้องการแก้ไขโปรโมชั่น ใช่หรือไม่ ?",
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: "ยืนยัน",
        cancelButtonText: "ยกเลิก",
      }).then((result) => {
        if (result.isConfirmed) {
          axios
            .post("/api/promotion/update-promotion", body, this.headers)
            .then((response) => {
              if (response) {
                this.$swal({
                  title: "แก้ไขโปรโมชั่นสำเร็จ",
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
    this.id_promotion = this.$route.params.id;
    this.getPromotionByIdPromotion();
  },
};
</script>
