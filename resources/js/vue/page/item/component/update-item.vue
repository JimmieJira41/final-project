<template>
  <div class="container">
    <div>
      <h2 class="mb-4">สร้างรายการสินค้า</h2>
    </div>
    <div class="card borderless shadow p-3">
      <form class="form-group">
        <div class="row">
          <div class="col-6">
            <h3>ข้อมูลรายการสินค้า</h3>
          </div>
          <div class="col-6 text-end">
            <div class="btn btn-primary" v-on:click="addMultiStock()">
              เพิ่มช่องสต็อก
            </div>
          </div>
        </div>
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
            <label for="total_use">จำนวน</label>
            <input
              v-model="total_use"
              type="number"
              class="form-control text-center"
              id="total_use"
              placeholder=""
            />
          </div>
          <div class="col-12 col-sm-12 col-md-6 col-lg-3 col-xl-3">
            <div v-for="(stock, index) in stack_stock" v-bind:key="index">
              <label for="id_stock">สต็อกสินค้าที่ใช้ #{{ index + 1 }}</label>
              <select
                class="form-select"
                v-model="id_stock[index]"
                id="id_stock"
                name="id_stock"
                placeholder="กรุณาเลือกสต็อกที่ต้องการใช้"
                v-on:select="log()"
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
            <!-- <label for="id_stock">สต็อกสินค้าที่ใช้</label>
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
          </select> -->
          </div>
          <!-- <div class="col-12 col-sm-12 col-md-6 col-lg-3 col-xl-3">
          <label for="id_stock">สต็อกสินค้าที่ใช้</label>
          <input
            v-model="id_stock"
            type="number"
            class="form-control text-center"
            id="id_stock"
            placeholder=""
          />
        </div> -->
        </div>
      </form>
      <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-12 my-3 text-end">
          <button class="btn btn-primary mx-1" v-on:click="submitUpdateitem()">
            ยืนยัน
          </button>
          <button class="btn btn-danger mx-1">
            <router-link to="/item">ยกเลิก</router-link>
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
      id_item: "",
      title_item: "",
      description_item: "",
      cost_item: "",
      id_stock: [],
      total_use: "",
      stock_list: [],
      stack_stock: 1,
      headers: {
        headers: {
          "Content-Type": "application/json",
          Authorization: "Bearer " + this.$cookies.get("token"),
        },
      },
    };
  },
  methods: {
    addMultiStock() {
      // if (!this.multi_stock) {
      //   this.multi_stock = true;
      // }
      this.stack_stock += 1;
      for (let x = this.id_stock.length; x < this.stack_stock; x++) {
        this.id_stock.push(null);
        console.log(this.id_stock);
      }
      console.log("stack : " + this.stack_stock);
    },
    getItemById(id_item) {
      axios
        .get("/api/item/get-item/" + id_item, this.headers)
        .then((response) => {
          if (response) {
            this.title_item = response.data.title_item;
            this.description_item = response.data.description_item;
            this.cost_item = response.data.cost_item;
            this.id_stock = response.data.id_stock;
            this.stack_stock = this.id_stock.length;
            this.total_use = response.data.total_use;
          }
        });
    },
    getAllStock() {
      axios.get("/api/stock/get-all-stock", this.headers).then((response) => {
        if (response) {
          this.stock_list = response.data;
        }
      });
    },
    submitUpdateitem() {
      const itemObj = {};
      itemObj.id_item = this.id_item;
      itemObj.title_item = this.title_item;
      itemObj.description_item = this.description_item;
      itemObj.cost_item = this.cost_item;
      itemObj.id_stock = this.id_stock;
      itemObj.total_use = this.total_use;
      console.log(itemObj);
      this.$swal({
        title: "แจ้งเตือน",
        text: "คุณต้องการแก้ไขรายการสินค้าใหม่ ใช่หรือไม่ ?",
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: "ยืนยัน",
        cancelButtonText: "ยกเลิก",
      }).then((result) => {
        if (result.isConfirmed) {
          axios
            .put("/api/item/update-item", itemObj, this.headers)
            .then((response) => {
              if (response) {
                this.$swal({
                  title: "แก้ไขรายการสินค้าสำเร็จ",
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
    this.id_item = this.$route.params.id;
    this.getItemById(this.id_item);
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
