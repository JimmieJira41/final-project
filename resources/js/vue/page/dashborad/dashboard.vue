<template>
  <div class="container-fiuld px-3">
    <div>
      <h1 class="text-center">แดชบอร์ด</h1>
    </div>
    <div class="row">
      <div class="col-4">
        <div class="card">
          <div class="card-body">
            <div>
              <h4 class="d-flex align-items-center justify-content-around">
                <i class="fas fa-dolly-flatbed fs-2"></i> จำนวนออเดอร์ประจำวัน
              </h4>
            </div>
            <div class="content">
              <h3 class="text-center">{{ totalOrderNumber }}</h3>
            </div>
          </div>
        </div>
      </div>
      <div class="col-4">
        <div class="card">
          <div class="card-body">
            <div>
              <h4 class="d-flex align-items-center justify-content-around">
                <i class="fas fa-calendar-day fs-2"></i> จำนวนออเดอร์ล่วงหน้า
              </h4>
            </div>
            <div class="content">
              <h3 class="text-center">0</h3>
            </div>
          </div>
        </div>
      </div>
      <div class="col-4">
        <div class="card">
          <div class="card-body">
            <div>
              <h4 class="d-flex align-items-center justify-content-around">
                <i class="fas fa-money-bill fs-2"></i>จำนวนรายรับประจำวัน
              </h4>
            </div>
            <div class="content">
              <h3 class="text-center">{{ totalSale }} &#3647;</h3>
            </div>
          </div>
        </div>
      </div>
      <div class="col-12">
        <div class="card my-3">
          <div class="card-body">
            <nav>
              <div class="nav nav-tabs" id="nav-tab" role="tablist">
                <button
                  class="nav-link active"
                  id="nav-home-tab"
                  data-bs-toggle="tab"
                  data-bs-target="#nav-home"
                  type="button"
                  role="tab"
                  aria-controls="nav-home"
                  aria-selected="true"
                >
                  สรุปรายการสั่งซื้อ
                </button>
                <button
                  class="nav-link"
                  id="nav-profile-tab"
                  data-bs-toggle="tab"
                  data-bs-target="#nav-profile"
                  type="button"
                  role="tab"
                  aria-controls="nav-profile"
                  aria-selected="false"
                >
                  สรุปสต็อกคงเหลือ
                </button>
                <button
                  class="nav-link"
                  id="nav-contact-tab"
                  data-bs-toggle="tab"
                  data-bs-target="#nav-contact"
                  type="button"
                  role="tab"
                  aria-controls="nav-contact"
                  aria-selected="false"
                >
                  สรุปสต็อกล่วงหน้า
                </button>
              </div>
            </nav>
            <div class="tab-content" id="nav-tabContent">
              <div
                class="tab-pane fade show active"
                id="nav-home"
                role="tabpanel"
                aria-labelledby="nav-home-tab"
              >
                <div class="table-responsive">
                  <table class="table my-2">
                    <thead class="bg-warning">
                      <tr>
                        <th scope="row">ลำดับ</th>
                        <th scope="row">รายการสินค้า</th>
                        <th scope="row">จำนวน (กล่อง)</th>
                        <!-- <th scope="row">เวลาสร้างออเดอร์</th> -->
                        <!-- <th scope="row">Create At</th> -->
                        <!-- <th class="text-center" scope="row" colspan="3">จัดการ</th> -->
                      </tr>
                    </thead>
                    <tbody v-if="orderList.length">
                      <tr
                        v-for="(order, index) in orderList"
                        v-bind:key="index"
                      >
                        <td>{{ index + 1 }}</td>
                        <td>{{ order.item[0].title_item }}</td>
                        <td>{{ order.total_number }}</td>
                      </tr>
                    </tbody>
                    <tbody v-else>
                      <tr class="text-center">
                        <td class="m-4" colspan="3">
                          <h3>ไม่พบข้อมูลรายการสั่งซื้อ !</h3>
                          <div class="btn btn-primary"><router-link to="/order/create-order">สร้างรายการสั่งซื้อ</router-link></div>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
              <div
                class="tab-pane fade"
                id="nav-profile"
                role="tabpanel"
                aria-labelledby="nav-profile-tab"
              >
                <table class="table my-2">
                  <thead class="bg-warning">
                    <tr>
                      <th scope="row">รายการ</th>
                      <th scope="row">รายละเอียด</th>
                      <th scope="row">จำนวนคงเหลือ</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr v-for="(stock, index) in stockList" v-bind:key="index">
                      <td>{{ stock.title_stock }}</td>
                      <td>{{ stock.description_stock }}</td>
                      <td>{{ stock.total_stock }} <b>kg.</b></td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <div
                class="tab-pane fade"
                id="nav-contact"
                role="tabpanel"
                aria-labelledby="nav-contact-tab"
              >
                <table class="table my-2">
                  <thead class="bg-warning">
                    <tr>
                      <th scope="row">ลำดับ</th>
                      <th scope="row">รายการ</th>
                      <th scope="row">จำนวนสต็อกล่วงหน้า</th>
                      <th scope="row">รอบจัดส่ง</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr
                      v-for="(preStock, index) in preStockList"
                      v-bind:key="index"
                    >
                      <td>{{ index + 1 }}</td>
                      <td>{{ preStock.title_stock }}</td>
                      <td>{{ preStock.number }} <b>kg.</b></td>
                      <td>{{ preStock.delivery_date }}</td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data: function () {
    return {
      headers: {
        headers: {
          "Content-Type": "application/json",
          Authorization: "Bearer " + this.$cookies.get("token"),
        },
      },
      orderList: [],
      stockList: [],
      preStockList: [],
      totalOrderNumber: 0,
      totalSale: 0,
      date: new Date(),
    };
  },
  methods: {
    getAllOrderGroupByItem(delivery_date) {
      axios
        .get(
          "/api/order/get-order-group-by-item/" + delivery_date,
          this.headers
        )
        .then((response) => {
          this.orderList = response.data.order_list;
          this.totalOrderNumber = response.data.total_order_number;
          this.totalSale = response.data.total_sale;
        });
    },
    getAllStock() {
      axios.get("/api/stock/get-all-stock", this.headers).then((response) => {
        this.stockList = response.data;
        this.isTableStockListReady = true;
        this.isTablePreStockListReady = false;
        this.isTableStockHistoryListReady = false;
      });
    },
    getPreStock() {
      axios.get("/api/stock/get-pre-stock", this.headers).then((response) => {
        this.preStockList = response.data;
        this.isTableStockListReady = false;
        this.isTablePreStockListReady = true;
        this.isTableStockHistoryListReady = false;
      });
    },
  },
  mounted() {
    let format_date = new Intl.DateTimeFormat("en-US");
    this.date = format_date.format(this.date).split("/").join("-");
    this.getAllOrderGroupByItem(this.date);
    this.getAllStock();
    this.getPreStock();
  },
};
</script>
