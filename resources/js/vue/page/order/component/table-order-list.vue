<template>
  <div class="pb-5">
    <div class="card shadow border-0 p-3">
      <div class="row">
        <div class="col-lg-6 col-md-6 col-sm-12 col-12 m-0">
          <h3
            v-if="isTableOrderListReady || isTableOrderListGroupByCustomerReady"
          >
            รายการสั่งซื้อ
          </h3>
          <h3 v-if="isTableHistoryOrderListReady">บันทึกรายการสั่งซื้อ</h3>
          <div>
            <button
              v-if="isTableOrderListGroupByCustomerReady"
              class="btn rounded-pill btn-outline-primary py-1 px-2"
              v-on:click="selectMode = !selectMode"
            >
              เลือก
            </button>
          </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-12 col-12 m-0 text-end">
          <div class="row">
            <div class="col-4 px-1">
              <button
                class="btn btn-warning w-100 h-100"
                v-on:click="getAllOrderGroupByItem()"
              >
                แบ่งตามรายการสินค้า
              </button>
            </div>
            <div class="col-4 px-1">
              <button
                class="btn btn-success w-100 h-100"
                v-on:click="getAllOrderGroupByCustomer()"
              >
                แบ่งตามรายชื่อลูกค้า
              </button>
            </div>
            <div class="col-4 px-1">
              <button
                class="btn btn-success w-100 h-100"
                v-on:click="getAllHistoryOrder()"
              >
                บันทึกรายการสั่งซื้อ
              </button>
            </div>
          </div>
        </div>
      </div>
      <hr />
      <div class="tbody-scroll">
        <table v-if="isTableOrderListReady">
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
          <tbody v-if="orderList.length">
            <tr v-for="(order, index) in orderList" v-bind:key="index">
              <td>{{ index + 1 }}</td>
              <td>{{ order.item[0].title_item }}</td>
              <td>{{ order.total_number }}</td>
            </tr>
          </tbody>
          <!-- <tbody v-else-if="spinner">
            <tr class="text-center">
              <div class="spinner-border" role="status">
                <span class="visually-hidden">Loading...</span>
              </div>
            </tr>
          </tbody> -->
          <tbody v-else>
            <tr class="text-center">
              <td colspan="3">ไม่พบข้อมูลรายการสั่งซื้อ !</td>
            </tr>
          </tbody>
        </table>

        <table v-if="isTableOrderListGroupByCustomerReady">
          <thead>
            <tr>
              <th v-if="selectMode">
                <div>เลือกทั้งหมด</div>
                <input
                  type="checkbox"
                  v-model="selectAllMode"
                  v-on:click="checkSelectAllMode()"
                />
              </th>
              <th scope="row">ลำดับ</th>
              <th scope="row">รายชื่อลูกค้า</th>
              <th scope="row">สถานะอัพโหลดสลิป</th>
              <th scope="row">สถานะตรวจสอบสลิป</th>
              <th scope="row">รายการสั่งซื้อ</th>
              <th scope="row">ราคารวม</th>
              <!-- <th scope="row">เวลาสร้างออเดอร์</th> -->
              <!-- <th scope="row">Create At</th> -->
              <th class="text-center" scope="row" colspan="4">จัดการ</th>
            </tr>
          </thead>
          <tbody v-if="orderListGroupByCustomer.length">
            <tr
              v-for="(order, index) in orderListGroupByCustomer"
              v-bind:key="index"
            >
              <td v-if="selectMode">
                <input
                  type="checkbox"
                  :value="order.id_order"
                  v-model="orderSelectedList"
                />
              </td>
              <td>{{ order.id_order }}</td>
              <td>{{ order.name_customer }}</td>
              <td>
                <h5 v-if="!order.status_payment">
                  <p class="badge text-dark bg-warning m-0">ค้างอัพโหลดสลิป</p>
                </h5>
                <h5 v-else>
                  <p class="badge bg-success m-0">อัพโหลดสลิปแล้ว</p>
                </h5>
              </td>
              <td>
                <h5 v-if="!order.status_validate_payment">
                  <p class="badge text-dark bg-warning m-0">ค้างตรวจสอบสลิป</p>
                </h5>
                <h5 v-else>
                  <p class="badge bg-success m-0">ตรวจสอบสลิปแล้ว</p>
                </h5>
              </td>
              <td>
                <ul>
                  <li v-for="(item, index) in order.item" v-bind:key="index">
                    {{ item.title_item }} => {{ item.number }} กล่อง
                  </li>
                </ul>
              </td>
              <td>{{ order.total_cost_order }} ฿</td>
              <td class="text-center p-1">
                <button
                  type="button"
                  class="btn btn-outline-primary"
                  data-bs-toggle="modal"
                  data-bs-target="#viewSlip"
                  v-on:click="getSlip(order.id_order)"
                >
                  <i class="fas fa-file-invoice fs-5"></i>
                </button>
              </td>
              <td class="text-center p-1">
                <button
                  type="button"
                  class="btn btn-outline-primary"
                  data-bs-toggle="modal"
                  data-bs-target="#uploadSlip"
                  v-on:click="id_order = order.id_order"
                >
                  <i class="fas fa-file-upload fs-5"></i>
                </button>
              </td>
              <td class="text-center p-1">
                <router-link :to="'/order/update-order/' + order.id_order">
                  <button type="button" class="btn btn-outline-primary">
                    <i class="fas fa-cog fs-5"></i>
                  </button>
                </router-link>
              </td>
              <td
                class="text-center p-1"
                v-on:click="deleteOrder(order.id_order)"
              >
                <button type="button" class="btn btn-outline-primary">
                  <i class="fas fa-trash-alt fs-5"></i>
                </button>
              </td>
            </tr>
          </tbody>
          <tbody v-else>
            <tr class="text-center">
              <td colspan="6">ไม่พบข้อมูลรายการสั่งซื้อ !</td>
            </tr>
          </tbody>
        </table>

        <table v-if="isTableHistoryOrderListReady">
          <thead>
            <tr>
              <th scope="row">รหัส</th>
              <th scope="row">รายชื่อลูกค้า</th>
              <th scope="row">สถานะรายการสั่งซื้อ</th>
              <th scope="row">สถานะการชำระเงิน</th>
              <th scope="row">รายการสั่งซื้อ</th>
              <th class="text-center" scope="row" colspan="3">จัดการ</th>
            </tr>
          </thead>
          <tbody v-if="historyList.length">
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
              <td class="text-center">
                <router-link :to="'/order/update-order/' + order.id_order"
                  ><i class="fas fa-cog"></i
                ></router-link>
              </td>
            </tr>
          </tbody>
          <tbody v-else>
            <tr class="text-center">
              <td colspan="7">ไม่พบข้อมูลรายการสั่งซื้อ !</td>
            </tr>
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
        <div
          class="btn btn-warning mx-2"
          v-on:click="exportLabel('check-report')"
        >
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
          <button
            class="btn btn-primary col-12 my-1"
            v-on:click="exportLabel('kerry')"
          >
            Kerry Express
          </button>
          <button
            class="btn btn-primary col-12 my-1"
            v-on:click="exportLabel('dhl')"
          >
            DHL Express
          </button>
        </div>
      </div>
    </div>
  </div>

  <div
    class="modal fade"
    id="uploadSlip"
    tabindex="-1"
    aria-labelledby="uploadSlipLabel"
    aria-hidden="true"
    ref="uploadSlip"
  >
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="uploadSlipLabel">อัพโหลดสลิป</h5>
          <button
            type="button"
            class="btn-close"
            data-bs-dismiss="modal"
            aria-label="Close"
          ></button>
        </div>
        <div class="modal-body">
          <div class="text-center">
            <h1><i class="fas fa-upload" style="font-size: 3em"></i></h1>
            <div class="mb-3">
              <label for="formFile" class="form-label"
                >เลือกไฟล์สลิปการโอน</label
              >

              <input
                class="form-control"
                type="file"
                @change="uploadSlip"
                id="formFile"
              />
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button
            type="button"
            class="btn btn-primary"
            v-on:click="submitUploadSlip()"
          >
            อัพโหลดสลิป
          </button>
          <button
            type="button"
            class="btn btn-secondary"
            data-bs-dismiss="modal"
          >
            ยกเลิก
          </button>
        </div>
      </div>
    </div>
  </div>

  <div
    class="modal fade"
    id="viewSlip"
    tabindex="-1"
    aria-labelledby="viewSlipLabel"
    aria-hidden="true"
  >
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="viewSlipLabel">ตรวจสอบสลิป</h5>
          <button
            type="button"
            class="btn-close"
            data-bs-dismiss="modal"
            aria-label="Close"
          ></button>
        </div>
        <div class="modal-body">
          <div class="row">
            <div
              class="col-12"
              v-for="(slip, index) in slipList"
              v-bind:key="index"
            >
              <div class="position-absolute">
                <h3 v-if="slip.status" class="badge text-dark bg-success">
                  ตรวจสอบสลิปแล้ว
                </h3>
                <h3 v-else class="badge text-dark bg-warning">
                  ค้างตรวจสอบสลิป
                </h3>
              </div>
              <img :src="slip.src" alt="slip" style="width: 100%" />
              <div class="row mt-1">
                <div class="col-6">
                  <button
                    type="button"
                    class="btn btn-success"
                    v-on:click="validateSlip(slip.id)"
                  >
                    ยืนยันการตรวจสอบ
                  </button>
                </div>
                <div class="col-6 text-end">
                  <button type="button" class="btn btn-danger">ลบสลิป</button>
                </div>
              </div>
              <hr />
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button
            type="button"
            class="btn btn-secondary"
            data-bs-dismiss="modal"
            v-on:click="refetchDate"
          >
            ยกเลิก
          </button>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
