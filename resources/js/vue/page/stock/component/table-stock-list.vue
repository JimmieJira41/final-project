<template>
  <div class="table-response card shadow border-0 p-3">
    <div class="row">
      <div class="col-lg-6 col-md-6 col-sm-12 col-12 m-0">
        <h3 v-if="isTableStockListReady">รายการสต็อกสินค้า</h3>
        <h3 v-if="isTablePreStockListReady">รายการสต็อกสินค้าล่วงหน้า</h3>
      </div>
      <div class="col-lg-6 col-md-6 col-sm-12 col-12 m-0 text-end">
        <div class="row text-center">
          <div class="col-4 px-1">
            <button
              class="btn btn-warning w-100 h-100"
              v-on:click="getAllStock()"
            >
              รายการสต็อก
            </button>
          </div>
          <div class="col-4 px-1">
            <button
              class="btn btn-warning w-100 h-100"
              v-on:click="getPreStock()"
            >
              รายการสต็อกล่วงหน้า
            </button>
          </div>
          <div class="col-4 px-1">
            <button
              class="btn btn-warning w-100 h-100"
              v-on:click="getAllHistoryStock()"
            >
              บันทึกรายการสต็อก
            </button>
          </div>
        </div>
      </div>
    </div>
    <hr />
    <div class="tbody-scroll">
      <table v-if="isTableStockListReady">
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
            <td>{{ stock.updated_at.split("T")[0] }}</td>
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

      <table v-if="isTablePreStockListReady">
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
            <td>{{ index + 1 }}</td>
            <td>{{ preStock.title_stock }}</td>
            <td>{{ preStock.status_pre_stock }}</td>
            <td>{{ preStock.number }} <b>kg.</b></td>
            <td>{{ preStock.delivery_date }}</td>
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

      <table v-if="isTableStockHistoryListReady">
        <thead>
          <tr>
            <th scope="row">รายการ</th>
            <th scope="row">จำนวนที่อัพเดรต</th>
            <th scope="row">อัพเดรตโดยพนักงาน</th>
            <th scope="row">เวลาอัพเดรต</th>
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
            <td>{{ historyStock.updated_at.split("T")[0] }}</td>
          </tr>
        </tbody>
      </table>
    </div>
    <div
      class="modal fade"
      id="editStockModal"
      tabindex="-1"
      aria-labelledby="editStockModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="editStockModalLabel">
              แก้ไขรายการสต็อกสินค้า
            </h5>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <!-- <UpdateStockForm stockId=""></UpdateStockForm> -->
        </div>
      </div>
    </div>
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
import UpdateStockForm from "./update-stock.vue";
export default {
  components: {
    UpdateStockForm: UpdateStockForm,
  },
  data: function () {
    return {
      btnHistory: true,
      btnStockList: false,
      isTableStockListReady: true,
      isTableStockHistoryListReady: false,
      isTablePreStockListReady: false,
      stockList: [],
      stockId: 0,
      preStockList: [],
      historyStockList: [],
      stock: Object,
      headers: {
        headers: {
          "Content-Type": "application/json",
          Authorization: "Bearer " + this.$cookies.get("token"),
        },
      },
    };
  },
  methods: {
    setStockId(id) {
      this.stockId = id;
    },
    getStockDetail(id) {
      let editStockModal = document.getElementById("editStockModal");
      this.stockId = id;
      // editStockModal.modal('show')
      editStockModal.addEventListener("show.bs.modal", function () {
        // this.setStockId(stockId);
        // this.stockId = stockId;
      });
      console.log(id);
    },
    getAllHistoryStock() {
      axios
        .get("/api/stock/get-all-history-stock", this.headers)
        .then((response) => {
          if (response) {
            this.historyStockList = response.data;
            this.isTableStockListReady = false;
            this.isTablePreStockListReady = false;
            this.isTableStockHistoryListReady = true;
          }
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
    // editDetailStock(stockId){
    //     this.$router.push({ name: 'UpdateStock', params: {id: stockId}});
    // },
    viewDetailStock(stockId) {
      axios
        .get("/api/stock/search-stock/" + stockId, this.headers)
        .then((response) => {
          this.stock = response.data;
          console.table(this.stock);
        });
    },
    deleteStock(stockId) {
      this.$swal({
        title: "แจ้งเตือน",
        text: "คุณต้องการลบรายการสต็อกสินค้า ใช่หรือไม่ ?",
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: "ยืนยัน",
        cancelButtonText: "ยกเลิก",
      }).then((result) => {
        if (result.isConfirmed) {
          axios
            .delete("/api/stock/delete-stock/", {
              headers: this.headers.headers,
              data: { id_stock: stockId },
            })
            .then((response) => {
              this.$swal({
                title: "ลบรายการสต็อกสินค้าสำเร็จ",
                icon: "success",
                confirmButtonText: "ยืนยัน",
              }).then((result) => {
                this.getAllStock();
              });
            });
        }
      });
    },
  },
  mounted() {
    // this.getStockDetail('');
    this.getAllStock();
  },
};
</script>