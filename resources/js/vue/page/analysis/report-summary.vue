<template>
  <div class="container-fiuld px-3">
    <div>
      <h1 class="text-center">พิมพ์ใบสรุป</h1>
    </div>
    <div class="btn btn-warning mb-1">
      <router-link to="/analysis">ย้อนกลับ</router-link>
    </div>
    <div class="card">
      <div class="card-body">
        <div class="row">
          <div class="col-6">
            <div class="col-12 mb-4">
              <h4><u>รายละเอียดใบสรุป</u></h4>
            </div>
            <form class="form-group">
              <div
                class="row my-2"
                v-for="(detail, index) in detailReport"
                v-bind:key="index"
              >
                <div class="col-4 d-flex justify-content-between">
                  <label for=""
                    ><h5>{{ detail.title }}</h5></label
                  >
                  <div>
                    <span
                      v-if="detail.type == 'รายรับ'"
                      class="badge bg-success"
                      >{{ detail.type }}</span
                    >
                    <span
                      v-if="detail.type == 'รายจ่าย'"
                      class="badge bg-warning text-dark"
                      >{{ detail.type }}</span
                    >
                  </div>
                </div>
                <div class="col-4">
                  <input
                    v-model="detail.value"
                    type="text"
                    class="form-control"
                    id="{{detail.title}}"
                    placeholder=""
                    :disabled="!detail.checked"
                  />
                </div>
                <div class="col-4">
                  <input
                    type="checkbox"
                    id="{{index}}"
                    v-model="detail.checked"
                    style="width: 20px; height: 20px"
                  />
                </div>
              </div>
              <div
                class="btn btn-primary"
                data-bs-toggle="modal"
                data-bs-target="#detailReportLabel"
              >
                แก้ไขรายละเอียดรายรับ-รายจ่าย
              </div>
            </form>
          </div>
          <div class="col-6">
            <div class="col-lg-6 col-md-6 col-sm-12 col-12 m-0 pb-2">
              <v-date-picker
                mode="date"
                :masks="masks"
                v-model="delivery_date_search"
                :timezone="timezone"
                @click.stop="getTotalUseStock()"
              >
                <template #default="{ inputValue, inputEvents }">
                  <label><h5 class="mr-2">รอบจัดส่ง</h5></label>
                  <input
                    class="px-3 py-1 border rounded"
                    :value="inputValue"
                    v-on="inputEvents"
                  />
                </template>
              </v-date-picker>
            </div>
            <table class="table">
              <thead>
                <tr>
                  <th>รายการสต็อก</th>
                  <th>จำนวนที่ใช้</th>
                  <th>จำนวนคงเหลือ</th>
                </tr>
              </thead>
              <tbody v-if="!stockUsedList.length">
                <tr>
                  <td class="text-center" colspan="3"><h3>ไม่พบข้อมูล</h3></td>
                </tr>
              </tbody>
              <tbody>
                <tr v-for="(stock, index) in stockUsedList" v-bind:key="index">
                  <td>{{ stock.title_stock }}</td>
                  <td>{{ stock.total_used }} <b>kg.</b></td>
                  <td>- <b>kg.</b></td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="col-12 text-end">
            <div class="btn btn-warning" v-on:click="exportReport()">
              พิมพ์ใบสรุป
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div
    class="modal fade"
    tabindex="-1"
    id="detailReportLabel"
    aria-labelledby="detailReportLabel"
    aria-hidden="true"
  >
    <div class="modal-dialog modal-md modal-dialog-scrollable">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">รายการรายรับ-รายจ่าย</h5>
          <button
            type="button"
            class="btn-close"
            data-bs-dismiss="modal"
            aria-label="Close"
          ></button>
        </div>
        <div class="modal-body">
          <table>
            <thead>
              <tr>
                <td>รายการ</td>
                <td>ประเภท</td>
                <td>ค่าเริ่มต้น</td>
                <td colspan="2">จัดการ</td>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(detail, index) in detailReport" v-bind:key="index">
                <td>{{ detail.title }}</td>
                <td>{{ detail.type }}</td>
                <td>
                  <input
                    type="checkbox"
                    id="{{index}}"
                    v-model="detail.status_default"
                    style="width: 20px; height: 20px"
                    v-on:click="updateDetailReport(detail)"
                  />
                </td>
                <td class="p-1" alt="แก้ไข">
                  <button
                    type="button"
                    class="btn btn-outline-primary"
                    data-bs-toggle="modal"
                    data-bs-target="#formDetailReportLabel"
                    v-on:click="getDetailReportById(detail.id_detail_report)"
                  >
                    <i class="fas fa-cog fs-5"></i>
                  </button>
                </td>
                <td class="p-1">
                  <button
                    type="button"
                    class="btn btn-outline-primary"
                    alt="ลบรายการ"
                    v-on:click="deleteDetailReport(detail)"
                  >
                    <i class="fas fa-trash-alt fs-5"></i>
                  </button>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="modal-footer">
          <button
            type="button"
            class="btn btn-primary"
            data-bs-toggle="modal"
            data-bs-target="#formDetailReportLabel"
          >
            เพิ่มรายการรายรับ-รายจ่าย
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
    tabindex="-1"
    id="formDetailReportLabel"
    aria-labelledby="formDetailReportLabel"
    aria-hidden="true"
  >
    <div class="modal-dialog modal-md modal-dialog-scrollable">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">รายการรายรับ-รายจ่าย</h5>
          <button
            type="button"
            class="btn-close"
            data-bs-dismiss="modal"
            aria-label="Close"
          ></button>
        </div>
        <div class="modal-body">
          <form>
            <div class="form-group">
              <label>รายการ</label>
              <input
                class="form-control"
                type="text"
                v-model="formIncomeExpense.title"
              />
            </div>
            <div class="form-group">
              <label>ประเภท</label>
              <select class="form-select" v-model="formIncomeExpense.type">
                <option value="">กรุณาเลือกประเภทรายการ</option>
                <option value="รายรับ">รายรับ</option>
                <option value="รายจ่าย">รายจ่าย</option>
              </select>
            </div>
          </form>
        </div>
        <div class="modal-footer">
          <button
            type="button"
            class="btn btn-primary"
            v-on:click="submitDetailReport"
          >
            ยืนยัน
          </button>
          <button
            type="button"
            class="btn btn-secondary"
            data-bs-toggle="modal"
            data-bs-target="#detailReportLabel"
            v-on:click="clearFormDetailReport"
          >
            ยกเลิก
          </button>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import Datepicker from "vuejs3-datepicker";
