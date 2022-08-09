<template>
  <div class="card shadow border-0 p-3">
    <div class="row">
      <div class="col-lg-6 col-md-6 col-sm-12 col-12 m-0 m-0">
        <h3>รายการโปรโมชั่น</h3>
      </div>
    </div>
    <hr />
    <div class="tbody-scroll">
      <table class="table table-borderless">
        <thead>
          <tr>
            <th scope="row">ลำดับ</th>
            <th scope="row">ชื่อโปรโมชั่น</th>
            <th scope="row">จำนวนสินค้าที่ใช้ (กิโลกรัม)</th>
            <th class="text-center" scope="row" colspan="2">จัดการ</th>
          </tr>
        </thead>
        <tbody v-if="promotionList.length">
          <tr v-for="(promotion, index) in promotionList" v-bind:key="index">
            <td>{{ index + 1 }}</td>
            <td>{{ promotion.title_promotion }}</td>
            <td>{{ promotion.number_promotion }}</td>
            <td class="text-center">
              <router-link
                :to="'/promotion/update-promotion/' + promotion.id_promotion"
                ><i class="fas fa-cog"></i
              ></router-link>
            </td>
            <td
              class="text-center"
              v-on:click="deletePromotion(promotion.id_promotion)"
            >
              <i class="fas fa-trash-alt"></i>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>
<script>
export default {
  data: function () {
    return {
      isTablePromotionListReady: false,
      // isTableHistoryOrderListReady: false,
      // isTableOrderListGroupByCustomerReady: false,
      promotionList: [],
      // orderListGroupByCustomer: [],
      // historyList: [],
      order: Object,
      headers: {
        headers: {
          "Content-Type": "application/json",
          Authorization: "Bearer " + this.$cookies.get("token"),
        },
      },
    };
  },
  methods: {
    deletePromotion(idPromotion) {
      this.$swal({
        title: "แจ้งเตือน",
        text: "คุณต้องการลบรายการโปรโมชั่น ใช่หรือไม่ ?",
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: "ยืนยัน",
        cancelButtonText: "ยกเลิก",
      }).then((result) => {
        if (result.isConfirmed) {
          axios
            .delete("/api/promotion/delete-promotion/" + idPromotion, {headers : this.headers.headers})
            .then((response) => {
              if (response) {
                this.$swal({
                  title: "ลบรายการโปรโมชั่นสำเร็จ",
                  icon: "success",
                  confirmButtonText: "ยืนยัน",
                }).then((result) => {
                  this.getAllPromotion();
                });
              }
            });
        }
      });
    },
    getAllPromotion() {
      axios
        .get("/api/promotion/get-all-promotion", this.headers)
        .then((response) => {
          if (response) {
            this.promotionList = response.data;
            this.isTablePromotionListReady = true;
          }
        });
    },
  },
  mounted() {
    this.getAllPromotion();
  },
};
</script>