// import bootstrap from Bo;
export default {
  props: [
    "orderList",
    "orderListGroupByCustomer",
    "historyList",
    "delivery_date",
  ],
  data: function () {
    return {
      isTableOrderListReady: true,
      isTableHistoryOrderListReady: false,
      isTableOrderListGroupByCustomerReady: false,
      orderSelectedList: [],
      selectAllMode: false,
      selectMode: false,
      spinner: false,
      order: Object,
      id_order: "",
      slip: "",
      slipList: [],
      headers: {
        headers: {
          "Content-Type": "application/json",
          Authorization: "Bearer " + this.$cookies.get("token"),
        },
      },
    };
  },
  methods: {
    refetchDate() {
      this.$emit("refetch-data");
    },
    uploadSlip(e) {
      let file = e.target.files[0];
      let reader = new FileReader();

      if (file["size"] < 2111775) {
        reader.onloadend = (file) => {
          // console.log("RESULT", reader.result);
          this.slip = reader.result;
        };
        reader.readAsDataURL(file);
      } else {
        alert("File size can not be bigger than 2 MB");
      }
    },
    getSlip(id_order) {
      this.slipList = [];
      this.id_order = id_order;
      axios
        .get("/api/order/view-slip/" + id_order, this.headers)
        .then((response) => {
          if (response) {
            response.data.forEach((slip) => {
              this.slipList.push({
                id: slip.id,
                src: "/img/slip/" + slip.name,
                status: slip.validate_status,
              });
            });
          }
        });
    },
    submitUploadSlip() {
      this.$swal({
        title: "แจ้งเตือน",
        text: "คุณต้องการอัพโหลดสลิป ใช่หรือไม่ ?",
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: "ยืนยัน",
        cancelButtonText: "ยกเลิก",
      }).then((result) => {
        if (result.isConfirmed) {
          console.log(this.slip);
          axios
            .post(
              "/api/order/upload-slip",
              {
                id_order: this.id_order,
                slip: this.slip,
              },
              this.headers
            )
            .then((response) => {
              if (response.status == 200) {
                this.$swal({
                  title: "อัพโหลดสลิปสำเร็จ!",
                  icon: "success",
                  confirmButtonText: "ยืนยัน",
                }).then((result) => {
                  this.refetchDate();
                });
              }
            });
        }
      });
    },
    validateSlip(id_slip) {
      this.$swal({
        title: "แจ้งเตือน",
        text: "คุณต้องการยืนยันการตรวสอบสลิป ใช่หรือไม่ ?",
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: "ยืนยัน",
        cancelButtonText: "ยกเลิก",
      }).then((result) => {
        if (result.isConfirmed) {
          axios
            .post(
              "/api/order/validate-slip",
              {
                id: id_slip,
                validate_status: true,
                validate_by: this.$cookies.get("username"),
              },
              this.headers
            )
            .then((response) => {
              if (response.status == 200) {
                this.$swal({
                  title: "ยืนยันการตรวสอบสลิปสำเร็จ!",
                  icon: "success",
                  confirmButtonText: "ยืนยัน",
                }).then((result) => {
                  this.getSlip(this.id_order);
                });
              }
            });
        }
      });
    },
    getAllOrderGroupByCustomer() {
      this.spinner = true;
      const delayInMilliseconds = 3000;
      setTimeout(function () {
        this.spinner = false;
      }, delayInMilliseconds);

      this.isTableOrderListGroupByCustomerReady = true;
      this.isTableHistoryOrderListReady = false;
      this.isTableOrderListReady = false;
    },
    getAllHistoryOrder() {
      this.spinner = true;
      const delayInMilliseconds = 3000;
      setTimeout(function () {
        this.spinner = false;
      }, delayInMilliseconds);

      this.isTableHistoryOrderListReady = true;
      this.isTableOrderListGroupByCustomerReady = false;
      this.isTableOrderListReady = false;
    },
    getAllOrderGroupByItem() {
      this.spinner = true;
      const delayInMilliseconds = 3000;
      setTimeout(function () {
        this.spinner = false;
      }, delayInMilliseconds);

      this.isTableOrderListReady = true;
      this.isTableOrderListGroupByCustomerReady = false;
      this.isTableHistoryOrderListReady = false;
    },
    viewDetailOrder(orderId) {
      axios
        .get("/api/order/search-order/" + orderId, this.headers)
        .then((response) => {
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
            .delete("/api/order/delete-order", {
              headers: this.headers.headers,
              data: {
                id_order: orderId,
                delivery_date: new Intl.DateTimeFormat("en-US", {
                  day: "2-digit",
                  month: "2-digit",
                  year: "numeric",
                })
                  .format(this.delivery_date)
                  .split("/")
                  .join("-"),
              },
            })
            .then((response) => {
              if (response) {
                this.$swal({
                  title: "ลบรายการสั่งซื้อสำเร็จ",
                  icon: "success",
                  confirmButtonText: "ยืนยัน",
                }).then((result) => {
                  this.$emit("refreshData");
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
          axios
            .get("/api/order/cut-off-order", this.headers)
            .then((response) => {
              if (response) {
                this.$swal({
                  title: "ตัดรอบรายการสั่งซื้อสำเร็จ",
                  icon: "success",
                  confirmButtonText: "ยืนยัน",
                }).then((result) => {
                  this.refetchDate();
                });
              }
            });
        }
      });
    },
    exportLabel(key) {
      let format_date = new Intl.DateTimeFormat("en-US", {
        day: "2-digit",
        month: "2-digit",
        year: "numeric",
      });
      let url = "";
      let title_file = "";
      const body = {
        delivery_date: format_date
          .format(this.delivery_date)
          .split("/")
          .join("-"),
        id_order_list: this.orderSelectedList,
      };
      this.$swal({
        title: "แจ้งเตือน",
        text: "คุณดาวโหลดไฟล์ " + key.toLocaleUpperCase() + " ใช่หรือไม่ ?",
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: "ยืนยัน",
        cancelButtonText: "ยกเลิก",
      }).then((result) => {
        if (result.isConfirmed) {
          if (key == "dhl") {
            url = "/api/order/get-dhl-label-excel-file";
            title_file =
              "DHL-Label " +
              new Intl.DateTimeFormat("en-GB")
                .format(this.delivery_date)
                .split("/")
                .join("-");
          }
          if (key == "kerry") {
            url = "/api/order/get-kerry-label-excel-file";
            title_file =
              "Kerry-Label " +
              new Intl.DateTimeFormat("en-GB")
                .format(this.delivery_date)
                .split("/")
                .join("-");
          }
          if (key == "check-report") {
            url = "/api/order/get-check-report-excel-file";
            title_file =
              "ใบเช็ครายการสั่งซื้อ " +
              new Intl.DateTimeFormat("en-GB")
                .format(this.delivery_date)
                .split("/")
                .join("-");
          }
          axios(
            {
              url: url,
              method: "post",
              responseType: "blob",
              data: body,
              headers: this.headers.headers,
            },
            this.headers
          ).then((response) => {
            if (response) {
              var blob = new Blob([response.data], {
                // type: "application/vnd.ms-excel",
                type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
              });
              const elink = document.createElement("a");
              // elink.download = fileName;
              elink.style.display = "none";
              elink.href = URL.createObjectURL(blob);
              elink.setAttribute(
                "download",
                title_file +
                  " " +
                  format_date.format(this.delivery_date).split("/").join("-") +
                  ".xlsx"
              );
              document.body.appendChild(elink);
              elink.click();
              URL.revokeObjectURL(elink.href);
              document.body.removeChild(elink);

              this.$swal({
                title: "ดาวโหลดไฟล์สำเร็จ",
                text:
                  "คุณได้รับไฟล์ " + title_file + " กรุณาตรวจสอบความถูกต้อง !",
                icon: "success",
                confirmButtonText: "ยืนยัน",
              });
            }
          });
        }
      });
    },
    checkSelectAllMode() {
      this.selectAllMode = !this.selectAllMode;
      this.selectAllMode && this.selectMode
        ? this.selectAllOrderToExport()
        : this.unSelectAllOrderToExport();
    },
    selectAllOrderToExport() {
      this.orderSelectedList = [];
      this.orderListGroupByCustomer.forEach((order) => {
        this.orderSelectedList.push(order.id_order);
      });
    },
    unSelectAllOrderToExport() {
      this.orderSelectedList = [];
    },
    showLog() {
      console.log(this.orderSelectedList);
    },
  },
  mounted() {},
};
</script>