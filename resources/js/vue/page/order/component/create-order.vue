<template>
  <div class="container">
    <div>
      <h2 class="mb-4">สร้างรายการสั่งซื้อ</h2>
    </div>
    <div class="card borderless shadow p-3">
      <form class="form-group p-2">
        <h3>ข้อมูลรายการสั่งซื้อ</h3>
        <hr />
        <div class="row">
          <div class="col-12">
            <div class="row my-2">
              <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                <h4><i class="fas fa-user-alt"></i> ข้อมูลผู้สั่งซื้อ</h4>
              </div>
              <div class="col-lg-6 col-md-12 col-sm-12 col-12">
                <div class="row">
                  <div class="col-4 px-1">
                    <button
                      class="btn btn-primary w-100 h-100"
                      type="button"
                      v-on:click="prepareNewCustomer()"
                    >
                      ลูกค้าใหม่
                    </button>
                  </div>
                  <div class="col-4 px-1">
                    <button
                      class="btn btn-primary w-100 h-100"
                      type="button"
                      data-bs-toggle="modal"
                      data-bs-target="#customerListModal"
                    >
                      เลือกรายชื่อลูกค้า
                    </button>
                  </div>
                  <div class="col-4 px-1">
                    <button
                      class="btn btn-warning w-100 h-100"
                      type="button"
                      @click="clearCustomerSelected()"
                    >
                      เคลียร์ข้อมูลลูกค้า
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- </div> -->
          <!-- <div class="row"> -->
          <div v-if="newCustomer" class="row">
            <div class="col-12 col-sm-12 col-md-6 col-lg-4 col-xl-4">
              <label for="firstname_customer">ชื่อ</label>
              <!-- :disabled="isDisable" -->
              <input
                v-model="firstname_customer"
                type="text"
                class="form-control"
                id="firstname_customer"
                placeholder=""
              />
            </div>
            <div class="col-12 col-sm-12 col-md-6 col-lg-4 col-xl-4">
              <label for="lastname_customer">นามสกุล</label>
              <!-- :disabled="isDisable" -->
              <input
                v-model="lastname_customer"
                type="text"
                class="form-control"
                id="lastname_customer"
                placeholder=""
              />
            </div>
            <div class="col-12 col-sm-12 col-md-6 col-lg-4 col-xl-4">
              <label for="tel_customer">เบอร์โทรศัพท์</label>
              <!-- :disabled="isDisable" -->
              <input
                v-model="tel_customer"
                type="tel"
                class="form-control"
                id="tel_customer"
                placeholder=""
              />
            </div>
            <h4 class="my-3">ข้อมูลที่อยู่</h4>
            <div class="col-12">
              <label for="description_address_customer">รายละเอียด</label>
              <!-- :disabled="isDisable" -->
              <textarea
                v-model="description_address_customer"
                type="textarea"
                class="form-control"
                id="description_address_customer"
                placeholder="บ้านเลขที่ ชื่อตึก จุดสังเกต"
              />
            </div>
            <div class="col-12 col-sm-12 col-md-6 col-lg-3 col-xl-3">
              <label for="province_address_customer">จังหวัด</label>
              <!-- :disabled="isDisable" -->
              <Multiselect
                @select="getAmphures()"
                v-model="province_id_selected"
                :searchable="true"
                valueProp="id"
                label="name_th"
                trackBy="name_th"
                :options="province_list"
                placeholder="กรุณาเลือกจังหวัด"
              />
              <!-- <input
            v-model="province_address_customer"
            type="text"
            class="form-control"
            id="province_address_customer"
            placeholder=""
          /> -->
            </div>
            <div class="col-12 col-sm-12 col-md-6 col-lg-3 col-xl-3">
              <label for="amphure_address_customer">อำเภอ</label>
              <!-- :disabled="isDisable" -->
              <Multiselect
                @select="getTombons()"
                v-model="amphure_id_selected"
                :searchable="true"
                valueProp="id"
                label="name_th"
                trackBy="name_th"
                :options="amphure_list"
                placeholder="กรุณาเลือกอำเภอ"
                noOptionsText="กรุณาเลือกจังหวัดก่อนเลือกอำเภอ"
              />
              <!-- <input
            v-model="amphure_address_customer"
            type="text"
            class="form-control"
            id="amphure_address_customer"
            placeholder=""
          /> -->
            </div>
            <div class="col-12 col-sm-12 col-md-6 col-lg-3 col-xl-3">
              <label for="tombon_address_customer">ตำบล</label>
              <!-- :disabled="isDisable" -->
              <Multiselect
                @select="setTombon()"
                v-model="tombon_id_selected"
                :searchable="true"
                valueProp="id"
                label="name_th"
                trackBy="name_th"
                :options="tombon_list"
                placeholder="กรุณาเลือกตำบล"
                noOptionsText="กรุณาเลือกอำเภอก่อนเลือกตำบล"
              />
              <!-- <input
            v-model="tombon_address_customer"
            type="text"
            class="form-control"
            id="tombon_address_customer"
            placeholder=""
          /> -->
            </div>
            <div class="col-12 col-sm-12 col-md-6 col-lg-3 col-xl-3">
              <label for="zipcode_address_customer">รหัสไปรษณี</label>
              <!-- :disabled="isDisable" -->
              <input
                v-model="zipcode_address_customer"
                type="text"
                class="form-control"
                id="zipcode_address_customer"
                placeholder=""
              />
              <!-- </div> -->
            </div>
          </div>
          <div v-if="customerSelectedFlag" class="mt-3">
            <p>
              <b>ชื่อ - นามสกุล : </b>{{ firstname_customer }}
              {{ lastname_customer }}
            </p>
            <p><b>เบอร์โทรศัพท์ : </b>{{ tel_customer }}</p>
            <p><b>ที่อยู่ : </b>{{ description_customer }}</p>
            <p>
              ต.{{ amphure_address_customer }} อ.{{
                tombon_address_customer
              }}
              จ.{{ province_address_customer }} {{ zipcode_address_customer }}
            </p>
          </div>

          <div
            v-if="!customerSelectedFlag && !newCustomer"
            class="text-center text-secondary mt-3"
          >
            <h1><i class="far fa-heart"></i></h1>
            <h3>โปรดเพิ่มข้อมูลลูกค้า</h3>
          </div>
          <hr class="my-4" />
          <h4>ข้อมูลสินค้าที่ทำการสั่งซื้อ</h4>
          <!-- <div class="row"> -->
          <div class="col-lg-6 col-md-6 col-sm-12 col-12 text-start pb-2">
            <v-date-picker mode="date" :masks="masks" v-model="delivery_date">
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
          <div class="col-lg-6 col-md-6 col-sm-12 col-12 text-end">
            <!-- :disabled="
              customerSelected == undefined || customerSelected == null
            " -->
            <button
              class="btn btn-primary"
              type="button"
              data-bs-toggle="modal"
              data-bs-target="#itemListModal"
            >
              เลือกรายการสินค้า
            </button>
            <!-- </div> -->
          </div>

          <div class="table-responsive">
            <table class="table">
              <thead>
                <tr>
                  <th scope="row" class="w-20">รายการ</th>
                  <th scope="row" class="w-20">รายละเอียด</th>
                  <th scope="row" class="w-20 text-center">จำนวนกล่อง</th>
                  <th scope="row" class="w-20 text-center">โปรโมชั่น</th>
                  <th scope="row" class="w-20 text-center">
                    เพิ่มพิเศษ (กิโลกรัม)
                  </th>
                  <th scope="row" class="w-20">ราคาต่อกล่อง</th>
                  <th scope="row" class="w-20">ราคารวม</th>
                  <th class="text-center" scope="row" colspan="3">จัดการ</th>
                </tr>
              </thead>
              <tbody v-if="itemChecked.length == 0">
                <tr>
                  <td colspan="8">
                    <div class="text-center text-secondary mt-3">
                      <h1><i class="fas fa-shopping-basket"></i></h1>
                      <h3>โปรดเลือกสินค้า</h3>
                    </div>
                  </td>
                </tr>
              </tbody>

              <tbody v-if="isItemSelectedTableReady">
                <tr v-for="(item, index) in itemListChecked" v-bind:key="index">
                  <td>{{ item.title_item }}</td>
                  <td>{{ item.description_item }}</td>
                  <td class="w-20">
                    <input
                      v-model="item.number"
                      type="number"
                      class="form-control text-center"
                      placeholder="กรุณากรอกจำนวน"
                      id="number"
                      v-bind:change="
                        calCost(item.number, item.cost_item, index)
                      "
                    />
                  </td>
                  <td class="text-center">
                    <select class="form-select" v-model="item.id_promotion">
                      <option value="">เลือกโปรโมชั่น</option>
                      <option
                        v-for="(promotion, index) in promotionList"
                        v-bind:key="index"
                        :value="promotion.id_promotion"
                      >
                        {{ promotion.title_promotion }}
                      </option>
                    </select>
                  </td>
                  <td>
                    <input
                      v-model="item.extra_number"
                      type="number"
                      id="extra_number"
                      placeholder="กรุณากรอกจำนวนเพิ่มเติม"
                      class="form-control text-center"
                    />
                  </td>
                  <td>
                    <p>{{ item.cost_item }}</p>
                  </td>
                  <td>{{ item.total_cost }}</td>
                  <td class="text-center" v-on:click="removeItem(item.id_item)">
                    <i class="fas fa-trash-alt"></i>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </form>
      <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-12 my-3 text-end">
          <button
            :disabled="validateNumberItem()"
            class="btn btn-primary mx-2"
            v-on:click="submitCreateOrder()"
          >
            ยืนยัน
          </button>
          <button class="btn btn-danger" v-on:click="this.$router.go(-1)">
            ยกเลิก
          </button>
        </div>
      </div>
    </div>
    <div
      class="modal fade"
      tabindex="-1"
      id="itemListModal"
      aria-labelledby="itemListModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-lg modal-dialog-scrollable">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">รายการสินค้า</h5>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body">
            <table class="table">
              <thead>
                <tr>
                  <th scope="row"></th>
                  <th scope="row" colspan="2" class="text-center">
                    รายละเอียด
                  </th>
                </tr>
              </thead>
              <tbody v-if="isReadyItemTable">
                <tr v-for="(item, index) in itemList" v-bind:key="index">
                  <td>
                    <input
                      type="checkbox"
                      id="{{item.title_item}}"
                      v-on:change="!item.isSelected"
                      v-model="itemChecked"
                      v-bind:value="item.id_item"
                      style="width: 20px; height: 20px"
                    />
                  </td>
                  <td>{{ item.title_item }}</td>
                  <td>{{ item.description_item }}</td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="modal-footer">
            <button
              :disabled="!itemChecked.length > 0"
              type="button"
              class="btn btn-primary"
              v-on:click="selectItem()"
              data-bs-dismiss="modal"
            >
              ยืนยัน
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
      id="customerListModal"
      aria-labelledby="customerListModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-lg modal-dialog-scrollable">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">รายชื่อลูกค้า</h5>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body">
            <div class="search-customer">
              <input
                v-model="keyword_search_customer"
                type="text"
                class="form-control"
                id="key-search"
                v-bind:input="searchCustomer()"
              />
            </div>
            <table class="table">
              <thead>
                <tr>
                  <th scope="row"></th>
                  <th scope="row">ชื่อ - นามสกุล</th>
                  <th scope="row">facebook</th>
                  <th scope="row">line</th>
                  <th scope="row">เบอร์โทรศัพท์</th>
                </tr>
              </thead>
              <tbody v-if="isReadyItemTable">
                <tr
                  v-for="(customer, index) in customerList"
                  v-bind:key="index"
                >
                  <td>
                    <input
                      type="radio"
                      name="customer"
                      :value="customer.id_customer"
                      v-model="customerSelected"
                      style="width: 20px; height: 20px"
                    />
                  </td>

                  <td>
                    {{
                      customer.firstname_customer +
                      " " +
                      customer.lastname_customer
                    }}
                  </td>
                  <td>
                    {{ customer.facebook_contact_customer }}
                  </td>
                  <td>
                    {{ customer.line_contact_customer }}
                  </td>
                  <td>
                    {{ customer.tel_customer }}
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-primary"
              v-on:click="selectCustomer()"
              data-bs-dismiss="modal"
            >
              ยืนยัน
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
  </div>
