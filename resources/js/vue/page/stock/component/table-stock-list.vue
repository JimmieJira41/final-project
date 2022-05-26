<template>
  <div class="table-response card shadow border-0 p-3">
    <div class="row">
      <div class="col-lg-6 col-md-6 col-sm-12 col-12 m-0">
        <h3>รายการสต็อกสินค้า</h3>
      </div>
      <div class="col-lg-6 col-md-6 col-sm-12 col-12 m-0 text-end">
        <!-- <div class="btn btn-primary mx-2">ออเดอร์ทั้งหมด</div> -->
        <div class="btn btn-success mx-2" v-if="btnStockList">รายการสต็อก</div>
        <div class="btn btn-warning mx-2" v-on:click="getAllStock()">
          แสดงรายการสต็อก
        </div>
        <div class="btn btn-warning mx-2" v-on:click="getPreStock()">
          แสดงรายการสต็อกล่วงหน้า
        </div>
        <div class="btn btn-warning" v-on:click="getAllHistoryStock()">
          แสดงบันทึกรายการสต็อก
        </div>
      </div>
    </div>
    <hr />
    <table v-if="isTableStockListReady" class="table table-borderless">
      <thead>
        <tr>
          <th scope="row">รายการ</th>
          <th scope="row">รายละเอียด</th>
          <th scope="row">จำนวนคงเหลือ</th>
          <th scope="row">เวลาอัพเดรต</th>
          <th class="text-center" scope="row" colspan="3">จัดการ</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(stock, index) in stockList" v-bind:key="index">
          <td>{{ stock.title_stock }}</td>
          <td>{{ stock.description_stock }}</td>
          <td>{{ stock.total_stock }} <b>kg.</b></td>
          <td>{{ stock.updated_at.split('T')[0] }}</td>
          <!-- <td>{{ admin.created_at }}</td> -->
          <td class="text-center" v-on:click="viewDetailStock(stock.id_stock)">
            <i class="fas fa-eye"></i>
          </td>
          <td class="text-center">
            <router-link :to="'/stock/update-stock/' + stock.id_stock"
              ><i class="fas fa-cog"></i
            ></router-link>
          </td>
          <td class="text-center" v-on:click="deleteStock(stock.id_stock)">
            <i class="fas fa-trash-alt"></i>
          </td>
        </tr>
      </tbody>
    </table>

    <table v-if="isTablePreStockListReady" class="table table-borderless">
      <thead>
        <tr>
          <th scope="row">ลำดับ</th>
          <th scope="row">รายการ</th>
          <th scope="row">สถานะสต็อกล่วงหน้า</th>
          <th scope="row">จำนวนสต็อกล่วงหน้า</th>
          <th scope="row">รอบจัดส่ง</th>
          <th class="text-center" scope="row" colspan="3">จัดการ</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(preStock, index) in preStockList" v-bind:key="index">
          <td>{{ index+1 }}</td>
          <td>{{ preStock.title_stock }}</td>
          <td>{{ preStock.status_pre_stock }}</td>
          <td>{{ preStock.number }} <b>kg.</b></td>
          <td>{{ preStock.delivery_date }}</td>
          <!-- <td>{{ admin.created_at }}</td> -->
          <td class="text-center" v-on:click="viewDetailStock(stock.id_stock)">
            <i class="fas fa-eye"></i>
          </td>
          <td class="text-center">
            <router-link :to="'/stock/update-stock/' + stock.id_stock"
              ><i class="fas fa-cog"></i
            ></router-link>
          </td>
          <td class="text-center" v-on:click="deleteStock(stock.id_stock)">
            <i class="fas fa-trash-alt"></i>
          </td>
        </tr>
      </tbody>
    </table>

    <table v-if="isTableStockHistoryListReady" class="table table-borderless">
      <thead>
        <tr>
          <th scope="row">รายการ</th>
          <th scope="row">จำนวนที่อัพเดรต</th>
          <th scope="row">อัพเดรตโดยพนักงาน</th>
          <th scope="row">เวลาอัพเดรต</th>
          <!-- <th class="text-center" scope="row" colspan="3">จัดการ</th> -->
        </tr>
      </thead>
      <tbody>
        <tr
          v-for="(historyStock, index) in historyStockList"
          v-bind:key="index"
        >
          <td>{{ historyStock.title_stock }}</td>
          <td>{{ historyStock.number }}</td>
          <td>{{ historyStock.update_by }}</td>
          <td>{{ historyStock.updated_at.split('T')[0] }}</td>

          <!-- <td>{{ admin.created_at }}</td> -->
          <!-- <td class="text-center" v-on:click="viewDetailStock(stock.id_stock)">
            <i class="fas fa-eye"></i>
          </td>
          <td class="text-center">
            <router-link :to="'/stock/update-stock/' + stock.id_stock"
              ><i class="fas fa-cog"></i
            ></router-link>
          </td>
          <td class="text-center" v-on:click="deleteStock(stock.id_stock)">
            <i class="fas fa-trash-alt"></i>
          </td> -->
        </tr>
      </tbody>
    </table>
  </div>
</template>
<style>
.table-fixed {
  height: 300px;
  overflow-y: auto;
  width: 100%;
}
</style>
<script>
export default {
  data: function () {
    return {
      btnHistory: true,
      btnStockList: false,
      isTableStockListReady: false,
      isTableStockHistoryListReady: false,
      isTablePreStockListReady: false,
      stockList: [],
      preStockList: [],
      historyStockList: [],
      stock: Object,
    };
  },
  methods: {
    getAllHistoryStock() {
      axios.get("/api/stock/get-all-history-stock").then((response) => {
        if (response) {
          this.historyStockList = response.data;
          this.isTableStockListReady = false;
          this.isTablePreStockListReady = false;
          this.isTableStockHistoryListReady = true;
        }
      });
    },
    getAllStock() {
      axios.get("/api/stock/get-all-stock").then((response) => {
        this.stockList = response.data;
        this.isTableStockListReady = true;
        this.isTablePreStockListReady = false;
        this.isTableStockHistoryListReady = false;
      });
    },
    getPreStock() {
      axios.get("/api/stock/get-pre-stock").then((response) => {
        this.preStockList = response.data;
        this.isTableStockListReady = false;
        this.isTablePreStockListReady = true;
        this.isTableStockHistoryListReady = false;
      });
    },
    // editDetailStock(stockId){
    //     this.$router.push({ name: 'UpdateStock', params: {id: stockId}});
    // },
    viewDetailStock(stockId) {
      axios.get("/api/stock/search-stock/" + stockId).then((response) => {
        this.stock = response.data;
        console.table(this.stock);
      });
    },
    deleteStock(stockId) {
      this.$swal({
        title: "แจ้งเตือน",
        text: "คุณต้องการลบรายการสั่งซื้อ ใช่หรือไม่ ?",
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: "ยืนยัน",
        cancelButtonText: "ยกเลิก",
        reverseButtons: true,
      }).then((result) => {
        if (result.isConfirmed) {
          axios
            .delete("/api/stock/delete-stock/", { data: { id_stock: stockId } })
            .then((response) => {
              this.getAllStock();
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