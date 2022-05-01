<template>
  <div class="container">
    <div>
      <h1 class="text-center">จัดการรายการสั่งซื้อ</h1>
    </div>
    <div class="row">
      <div class="col-lg-6 col-md-6 col-sm-12 col-12 m-0 pb-2">
        <!-- <v-calendar /> -->
        <v-date-picker
          mode="date"
          :masks="masks"
          v-model="delivery_date_search"
          :timezone="timezone"
          @click.stop="searchAllList()"
        >
          <template #default="{ inputValue, inputEvents }">
            <label><h5 class="mr-2">รอบจัดส่ง</h5></label>
            <input
              class="px-3 py-1 border rounded"
              :value="inputValue"
              v-on="inputEvents"
              @selected="searchAllList()"
            />
          </template>
        </v-date-picker>
        <!-- <v-date-picker
          class="inline-block h-full"
          v-model="delivery_date_search"
          ><template v-slot="{ inputValue, togglePopover }">
            <div class="flex items-center">
              <button
                class="
                  p-1
                  bg-blue-100
                  border border-blue-200
                  hover:bg-blue-200
                  text-info-600
                  rounded-l
                  focus:bg-blue-500
                  focus:text-white
                  focus:border-blue-500
                  focus:outline-none
                "
                @click="togglePopover()"
              >
                <i class="far fa-calendar-alt"></i>
              </button>
              <input
                :value="inputValue"
                class="
                  bg-white
                  text-gray-700
                  w-full
                  py-1
                  px-2
                  appearance-none
                  border
                  rounded-r
                  focus:outline-none focus:border-blue-500
                "
                readonly
              />
            </div> </template
        ></v-date-picker> -->
        <!-- <datepicker
          placeholder="delivery date"
          v-model="delivery_date_search"
          minimum-view="day"
          maximum-view="day"
          v-on:selected="searchAllList()"
        ></datepicker> -->
      </div>
      <div class="col-lg-6 col-md-6 col-sm-12 col-12 m-0 mb-2 text-end">
        <button class="btn btn-primary" type="button">
          <router-link to="/order/create-order"
            >สร้างรายการสั่งซื้อ</router-link
          >
        </button>
      </div>
    </div>
    <TableOrderList
      :orderList="orderList"
      :orderListGroupByCustomer="orderListGroupByCustomer"
      :historyList="historyList"
    ></TableOrderList>
  </div>
</template>
<script>
import TableOrderList from "./component/table-order-list.vue";
import Datepicker from "vuejs3-datepicker";
import DatePick from "vue-date-pick";
import "vue-date-pick/dist/vueDatePick.css";
import "v-calendar/dist/style.css";
export default {
  components: {
    Datepicker,
    DatePick,
    TableOrderList: TableOrderList,
  },
  data: function () {
    return {
      side_bar: true,
      delivery_date_search: new Date(),
      orderListGroupByCustomer: [],
      historyList: [],
      orderList: [],
      date: "",
      masks: {
        input: "D-MM-YYYY",
      },
      timezone: "Asia/Bangkok",
    };
  },
  methods: {
    searchAllList() {
      let format_date = new Intl.DateTimeFormat("en");
      this.date = format_date
        .format(this.delivery_date_search)
        .split("/")
        .join("-");
      this.getAllOrderGroupByCustomer(this.date);
      this.getAllHistoryOrder(this.date);
      this.getAllOrderGroupByItem(this.date);
    },
    getAllOrderGroupByCustomer(delivery_date_search) {
      axios
        .get("/api/order/get-order-group-by-customer/" + delivery_date_search)
        .then((response) => {
          this.orderListGroupByCustomer = response.data;
          this.isTableOrderListGroupByCustomerReady = true;
          this.isTableHistoryOrderListReady = false;
          this.isTableOrderListReady = false;
        });
    },
    getAllHistoryOrder(delivery_date_search) {
      axios
        .get("/api/history/get-all-history-order/" + delivery_date_search)
        .then((response) => {
          this.historyList = response.data;
          this.isTableHistoryOrderListReady = true;
          this.isTableOrderListGroupByCustomerReady = false;
          this.isTableOrderListReady = false;
        });
    },
    getAllOrderGroupByItem(delivery_date_search) {
      axios
        .get("/api/order/get-order-group-by-item/" + delivery_date_search)
        .then((response) => {
          this.orderList = response.data;
          this.isTableOrderListReady = true;
          this.isTableOrderListGroupByCustomerReady = false;
          this.isTableHistoryOrderListReady = false;
        });
    },
  },
  mounted() {
    this.date = this.delivery_date_search
      .toLocaleString()
      .split(",")[0]
      .split("/")
      .join("-");
    this.getAllOrderGroupByCustomer(this.date);
    this.getAllHistoryOrder(this.date);
    this.getAllOrderGroupByItem(this.date);
  },
};
</script>
