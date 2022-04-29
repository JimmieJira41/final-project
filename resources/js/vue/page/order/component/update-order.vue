<template>
  <div class="container card borderless shadow p-3">
    <form class="form-group p-2">
      <h3>ข้อมูลรายการสั่งซื้อ</h3>
      <hr />
      <div class="row">
        <!-- <div class="row"> -->
        <div class="col-lg-6 col-md-6 col-sm-12 col-12">
          <h4><i class="fas fa-user-alt"></i> ข้อมูลผู้สั่งซื้อ</h4>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-12 col-12 text-end">
          <button
            class="btn btn-primary"
            type="button"
            data-bs-toggle="modal"
            data-bs-target="#customerListModal"
          >
            เลือกรายชื่อลูกค้า
          </button>
          <button
            class="btn btn-warning mx-2"
            type="button"
            @click="clearCustomerSelected()"
          >
            เคลียร์ข้อมูลลูกค้า
          </button>
        </div>
        <!-- <div class="row"> -->
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 col-xl-4">
          <label for="firstname_customer">ชื่อ</label>
          <input
            :disabled="isDisable"
            v-model="firstname_customer"
            type="text"
            class="form-control"
            id="firstname_customer"
            placeholder=""
          />
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 col-xl-4">
          <label for="lastname_customer">นามสกุล</label>
          <input
            :disabled="isDisable"
            v-model="lastname_customer"
            type="text"
            class="form-control"
            id="lastname_customer"
            placeholder=""
          />
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 col-xl-4">
          <label for="tel_customer">เบอร์โทรศัพท์</label>
          <input
            :disabled="isDisable"
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
          <textarea
            :disabled="isDisable"
            v-model="description_address_customer"
            type="textarea"
            class="form-control"
            id="description_address_customer"
            placeholder="บ้านเลขที่ ชื่อตึก จุดสังเกต"
          />
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-3 col-xl-3">
          <label for="province_address_customer">จังหวัด</label>
          <input
            :disabled="isDisable"
            v-model="province_address_customer"
            type="text"
            class="form-control"
            id="province_address_customer"
            placeholder=""
          />
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-3 col-xl-3">
          <label for="amphure_address_customer">อำเภอ</label>
          <input
            :disabled="isDisable"
            v-model="amphure_address_customer"
            type="text"
            class="form-control"
            id="amphure_address_customer"
            placeholder=""
          />
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-3 col-xl-3">
          <label for="tombon_address_customer">ตำบล</label>
          <input
            :disabled="isDisable"
            v-model="tombon_address_customer"
            type="text"
            class="form-control"
            id="tombon_address_customer"
            placeholder=""
          />
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-3 col-xl-3">
          <label for="zipcode_address_customer">รหัสไปรษณี</label>
          <input
            :disabled="isDisable"
            v-model="zipcode_address_customer"
            type="text"
            class="form-control"
            id="zipcode_address_customer"
            placeholder=""
          />
          <!-- </div> -->
        </div>
        <hr class="my-4" />
        <h4 class="text-center">ข้อมูลสินค้าที่ทำการสั่งซื้อ</h4>
        <div class="col-12 text-end pb-2">
          <h4>
            สถานะการชำระเงิน :
            <p v-if="!status_payment" class="text-danger">ค้างชำระเงิน</p>
            <p v-else class="text-success">ชำระเงินแล้ว</p>
          </h4>
        </div>
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
          <button
            :disabled="
              customerSelected == undefined || customerSelected == null
            "
            class="btn btn-warning mx-auto"
            type="button"
            v-on:click="status_payment = true"
          >
            อัพเดรตสถานะรายการสั่งซื้อ
          </button>
          <button
            :disabled="
              customerSelected == undefined || customerSelected == null
            "
            class="btn btn-primary mx-auto"
            type="button"
            data-bs-toggle="modal"
            data-bs-target="#itemListModal"
          >
            เลือกรายการสินค้า
          </button>
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
            <tbody v-if="isItemSelectedTableReady">
              <tr v-for="(item, index) in itemListChecked" v-bind:key="index">
                <td>{{ item.title_item }}</td>
                <td>{{ item.description_item }}</td>
                <td>
                  <input
                    v-model="item.number"
                    type="number"
                    class="form-control text-center"
                    placeholder="กรุณากรอกจำนวน"
                    id="number"
                    v-bind:change="calCost(item.number, item.cost_item, index)"
                  />
                </td>
                <td class="text-center">
                  <select class="form-select" v-model="item.id_promotion">
                    <option value="null">เลือกโปรโมชั่น</option>
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
                  <!-- <i class="far fa-clipboard"></i> -->
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
          class="btn btn-primary mx-1"
          v-on:click="submitUpdateOrder()"
        >
          ยืนยัน
        </button>
        <button
          class="btn btn-danger mx-1"
          v-on:click="this.$router.go(-1)"
        >
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
                <th scope="row" colspan="2" class="text-center">รายละเอียด</th>
              </tr>
            </thead>
            <tbody v-if="isReadyItemTable">
              <tr v-for="(item, index) in itemList" v-bind:key="index">
                <input
                  type="checkbox"
                  id="{{item.title_item}}"
                  v-on:change="!item.isSelected"
                  v-model="itemChecked"
                  v-bind:value="item.id_item"
                />
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
          <table class="table">
            <thead>
              <tr>
                <th scope="row"></th>
                <th scope="row">ชื่อ - นามสกุล</th>
              </tr>
            </thead>
            <tbody v-if="isReadyItemTable">
              <tr v-for="(customer, index) in customerList" v-bind:key="index">
                <input
                  type="radio"
                  id="{{customer.id_customer}}"
                  v-model="customerSelected"
                  v-bind:value="customer.id_customer"
                />
                <td>
                  {{
                    customer.firstname_customer +
                    " " +
                    customer.lastname_customer
                  }}
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
</template>
<script>
import Datepicker from "vuejs3-datepicker";
export default {
  components: {
    Datepicker,
  },
  data: function () {
    return {
      keyword_search_customer: "",
      itemList: [],
      customerList: [],
      customerSelected: undefined,
      itemChecked: [],
      itemListChecked: [],
      currentItemListChecked: [],
      tempItemListChecked: [],
      title_stock: "",
      id_customer: "",
      id_order: "",
      status_payment: false,
      firstname_customer: "",
      lastname_customer: "",
      tel_customer: "",
      description_stock: "",
      total_stock: 0,
      delivery_date: new Date(),
      // total_cost: 0,
      number: 0,
      // address
      description_address_customer: "",
      province_address_customer: "",
      amphure_address_customer: "",
      tombon_address_customer: "",
      zipcode_address_customer: "",
      // promotion
      promotionList: [],
      // data
      isItemSelectedTableReady: false,
      isReadyItemTable: false,
      isDisable: false,
    };
  },
  methods: {
    calCost(number, cost, index) {
      if (number == 0) {
        this.itemListChecked[index].total_cost = number * cost;
      }
      if (number && cost) {
        this.itemListChecked[index].total_cost = number * cost;
      }
    },
    removeItem(id_item) {
      console.log("click delete : " + id_item);
      console.log(this.itemListChecked.length);
      this.itemChecked = [];
      this.currentItemListChecked = [];
      this.itemListChecked.map((item) => {
        if (item.id_item != id_item) {
          this.currentItemListChecked.push(item);
          this.itemChecked.push(item.id_item);
        }
      });
      console.log(this.itemListChecked.length);
      this.itemListChecked = this.currentItemListChecked;
    },
    selectItem() {
      if (this.itemListChecked.length > 0) {
        this.itemListChecked = [];
      }
      console.log(this.itemList);
      this.itemChecked.forEach((i) => {
        this.itemList.forEach((item) => {
          if (item.id_item == i) {
            this.itemListChecked.push(item);
            console.log("itemListChecked : " + this.itemListChecked.length);
            let indexList = this.itemListChecked.length - 1;
            console.log("indexList : " + indexList);
            console.log("item: " + this.itemListChecked[indexList].id_item);
            let tempItemList = [];
            this.tempItemListChecked.forEach((tempItem) => {
              tempItemList.push(parseInt(tempItem.id_item));
            });
            console.log(tempItemList);
            let indexTarget = tempItemList.indexOf(
              this.itemListChecked[indexList].id_item
            );
            console.log(this.itemListChecked[indexList].id_item);

            if (indexTarget != -1) {
              console.log("indeTarget : " + indexTarget);
              this.itemListChecked[indexList].number =
                this.tempItemListChecked[indexTarget].number;
              this.itemListChecked[indexList].total_cost =
                this.tempItemListChecked[indexTarget].total_cost;
            } else {
              this.itemListChecked[indexList].number = 0;
              this.itemListChecked[indexList].total_cost = 0;
            }
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
      this.amphure_address_customer = customerSelected.address.amphure_address;
      this.tombon_address_customer = customerSelected.address.tombon_address;
      this.zipcode_address_customer = customerSelected.address.zipcode_address;
      this.isDisable = true;
    },
    clearCustomerSelected() {
      this.customerSelected = null;
      this.isDisable = false;
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
      axios.get("/api/customer/get-all-customer").then((response) => {
        response.data.map((customer) => {
          if (customer.id_customer == this.id_customer) {
            this.customerSelected = customer.id_customer;
          }
        });
        this.customerList = response.data;
      });
    },
    getAllItem() {
      axios.get("/api/item/get-all-item").then((response) => {
        if (response) {
          response.data.map((item) => {
            item.isSeleted = false;
          });
          this.itemList = response.data;
          this.isReadyItemTable = true;
        }
      });
    },
    getAllPromotion() {
      axios.get("/api/promotion/get-all-promotion").then((response) => {
        if (response) {
          this.promotionList = response.data;
          this.isTablePromotionListReady = true;
        }
      });
    },
    getOrder(id_order) {
      axios.get("/api/order/get-order/" + id_order).then((response) => {
        if (response) {
          this.id_customer = response.data.customer.id_customer;
          this.firstname_customer = response.data.customer.firstname_customer;
          this.lastname_customer = response.data.customer.lastname_customer;
          this.tel_customer = response.data.customer.tel_customer;
          this.description_address_customer =
            response.data.address.description_address;
          this.province_address_customer =
            response.data.address.province_address;
          this.amphure_address_customer = response.data.address.amphure_address;
          this.tombon_address_customer = response.data.address.tombon_address;
          this.zipcode_address_customer = response.data.address.zipcode_address;
          this.status_payment = response.data.status_payment;
          response.data.subOrders.forEach((order) => {
            this.itemListChecked.push(order);
          });
          this.itemListChecked.forEach((item) => {
            this.itemChecked.push(item.id_item);
          });
          this.delivery_date = new Date(response.data.delivery_date);
          this.tempItemListChecked = this.itemListChecked;
          this.isItemSelectedTableReady = true;
          console.log(this.itemChecked);
          console.log(this.itemListChecked);
        }
      });
    },
    getCustomer(keyword_search_customer) {
      axios
        .get("/api/customer/get-customer/" + keyword_search_customer)
        .then((response) => {
          if (response) {
            this.customerList.push(response.data.id_customer);
            console.log(this.customerList);
            this.firstname_customer = response.data.firstname_customer;
            this.lastname_customer = response.data.lastname_customer;
            this.tel_customer = response.data.tel_customer;
            this.description_address_customer =
              response.data.address.description_address;
            this.province_address_customer =
              response.data.address.province_address;
            this.amphure_address_customer =
              response.data.address.amphure_address;
            this.tombon_address_customer = response.data.address.tombon_address;
            this.zipcode_address_customer =
              response.data.address.zipcode_address;
            this.getOrderByCustomerId(keyword_search_customer);
          }
        });
    },
    submitUpdateOrder() {
      const orderObj = {};
      let orderNotReady = true;
      orderObj.id_order = this.id_order;
      orderObj.id_customer = this.id_customer;
      orderObj.name_customer = String(
        this.firstname_customer + " " + this.lastname_customer
      );
      orderObj.id_address = 1;
      orderObj.subOrders = this.itemListChecked;
      orderObj.create_by = "jimmie";
      orderObj.status_payment = this.status_payment;
      orderObj.delivery_date = this.delivery_date;
      // let tempList = [];
      // this.tempItemListChecked.forEach((temp) => {
      //   tempList.push(temp.id_item);
      // });
      // this.itemListChecked.forEach((item) => {
      //   let index = tempList.indexOf(item.id_item);
      //   if (index != -1) {
      //     item.id_order = this.tempItemListChecked[index].id_order;
      //   } else {
      //     item.id_order = "";
      //   }
      // });
      // orderObj.items = this.itemListChecked;
      // this.tempItemListChecked.forEach((tempItem) =>{
      //   if(this.itemChecked.indexOf(tempItem.id_item) == -1){
      //     orderObj.items.push({
      //       id_order : tempItem.id_order,
      //       id_item : ""
      //     })
      //   }
      // })
      // orderObj.create_by = "jimmie";
      // console.log(orderObj);
      orderNotReady = this.itemListChecked.some(
        (item) => item.number == "" || item.number == 0
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
          text: "คุณต้องการอัพเดรตสต็อกสินค้าใหม่ ใช่หรือไม่ ?",
          icon: "warning",
          showCancelButton: true,
          confirmButtonText: "ยืนยัน",
          cancelButtonText: "ยกเลิก",
        }).then((result) => {
          if (result.isConfirmed) {
            axios.put("/api/order/update-order", orderObj).then((response) => {
              if (response) {
                this.$swal({
                  title: "อัพเดรตสำเร็จ",
                  icon: "success",
                  confirmButtonText: "ยืนยัน",
                }).then((result) => {
                  this.$router.go(-1);
                });
              }
            });
          }
        });
      }
    },
  },
  mounted() {
    this.id_order = this.$route.params.id_order;
    // this.id_order = this.$route.params.id_order;
    // this.id_item = this.$route.params.id_item;
    // this.getCustomer(this.id_customer);
    this.getOrder(this.id_order);
    this.getAllCustomer();
    this.getAllItem();
    this.getAllPromotion();
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
