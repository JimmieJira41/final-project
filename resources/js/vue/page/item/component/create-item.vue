<template>
  <div class="container card borderless shadow p-3">
    <form class="form-group">
      <h3>ข้อมูลรายการสินค้า</h3>
      <div class="row p-3">
        <div class="col-12 col-sm-12 col-md-6 col-lg-3 col-xl-3">
          <label for="title_item">ชื่อสินค้า</label>
          <input
            v-model="title_item"
            type="text"
            class="form-control text-center"
            id="title_item"
            placeholder="กรุณากรอกชื่อสินค้า"
          />
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-3 col-xl-3">
          <label for="description_item">รายละเอียด</label>
          <input
            v-model="description_item"
            type="text"
            class="form-control text-center"
            id="description_item"
            placeholder="กรุณากรอกรายละเอียดสินค้า"
          />
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-3 col-xl-3">
          <label for="cost_item">ราคา</label>
          <input
            v-model="cost_item"
            type="text"
            class="form-control text-center"
            id="cost_item"
            placeholder="กรุณากรอกราคาสินค้า"
          />
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-3 col-xl-3">
          <label for="id_stock">สต็อกสินค้าที่ใช้</label>
          <select
            class="form-select"
            v-model="id_stock"
            id="id_stock"
            placeholder="กรุณาเลือกสต็อกที่ต้องการใช้"
          >
            <option class="text-center" value="null">
              กรุณาเลือกสต็อกที่ต้องการใช้
            </option>
            <option
              v-for="(stock, index) in stock_list"
              v-bind:key="index"
              v-bind:value="stock.id_stock"
              class="text-center"
            >
              {{ stock.title_stock }}
            </option>
          </select>
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-3 col-xl-3">
          <label for="total_use">จำนวนสินค้าต่อกล่อง</label>
          <input
            v-model="total_use"
            type="number"
            class="form-control text-center"
            id="total_use"
            placeholder="กรุณากรอกจำนวนสินค้า"
          />
        </div>
      </div>
    </form>
    <div class="row">
      <div class="col-lg-12 col-md-12 col-sm-12 col-12 my-3 text-end">
        <button
          class="btn btn-primary mx-1"
          v-on:click="submitCreateitem()"
        >
          ยืนยัน
        </button>
        <button class="btn btn-danger mx-1">
          <router-link to="/item">ยกเลิก</router-link>
        </button>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data: function () {
    return {
      title_item: "",
      description_item: "",
      cost_item: "",
      id_stock: null,
      total_use: "",
      stock_list: [],
    };
  },
  methods: {
    getAllStock() {
      axios.get("/api/stock/get-all-stock").then((response) => {
        if (response) {
          this.stock_list = response.data;
        }
      });
    },
    submitCreateitem() {
      const itemObj = {};
      itemObj.title_item = this.title_item;
      itemObj.description_item = this.description_item;
      itemObj.cost_item = this.cost_item;
      itemObj.id_stock = this.id_stock;
      itemObj.total_use = this.total_use;
      console.log(itemObj);
      this.$swal({
        title: "แจ้งเตือน",
        text: "คุณต้องการสร้างสต็อกสินค้าใหม่ ใช่หรือไม่ ?",
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: "ยืนยัน",
        cancelButtonText: "ยกกเลิก",
      }).then((result) => {
        if (result.isConfirmed) {
          axios.post("/api/item/new-item", itemObj).then((response) => {
            if (response) {
              this.$router.go(-1);
            }
          });
        }
      });
    },
  },
  mounted() {
    this.getAllStock();
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
</style>