export default {
  components: {
    Datepicker,
  },
  data: function () {
    return {
      detailList: [],
      stockUsedList: [],
      detailReport: [],
      delivery_date_search: new Date(),
      date: "",
      masks: {
        input: "DD-MM-YYYY",
      },
      timezone: "Asia/Bangkok",
      headers: {
        headers: {
          "Content-Type": "application/json",
          Authorization: "Bearer " + this.$cookies.get("token"),
        },
      },
      formIncomeExpense: {
        id_detail_report: "",
        title: "",
        type: "",
        status_default: false,
      },
    };
  },
  methods: {
    getDetailReportById(id_detail_report) {
      axios
        .get(
          "/api/analysis/get-detail-report-by-id/" + id_detail_report,
          this.headers
        )
        .then((response) => {
          if (response.status == 200) {
            this.formIncomeExpense = response.data;
            console.log(response.data);
          }
        });
    },
    createDetailReport(data) {
      console.log(data);
      console.log("create");
      this.$swal({
        title: "แจ้งเตือน",
        text:
          "คุณต้องการสร้างรายการ " +
          data.title +
          " ประเภท " +
          data.type +
          " ใช่หรือไม่ ?",
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: "ยืนยัน",
        cancelButtonText: "ยกเลิก",
      }).then((result) => {
        if (result.isConfirmed) {
          axios
            .post("/api/analysis/create-detail-report", data, this.headers)
            .then((response) => {
              if (response) {
                this.$swal({
                  title: "แจ้งเตือน",
                  text:
                    "การสร้างรายการ " +
                    data.title +
                    " ประเภท " +
                    data.type +
                    " สำเร็จ!",
                  icon: "success",
                  confirmButtonText: "ยืนยัน",
                });
                this.getDetailReport();
              }
            });
        }
      });
    },
    updateDetailReport(data) {
      console.log(data);
      console.log("update");
      this.$swal({
        title: "แจ้งเตือน",
        text:
          "คุณต้องการอัพเดรตรายการ " +
          data.title +
          " ประเภท " +
          data.type +
          " ใช่หรือไม่ ?",
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: "ยืนยัน",
        cancelButtonText: "ยกเลิก",
      }).then((result) => {
        if (result.isConfirmed) {
          axios
            .post("/api/analysis/update-detail-report", data, this.headers)
            .then((response) => {
              if (response.status == 200) {
                this.$swal({
                  title: "แจ้งเตือน",
                  text:
                    "การอัพเดรตรายการ " +
                    data.title +
                    " ประเภท " +
                    data.type +
                    " สำเร็จ!",
                  icon: "success",
                  confirmButtonText: "ยืนยัน",
                });
                this.getDetailReport();
              }
            });
        }
      });
    },
    deleteDetailReport(data) {
      this.$swal({
        title: "แจ้งเตือน",
        text:
          "คุณต้องการลบรายการ " +
          data.title +
          " ประเภท " +
          data.type +
          " ใช่หรือไม่ ?",
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: "ยืนยัน",
        cancelButtonText: "ยกเลิก",
      }).then((result) => {
        if (result.isConfirmed) {
          axios
            .delete("/api/analysis/delete-detail-report", {
              headers: this.headers.headers,
              data: data,
            })
            .then((response) => {
              if (response.status == 200) {
                this.$swal({
                  title: "แจ้งเตือน",
                  text:
                    "การอัพเดรตรายการ " +
                    data.title +
                    " ประเภท " +
                    data.type +
                    " สำเร็จ!",
                  icon: "success",
                  confirmButtonText: "ยืนยัน",
                });
                this.getDetailReport();
              }
            });
        }
      });
    },
    submitDetailReport() {
      console.log(this.formIncomeExpense);
      if (this.formIncomeExpense.id_detail_report) {
        this.updateDetailReport(this.formIncomeExpense);
      } else {
        this.createDetailReport(this.formIncomeExpense);
      }
    },
    clearFormDetailReport() {
      this.formIncomeExpense.id_detail_report = "";
      this.formIncomeExpense.title = "";
      this.formIncomeExpense.type = "";
      this.formIncomeExpense.status_default = "";
    },
    getDetailReport() {
      axios
        .get("/api/analysis/get-detail-report/", this.headers)
        .then((response) => {
          if (response) {
            this.detailReport = response.data;
            this.detailReport.forEach((detail) => {
              detail.value = "";
              detail.checked = detail.status_default;
            });
          }
        });
    },
    getTotalUseStock() {
      console.log(this.delivery_date_search);
      let format_date = new Intl.DateTimeFormat("en-US", {
        day: "2-digit",
        month: "2-digit",
        year: "numeric",
      });
      this.date = format_date
        .format(this.delivery_date_search)
        .split("/")
        .join("-");
      axios
        .get("/api/analysis/get-total-used-stock/" + this.date, this.headers)
        .then((response) => {
          if (response) {
            this.stockUsedList = response.data.order_list;
            this.detailReport.forEach((detail) => {
              if (
                detail.id_detail_report == 1 ||
                detail.title == "รายได้ทั้งหมด"
              ) {
                detail.value = response.data.total_sale;
              }
            });
          }
        });
    },
    exportReport() {
      console.log(this.delivery_date_search);
      let format_date = new Intl.DateTimeFormat("en-US", {
        day: "2-digit",
        month: "2-digit",
        year: "numeric",
      });
      let url = "/api/analysis/export-summary-report";
      let title_file = "";
      let detail_list = [];
      this.detailReport.forEach((detail) => {
        if (detail.checked) {
          detail_list.push({ header: detail.title, value: detail.value });
        }
      });
      console.log(detail_list);
      const body = {
        delivery_date: format_date
          .format(this.delivery_date_search)
          .split("/")
          .join("-"),
        detail_list: detail_list,
      };
      this.$swal({
        title: "แจ้งเตือน",
        text: "คุณดาวโหลดไฟล์ใบสรุปผล ใช่หรือไม่ ?",
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: "ยืนยัน",
        cancelButtonText: "ยกเลิก",
      }).then((result) => {
        if (result.isConfirmed) {
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
                  format_date
                    .format(this.delivery_date_search)
                    .split("/")
                    .join("-") +
                  ".xlsx"
              );
              document.body.appendChild(elink);
              elink.click();
              URL.revokeObjectURL(elink.href);
              document.body.removeChild(elink);

              this.$swal({
                title: "ดาวโหลดไฟล์สำเร็จ",
                text: "คุณได้รับไฟล์ใบสรุปผล กรุณาตรวจสอบความถูกต้อง !",
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
    this.getDetailReport();
    this.getTotalUseStock();
  },
};
</script>
