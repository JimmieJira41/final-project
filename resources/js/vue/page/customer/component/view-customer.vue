<template>
  <div class="container card borderless shadow p-3">
    <div class="detail-customer">
      <div class="row">
        <h3>ข้อมูลลูกค้า</h3>
        <p class="col-3">ชื่อ : {{ firstname_customer }}</p>
        <p class="col-3">{{ lastname_customer }}</p>
        <p class="col-6">เบอร์โทรศัพท์ : {{ tel_customer }}</p>

        <h3>ข้อมูลที่อยู่</h3>
        <p>รายละเอียด : {{ description_address_customer }}</p>
        <p class="col-3">จังหวัด : {{ province_address_customer }}</p>
        <p class="col-3">อำเภอ : {{ amphure_address_customer }}</p>
        <p class="col-3">ตำบล : {{ tombon_address_customer }}</p>
        <p class="col-3">รหัสไปรษณี : {{ zipcode_address_customer }}</p>
      </div>
    </div>
    <div class="detail-history-customer">
      <h3>ประวัติรายการสั่งซื้อ</h3>
      <div class="row">
        <div class="col-3 shadow rounded text-center">
          <p><b>จำนวนรายการสั่งซื้อทั้งหมด</b></p>
          <p>{{ history_count }}</p>
        </div>
        <div class="col-3 shadow rounded text-center">
          <p><b>รายการที่ทำการสั่งซื้อบ่อย</b></p>
          <p>รายการ</p>
        </div>
      </div>
      <table class="table table-borderless">
        <thead>
          <tr>
            <th scope="row">รหัส</th>
            <th scope="row">รายละเอียด</th>
            <th scope="row">จำนวน (กล่อง)</th>
            <th scope="row">เวลาสร้างออเดอร์</th>
          </tr>
        </thead>
        <tbody v-if="isTableReady">
          <tr v-for="(history, index) in history_list" v-bind:key="index">
            <td>{{ history.id_order }}</td>
            <td>{{ history.item.description_item }}</td>
            <td>{{ history.number }}</td>
            <td>{{ history.created_at }}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>
<script>
export default {
  data: function () {
    return {
      id_customer: "",
      firstname_customer: "",
      lastname_customer: "",
      tel_customer: "",
      default_id_address: "",
      id_address: "",
      description_address_customer: "",
      province_address_customer: "",
      amphure_address_customer: "",
      tombon_address_customer: "",
      zipcode_address_customer: "",
      history_list: [],
      history_count: 0,
      isTableReady: false,
    };
  },
  methods: {
    viewDetailCustomer(customerId) {
      axios.get("/api/customer/get-customer/" + customerId).then((response) => {
        this.firstname_customer = response.data.firstname_customer;
        this.lastname_customer = response.data.lastname_customer;
        this.tel_customer = response.data.tel_customer;
        this.default_id_address = response.data.default_id_address;
        this.description_address_customer =
          response.data.address.description_address;
        this.province_address_customer = response.data.address.province_address;
        this.amphure_address_customer = response.data.address.amphure_address;
        this.tombon_address_customer = response.data.address.tombon_address;
        this.zipcode_address_customer = response.data.address.zipcode_address;
      });
    },
    getHistoryOrderByCustomerId(customerId) {
      axios
        .get("/api/history/get-history-by-customer-id/" + customerId)
        .then((response) => {
          if (response) {
            this.history_count = response.data.count;
            this.history_list = response.data.historyList;
            this.isTableReady = true;
            console.log(this.history_list);
          }
        });
    },
  },
  mounted() {
    this.id_customer = this.$route.params.id;
    this.viewDetailCustomer(this.id_customer);
    this.getHistoryOrderByCustomerId(this.id_customer);
  },
};
</script>