</template>
<script>
import Datepicker from "vuejs3-datepicker";
import Multiselect from "@vueform/multiselect";
export default {
  components: {
    Multiselect,
    Datepicker,
  },
  data: function () {
    return {
      keyword_search_customer: "",
      itemList: [],
      newCustomer: false,
      customerList: [],
      customerSelected: undefined,
      tempCustomerList: [],
      itemChecked: [],
      itemListChecked: [],
      tempItemListChecked: [],
      title_stock: "",
      id_customer: "",
      firstname_customer: "",
      lastname_customer: "",
      tel_customer: "",
      description_stock: "",
      total_stock: 0,
      status_order: false,
      status_payment: false,
      delivery_date: new Date(),
      // total_cost: 0,
      number: "",
      // address
      id_address: "",
      description_address_customer: "",
      province_address_customer: "",
      amphure_address_customer: "",
      tombon_address_customer: "",
      zipcode_address_customer: "",
      province_id_selected: null,
      province_list: [],
      amphure_id_selected: null,
      amphure_list: [],
      tombon_id_selected: null,
      tombon_list: [],
      // promotion
      promotionList: [],
      // data
      isItemSelectedTableReady: false,
      isReadyItemTable: false,
      customerSelectedFlag: false,
      // date
      masks: {
        input: "DD-MM-YYYY",
      },
      headers: {
        headers: {
          "Content-Type": "application/json",
          Authorization: "Bearer " + this.$cookies.get("token"),
        },
      },
    };
  },
  methods: {
    prepareOrder() {
      axios.get("/api/order/prepare-order", this.headers).then((response) => {
        if (response) {
          console.log(response.data);
          this.id_order = response.data.id_order;
        }
      });
    },
    calCost(number, cost, index) {
      if (number && cost)
        this.itemListChecked[index].total_cost = number * cost;
    },
    removeItem(id_item) {
      console.log("click delete : " + id_item);
      console.log(this.itemListChecked.length);
      this.itemChecked = [];
      this.tempItemListChecked = [];
      this.itemListChecked.map((item) => {
        if (item.id_item != id_item) {
          this.tempItemListChecked.push(item);
          this.itemChecked.push(item.id_item);
        }
      });
      console.log(this.itemListChecked.length);
      this.itemListChecked = this.tempItemListChecked;
    },
    selectItem() {
      if (this.itemListChecked.length > 0) {
        this.itemListChecked = [];
      }
      console.log(this.itemList);
      this.itemChecked.forEach((i, index) => {
        this.itemList.forEach((item) => {
          if (item.id_item == i) {
            this.itemListChecked.push(item);
            console.log(this.itemListChecked + " " + index);
            this.itemListChecked[index].number = "";
            this.itemListChecked[index].total_cost = 0;
          }
        });
      });
      console.log(this.itemListChecked);
      // this.itemListChecked = this.itemChecked;
      this.isItemSelectedTableReady = true;
    },
    validateNumberItem() {
      console.log(this.itemChecked.length);
      return this.itemChecked == 0;
    },
    selectRadioCustomer(id_customer) {
      this.tempCustomerList.forEach((customer) => {
        if (customer.id_customer == id_customer) {
          customer.select = true;
        }
      });
      this.customerList.forEach((customer) => {
        if (customer.id_customer == id_customer) {
          customer.select = true;
        }
      });
      this.customerSelected = id_customer;
    },
    selectCustomer() {
      let customerSelected = this.customerList.find(
        (customer) => customer.id_customer == this.customerSelected
      );
      console.log(customerSelected);
      this.id_customer = customerSelected.id_customer;
      this.firstname_customer = customerSelected.firstname_customer;
      this.lastname_customer = customerSelected.lastname_customer;
      this.tel_customer = customerSelected.tel_customer;
      this.description_address_customer =
        customerSelected.address.description_address;
      this.province_address_customer =
        customerSelected.address.province_address;
      this.id_address = customerSelected.default_id_address;
      this.amphure_address_customer = customerSelected.address.amphure_address;
      this.tombon_address_customer = customerSelected.address.tombon_address;
      this.zipcode_address_customer = customerSelected.address.zipcode_address;
      this.customerSelectedFlag = true;
      this.newCustomer = false;
    },
    prepareNewCustomer() {
      this.newCustomer = !this.newCustomer;
      this.firstname_customer = "";
      this.lastname_customer = "";
      this.tel_customer = "";
      this.description_address_customer = "";
      this.province_address_customer = "";
      this.id_address = "";
      this.amphure_address_customer = "";
      this.tombon_address_customer = "";
      this.zipcode_address_customer = "";
    },
    clearCustomerSelected() {
      this.customerSelected = null;
      this.customerSelectedFlag = false;
      this.firstname_customer = "";
      this.lastname_customer = "";
      this.tel_customer = "";
      this.description_address_customer = "";
      this.province_address_customer = "";
      this.amphure_address_customer = "";
      this.tombon_address_customer = "";
      this.zipcode_address_customer = "";
    },
    getAllCustomer() {
      axios
        .get("/api/customer/get-all-customer", this.headers)
        .then((response) => {
          this.customerList = response.data;
          this.customerList.forEach((customer) => {
            customer.select = false;
          });
          this.tempCustomerList = this.customerList;
          console.log(this.tempCustomerList);
        });
    },
    getAllItem() {
      axios.get("/api/item/get-all-item", this.headers).then((response) => {
        if (response) {
          response.data.map((item) => {
            item.isSeleted = false;
            item.id_promotion = "";
            item.number_promotion = "";
            item.extra_number = "";
          });
          this.itemList = response.data;
          console.log(this.itemList);
          this.isReadyItemTable = true;
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
    searchCustomer() {
      console.log(this.customerSelected);
      console.log(this.keyword_search_customer);
      if (
        this.keyword_search_customer == "" ||
        this.keyword_search_customer == 0 ||
        this.keyword_search_customer == null
      ) {
        this.customerList = this.tempCustomerList;
      } else {
        this.customerList = this.tempCustomerList.filter(
          (customer) =>
            customer.firstname_customer.includes(
              this.keyword_search_customer
            ) ||
            customer.lastname_customer.includes(this.keyword_search_customer) ||
            customer.facebook_contact_customer.includes(
              this.keyword_search_customer
            ) ||
            customer.line_contact_customer.includes(
              this.keyword_search_customer
            ) ||
            customer.tel_customer.includes(this.keyword_search_customer)
        );
      }
      console.log(this.customerList);
    },
    submitCreateOrder() {
      let format_date = new Intl.DateTimeFormat("en-US", {
        day: "2-digit",
        month: "2-digit",
        year: "numeric",
      });
      const orderObj = {};
      let orderNotReady = true;
      orderObj.id_order = this.id_order;
      if (this.id_customer == null || this.id_customer == "") {
        orderObj.firstname_customer = this.firstname_customer;
        orderObj.lastname_customer = this.lastname_customer;
        orderObj.tel_customer = this.tel_customer;
        orderObj.description_address_customer =
          this.description_address_customer;
        orderObj.province_address_customer = this.province_address_customer;
        orderObj.amphure_address_customer = this.amphure_address_customer;
        orderObj.tombon_address_customer = this.tombon_address_customer;
        orderObj.zipcode_address_customer = this.zipcode_address_customer;
      } else {
        orderObj.id_customer = this.id_customer;
      }
      orderObj.name_customer =
        this.firstname_customer + " " + this.lastname_customer;
      orderObj.id_address = this.id_address;
      orderObj.items = this.itemListChecked;
      orderObj.create_by = this.$cookies.get("username");
      orderObj.delivery_date = format_date
        .format(this.delivery_date)
        .split("/")
        .join("-");
      orderObj.status_order = this.status_order;
      orderObj.status_payment = this.status_payment;
      console.log(orderObj);
      orderNotReady = this.itemListChecked.some(
        (item) => item.number == "" || item.number == 0 || item.number == null
      );
      if (orderNotReady) {
        this.$swal({
          title: "แจ้งเตือน",
          text: "กรุณากรอกจำนวนสินค้า",
          icon: "info",
          // showCancelButton: true,
          confirmButtonText: "ยืนยัน",
          // cancelButtonText: "ยกเลิก",
        });
      } else {
        this.$swal({
          title: "แจ้งเตือน",
          text: "คุณต้องการสร้างรายการสั่งซื้อใหม่ ใช่หรือไม่ ?",
          icon: "warning",
          showCancelButton: true,
          confirmButtonText: "ยืนยัน",
          cancelButtonText: "ยกเลิก",
        }).then((result) => {
          if (result.isConfirmed) {
            axios
              .post("/api/order/new-order", orderObj, this.headers)
              .then((response) => {
                if (response.status == 200) {
                  this.$swal({
                    title: "สร้างรายการสร้างรายการสั่งซื้อใหม่สำเร็จ",
                    icon: "success",
                    confirmButtonText: "ยืนยัน",
                  }).then((result) => {
                    this.$router.go(-1);
                  });
                }
              })
              .catch((error) => {
    
                this.$swal({
                  title: "สร้างรายการสร้างรายการสั่งซื้อใหม่ไม่สำเร็จ",
                  text: error.response.data,
                  icon: "error",
                  confirmButtonText: "ยืนยัน",
                });
              });
          }
        });
      }
    },
    getProvinces() {
      axios
        .get("/api/address/get-all-province", this.headers)
        .then((response) => {
          if (response) {
            this.province_list = response.data;
            console.log(this.province_list);
          }
        });
    },
    getAmphures() {
      axios
        .get(
          "/api/address/get-amphures/" + this.province_id_selected,
          this.headers
        )
        .then((response) => {
          // this.logSeleted();
          if (response) {
            this.amphure_id_selected = null;
            this.amphure_list = response.data;
            this.province_list.forEach((province) => {
              if (province.id == this.province_id_selected) {
                this.province_address_customer = province.name_th;
              }
            });
            console.log("จังหวัด : " + this.province_address_customer);
          }
        });
    },
    getTombons() {
      axios
        .get(
          "/api/address/get-tombons/" + this.amphure_id_selected,
          this.headers
        )
        .then((response) => {
          if (response) {
            this.tombon_id_selected = null;
            this.tombon_list = response.data;
            this.amphure_list.forEach((amphure) => {
              if (amphure.id == this.amphure_id_selected) {
                this.amphure_address_customer = amphure.name_th;
              }
            });
            console.log(this.tombon_list);
          }
        });
    },
    setTombon() {
      this.tombon_list.forEach((tombon) => {
        if (tombon.id == this.tombon_id_selected) {
          this.tombon_address_customer = tombon.name_th;
          this.zipcode_address_customer = tombon.zip_code;
        }
      });
      this.getZipcode(this.tombon_id_selected);
    },
    getZipcode(tombon_id) {
      axios
        .get("/api/address/get-zipcode/" + tombon_id, this.headers)
        .then((response) => {
          if (response) {
            this.zipcode_address_customer = response.data[0].zipcode;
          }
        });
    },
  },
  mounted() {
    this.prepareOrder();
    this.getAllCustomer();
    this.getAllItem();
    this.getAllPromotion();
    this.getProvinces();
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
