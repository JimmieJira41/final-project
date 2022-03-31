<template>
  <div>
    <div class="table-response card shadow border-0 p-3">
      <div class="row">
        <div class="col-6 m-0"><h3>รายการสั่งซื้อ</h3></div>
        <div class="col-6 m-0 text-end">
          <!-- <div class="btn btn-primary mx-2">ออเดอร์ทั้งหมด</div> -->
          <div
            class="btn btn-warning mx-2"
            v-on:click="getAllOrderGroupByItem()"
          >
            แบ่งตามรายการสินค้า
          </div>
          <div
            class="btn btn-success mx-2"
            v-on:click="getAllOrderGroupByCustomer()"
          >
            แบ่งตามรายชื่อลูกค้า
          </div>
          <div class="btn btn-success mx-2" v-on:click="getAllHistoryOrder()">
            บันทึกรายการสั่งชื่อ
          </div>
        </div>
      </div>
      <hr />
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
            <th scope="row">รายการสั่งซื้อ</th>
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
            <td>{{ index + 1 }}</td>
            <td>{{ order.name_customer }}</td>
            <td>
              <ul>
                <li v-for="(item, index) in order.orderList" v-bind:key="index">
                  {{ item.item[0].title_item }} => {{item.number}} กล่อง
                </li>
              </ul>
            </td>
            <!-- <td>{{ order.created_at }}</td> -->
            <!-- <td>{{ admin.created_at }}</td> -->
            <!-- <td class="text-center" v-on:click="viewDetailOrder(order.id_order)"><i class="fas fa-eye"></i></td> -->
            <td class="text-center">
              <router-link :to="'/order/update-order/' + order.id_customer"
                ><i class="fas fa-cog"></i
              ></router-link>
            </td>
            <td class="text-center" v-on:click="deleteOrder(order.id_order)">
              <i class="fas fa-trash-alt"></i>
            </td>
          </tr>
        </tbody>
      </table>
      <table class="table table-borderless" v-if="isTableHistoryOrderListReady">
        <thead>
          <tr>
            <th scope="row">รหัส</th>
            <th scope="row">รายละเอียด</th>
            <th scope="row">จำนวน (กล่อง)</th>
            <th scope="row">เวลาสร้างออเดอร์</th>
            <!-- <th scope="row">Create At</th> -->
            <th class="text-center" scope="row" colspan="3">จัดการ</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(order, index) in historyList" v-bind:key="index">
            <td>{{ order.id_order }}</td>
            <td>{{ order.item[0].description_item }}</td>
            <td>{{ order.number }}</td>
            <td>{{ order.created_at }}</td>
            <!-- <td>{{ admin.created_at }}</td> -->
            <!-- <td class="text-center" v-on:click="viewDetailOrder(order.id_order)"><i class="fas fa-eye"></i></td> -->
            <td class="text-center">
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
            </td>
          </tr>
        </tbody>
      </table>
      <div class="btn-option-feature text-end">
        <div class="btn btn-primary mx-2" v-on:click="cutOffOrder()">
          ตัดรอบรายการสั่งซื้อ
        </div>
        <div class="btn btn-warning mx-2" v-on:click="exportLabel()">
          พิมพ์ใบปะหน้า
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data: function () {
    return {
      isTableOrderListReady: false,
      isTableHistoryOrderListReady: false,
      isTableOrderListGroupByCustomerReady: false,
      orderList: [],
      orderListGroupByCustomer: [],
      historyList: [],
      order: Object,
    };
  },
  methods: {
    getAllOrderGroupByCustomer() {
      axios.get("/api/order/get-order-group-by-customer").then((response) => {
        this.orderListGroupByCustomer = response.data;
        this.isTableOrderListGroupByCustomerReady = true;
        this.isTableHistoryOrderListReady = false;
        this.isTableOrderListReady = false;
      });
    },
    getAllHistoryOrder() {
      axios.get("/api/history/get-all-history-order").then((response) => {
        this.historyList = response.data;
        this.isTableHistoryOrderListReady = true;
        this.isTableOrderListGroupByCustomerReady = false;
        this.isTableOrderListReady = false;
      });
    },
    getAllOrderGroupByItem() {
      axios.get("/api/order/get-order-group-by-item").then((response) => {
        this.orderList = response.data;
        this.isTableOrderListReady = true;
        this.isTableOrderListGroupByCustomerReady = false;
        this.isTableHistoryOrderListReady = false;
      });
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
            .delete("/api/order/delete-order/", { data: { id_order: orderId } })
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
    exportLabel() {
      this.$swal({
        title: "แจ้งเตือน",
        text: "คุณดาวโหลดไฟล์ใบปะหน้า ใช่หรือไม่ ?",
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: "ยืนยัน",
        cancelButtonText: "ยกเลิก",
      }).then((result) => {
        if (result.isConfirmed) {
          axios({
            url: "/api/order/get-label-excel-file",
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
  mounted() {
    this.getAllOrderGroupByItem();
  },
};
</script>