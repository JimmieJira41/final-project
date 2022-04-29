<template>
  <div class="pb-5">
    <div class="card shadow border-0 p-3">
      <div class="row">
        <div class="col-lg-6 col-md-6 col-sm-12 col-12 m-0">
          <h3>รายการสั่งซื้อ</h3>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-12 col-12 m-0 text-end">
          <!-- <div class="btn btn-primary mx-2">ออเดอร์ทั้งหมด</div> -->
          <button
            class="
              btn btn-warning
              mx-md-1
              col-4 col-sm-4 col-md-3 col-lg-3
              h-100
            "
            v-on:click="getAllOrderGroupByItem()"
          >
            แบ่งตามรายการสินค้า
          </button>
          <button
            class="
              btn btn-success
              mx-md-1
              col-4 col-sm-4 col-md-3 col-lg-3
              h-100
            "
            v-on:click="getAllOrderGroupByCustomer()"
          >
            แบ่งตามรายชื่อลูกค้า
          </button>
          <button
            class="
              btn btn-success
              mx-md-1
              col-4 col-sm-4 col-md-3 col-lg-3
              h-100
            "
            v-on:click="getAllHistoryOrder()"
          >
            บันทึกรายการสั่งซื้อ
          </button>
        </div>
      </div>
      <hr />
      <div class="table-responsive">
        <table class="table table-borderless" v-if="isTableOrderListReady">
          <thead>
            <tr>
              <th scope="row">ลำดับ</th>
              <th scope="row">รายการสินค้า</th>
              <th scope="row">จำนวน (กล่อง)</th>
              <!-- <th scope="row">เวลาสร้างออเดอร์</th> -->
              <!-- <th scope="row">Create At</th> -->
              <!-- <th class="text-center" scope="row" colspan="3">จัดการ</th> -->
            </tr>
          </thead>
          <tbody>
            <tr v-for="(order, index) in orderList" v-bind:key="index">
              <td>{{ index + 1 }}</td>
              <td>{{ order.item[0].title_item }}</td>
              <td>{{ order.total_number }}</td>
              <!-- <td>{{ order.created_at }}</td> -->
              <!-- <td>{{ admin.created_at }}</td> -->
              <!-- <td class="text-center" v-on:click="viewDetailOrder(order.id_order)"><i class="fas fa-eye"></i></td> -->
              <!-- <td class="text-center">
              <router-link
                :to="
                  '/order/update-order/' +
                  order.id_customer +
                  '/' +
                  order.id_order +
                  '/' +
                  order.id_item
                "
                ><i class="fas fa-cog"></i
              ></router-link>
            </td>
            <td class="text-center" v-on:click="deleteOrder(order.id_order)">
              <i class="fas fa-trash-alt"></i>
            </td> -->
            </tr>
          </tbody>
        </table>
        <table
          class="table table-borderless"
          v-if="isTableOrderListGroupByCustomerReady"
        >
          <thead>
            <tr>
              <th scope="row">ลำดับ</th>
              <th scope="row">รายชื่อลูกค้า</th>
              <th scope="row">สถานะการชำระเงิน</th>
              <th scope="row">รายการสั่งซื้อ</th>
              <th scope="row">ราคารวม</th>
              <!-- <th scope="row">เวลาสร้างออเดอร์</th> -->
              <!-- <th scope="row">Create At</th> -->
              <th class="text-center" scope="row" colspan="3">จัดการ</th>
            </tr>
          </thead>
          <tbody>
            <tr
              v-for="(order, index) in orderListGroupByCustomer"
              v-bind:key="index"
            >
              <td>{{ order.id_order }}</td>
              <td>{{ order.name_customer }}</td>
              <td>
                <h5 v-if="!order.status_payment">
                  <p class="badge text-dark bg-warning">ค้างชำระเงิน</p>
                </h5>
                <h5 v-else>
                  <p class="badge bg-success">ชำระเงินแล้ว</p>
                </h5>
              </td>
              <td>
                <ul>
                  <li v-for="(item, index) in order.item" v-bind:key="index">
                    {{ item.title_item }} => {{ item.number }} กล่อง
                  </li>
                </ul>
              </td>
              <td class="">{{ order.total_cost_order }} ฿</td>
              <!-- <td>{{ order.created_at }}</td> -->
              <!-- <td>{{ admin.created_at }}</td> -->
              <!-- <td class="text-center" v-on:click="viewDetailOrder(order.id_order)"><i class="fas fa-eye"></i></td> -->
              <td class="text-center">
                <router-link :to="'/order/update-order/' + order.id_order"
                  ><i class="fas fa-cog"></i
                ></router-link>
              </td>
              <td class="text-center" v-on:click="deleteOrder(order.id_order)">
                <i class="fas fa-trash-alt"></i>
              </td>
            </tr>
          </tbody>
        </table>
        <table
          class="table table-borderless"
          v-if="isTableHistoryOrderListReady"
        >
          <thead>
            <tr>
              <th scope="row">รหัส</th>
              <th scope="row">รายชื่อลูกค้า</th>
              <th scope="row">สถานะรายการสั่งซื้อ</th>
              <th scope="row">สถานะการชำระเงิน</th>
              <th scope="row">รายการสั่งซื้อ</th>
              <!-- <th scope="row">Create At</th> -->
              <th class="text-center" scope="row" colspan="3">จัดการ</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(order, index) in historyList" v-bind:key="index">
              <td>{{ order.id_order }}</td>
              <td>{{ order.name_customer }}</td>
              <td>
                <h5><p class="badge bg-success">เสร็จสมบูรณ์</p></h5>
              </td>
              <td>
                <h5 v-if="!order.status_payment">
                  <p class="badge text-dark bg-warning">ค้างชำระเงิน</p>
                </h5>
                <h5 v-else><p class="badge bg-success">ชำระเงินแล้ว</p></h5>
              </td>
              <td>
                <ul>
                  <li v-for="(item, index) in order.item" v-bind:key="index">
                    {{ item.title_item }} => {{ item.number }} กล่อง
                  </li>
                </ul>
              </td>
              <!-- <td>{{ order.created_at }}</td> -->
              <!-- <td>{{ admin.created_at }}</td> -->
              <!-- <td class="text-center" v-on:click="viewDetailOrder(order.id_order)"><i class="fas fa-eye"></i></td> -->
              <td class="text-center">
                <router-link :to="'/order/update-order/' + order.id_order"
                  ><i class="fas fa-cog"></i
                ></router-link>
              </td>
              <td class="text-center" v-on:click="deleteOrder(order.id_order)">
                <i class="fas fa-trash-alt"></i>
              </td>
            </tr>
            <!-- <tr v-for="(order, index) in historyList" v-bind:key="index">
            <td>{{ order.id_order }}</td>
            <td>{{ order.item[0].description_item }}</td>
            <td>{{ order.number }}</td>
            <td>{{ order.created_at }}</td> -->
            <!-- <td>{{ admin.created_at }}</td> -->
            <!-- <td class="text-center" v-on:click="viewDetailOrder(order.id_order)"><i class="fas fa-eye"></i></td> -->
            <!-- <td class="text-center">
              <router-link
                :to="
                  '/order/update-order/' +
                  order.id_customer +
                  '/' +
                  order.id_order +
                  '/' +
                  order.id_item
                "
                ><i class="fas fa-cog"></i
              ></router-link>
            </td>
            <td class="text-center" v-on:click="deleteOrder(order.id_order)">
              <i class="fas fa-trash-alt"></i>
            </td> -->
            <!-- </tr> -->
          </tbody>
        </table>
      </div>
      <div
        v-if="isTableOrderListGroupByCustomerReady"
        class="btn-option-feature text-end"
      >
        <div class="btn btn-primary mx-2" v-on:click="cutOffOrder()">
          ตัดรอบรายการสั่งซื้อ
        </div>
        <div
          class="btn btn-warning mx-2"
          data-bs-toggle="modal"
          data-bs-target="#exportLabel"
        >
          พิมพ์ใบ Label
        </div>
      </div>
      <div v-if="isTableOrderListReady" class="btn-option-feature text-end">
        <div class="btn btn-warning mx-2" v-on:click="exportLabel()">
          พิมพ์ใบเช็คสินค้า
        </div>
      </div>
    </div>
  </div>

  <div
    class="modal fade"
    tabindex="-1"
    id="exportLabel"
    aria-labelledby="exportLabel"
    aria-hidden="true"
  >
    <div class="modal-dialog modal-sm modal-dialog-scrollable">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">รายการ Label</h5>
          <button
            type="button"
            class="btn-close"
            data-bs-dismiss="modal"
            aria-label="Close"
          ></button>
        </div>
        <div class="modal-body">
          <button class="btn btn-primary col-12 my-1" v-on:click="exportLabel('kerry')">
            Kerry Express
          </button>
          <button class="btn btn-primary col-12 my-1" v-on:click="exportLabel('dhl')">
            DHL Express
          </button>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  props: ["orderList", "orderListGroupByCustomer", "historyList"],
  data: function () {
    return {
      isTableOrderListReady: true,
      isTableHistoryOrderListReady: false,
      isTableOrderListGroupByCustomerReady: false,
      // orderList: [],
      // orderListGroupByCustomer: [],
      // historyList: [],
      order: Object,
    };
  },
  methods: {
    getAllOrderGroupByCustomer() {
      this.isTableOrderListGroupByCustomerReady = true;
      this.isTableHistoryOrderListReady = false;
      this.isTableOrderListReady = false;
    },
    getAllHistoryOrder() {
      this.isTableHistoryOrderListReady = true;
      this.isTableOrderListGroupByCustomerReady = false;
      this.isTableOrderListReady = false;
    },
    getAllOrderGroupByItem() {
      this.isTableOrderListReady = true;
      this.isTableOrderListGroupByCustomerReady = false;
      this.isTableHistoryOrderListReady = false;
    },
    viewDetailOrder(orderId) {
      axios.get("/api/order/search-order/" + orderId).then((response) => {
        this.order = response.data;
        console.table(this.order);
      });
    },
    deleteOrder(orderId) {
      this.$swal({
        title: "แจ้งเตือน",
        text: "คุณต้องการลบรายการสั่งซื้อ ใช่หรือไม่ ?",
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: "ยืนยัน",
        cancelButtonText: "ยกเลิก",
      }).then((result) => {
        if (result.isConfirmed) {
          axios
            .delete("/api/order/delete-order", { data: { id_order: orderId } })
            .then((response) => {
              if (response) {
                this.$swal({
                  title: "ลบรายการสั่งซื้อสำเร็จ",
                  icon: "success",
                  confirmButtonText: "ยืนยัน",
                }).then((result) => {
                  this.getAllOrder();
                });
              }
            });
        }
      });
    },
    cutOffOrder() {
      this.$swal({
        title: "แจ้งเตือน",
        text: "คุณต้องการตัดรอบรายการสั่งซื้อ ใช่หรือไม่ ?",
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: "ยืนยัน",
        cancelButtonText: "ยกเลิก",
      }).then((result) => {
        if (result.isConfirmed) {
          axios.post("/api/order/cut-off-order").then((response) => {
            if (response) {
              this.$swal({
                title: "ตัดรอบรายการสั่งซื้อสำเร็จ",
                icon: "success",
                confirmButtonText: "ยืนยัน",
              }).then((result) => {
                this.getAllOrder();
              });
            }
          });
        }
      });
    },
    exportLabel(key) {
      let url = '';
      this.$swal({
        title: "แจ้งเตือน",
        text: "คุณดาวโหลดไฟล์ใบปะหน้า ใช่หรือไม่ ?",
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: "ยืนยัน",
        cancelButtonText: "ยกเลิก",
      }).then((result) => {
        if (result.isConfirmed) {
          if(key == 'dhl'){
            url = "/api/order/get-dhl-label-excel-file";
          }
          if(key == 'kerry'){
            url = "/api/order/get-kerry-label-excel-file"
          }
          axios({
            url: url,
            method: "get",
            responseType: "blob",
          }).then((response) => {
            if (response) {
              var blob = new Blob([response.data], {
                // type: "application/vnd.ms-excel",
                type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
              });
              const elink = document.createElement("a");
              // elink.download = fileName;
              elink.style.display = "none";
              elink.href = URL.createObjectURL(blob);
              elink.setAttribute("download", "template.xlsx");
              document.body.appendChild(elink);
              elink.click();
              URL.revokeObjectURL(elink.href);
              document.body.removeChild(elink);

              this.$swal({
                title: "คุณดาวโหลดไฟล์สำเร็จ",
                icon: "success",
                confirmButtonText: "ยืนยัน",
              });
            }
          });
        }
      });
    },
  },
  mounted() {},
};
</script>