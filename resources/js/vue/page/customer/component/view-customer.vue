<template>
  <div class="container">
    <div>
      <h2 class="mb-4">รายละเอียดข้อมูลลูกค้า</h2>
    </div>
    <div class="card borderless shadow p-3">
      <div class="detail-customer">
        <div class="row">
          <h3 class="text-center">ข้อมูลลูกค้า</h3>
          <hr />
          <div class="col-12 col-sm-12 col-md-12 col-lg-4 col-xl-4 mb-2">
            <div class="card shadow p-0">
              <div class="card-header">ข้อมูลทั่วไป</div>
              <div class="card-body">
                <div class="row">
                  <p class="col-6">
                    ชื่อ : {{ firstname_customer }} {{ lastname_customer }}
                  </p>
                  <p class="col-12">เบอร์โทรศัพท์ : {{ tel_customer }}</p>
                </div>
              </div>
            </div>
          </div>

          <div class="col-12 col-sm-12 col-md-12 col-lg-8 col-xl-8">
            <div class="card shadow p-0">
              <div class="card-header">ข้อมูลที่อยู่</div>
              <div class="card-body">
                <div class="row">
                  <p>รายละเอียด : {{ description_address_customer }}</p>
                  <p>จังหวัด : {{ province_address_customer }}</p>
                  <p>อำเภอ : {{ amphure_address_customer }}</p>
                  <p>ตำบล : {{ tombon_address_customer }}</p>
                  <p>รหัสไปรษณี : {{ zipcode_address_customer }}</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="detail-history-customer py-4">
        <h3>ประวัติรายการสั่งซื้อ</h3>
        <div class="row p-2 mb-2">
          <div class="col-5">
            <div class="shadow rounded bg-warning text-center p-2">
              <p><b>จำนวนรายการสั่งซื้อทั้งหมด</b></p>
              <h3><p>{{ historyCount }}</p></h3>
            </div>
          </div>
          <div class="col-7">
            <div class="shadow rounded bg-warning text-center p-2">
              <p><b>รายการที่ทำการสั่งซื้อบ่อย</b></p>
              <h3 v-if="favoriteItem">{{ favoriteItem }}</h3>
              <h3 v-else>ไม่พบข้อมูล</h3>
            </div>
          </div>
        </div>
        <div class="tbody-scroll">
          <table v-if="isTableReady">
            <thead>
              <tr>
                <th scope="row">รหัส</th>
                <th scope="row">รายชื่อลูกค้า</th>
                <th scope="row">รายการสั่งซื้อ</th>
              </tr>
            </thead>
            <tbody v-if="historyList.length">
              <tr v-for="(order, index) in historyList" v-bind:key="index">
                <td>{{ order.id_order }}</td>
                <td>{{ order.name_customer }}</td>
                <td>
                  <ul>
                    <li v-for="(item, index) in order.item" v-bind:key="index">
                      {{ item.title_item }} => {{ item.number }} กล่อง
                    </li>
                  </ul>
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
      </div>
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
      historyList: [],
      favoriteItem: "",
      historyCount: 0,
      isTableReady: false,
      headers: {
        headers: {
          "Content-Type": "application/json",
          Authorization: "Bearer " + this.$cookies.get("token"),
        },
      },
    };
  },
  methods: {
    viewDetailCustomer(customerId) {
      axios
        .get("/api/customer/get-customer/" + customerId, this.headers)
        .then((response) => {
          this.firstname_customer = response.data.firstname_customer;
          this.lastname_customer = response.data.lastname_customer;
          this.tel_customer = response.data.tel_customer;
          this.default_id_address = response.data.default_id_address;
          this.description_address_customer =
            response.data.address.description_address;
          this.province_address_customer =
            response.data.address.province_address;
          this.amphure_address_customer = response.data.address.amphure_address;
          this.tombon_address_customer = response.data.address.tombon_address;
          this.zipcode_address_customer = response.data.address.zipcode_address;
        });
    },
    getHistoryOrderByCustomerId(customerId) {
      axios
        .get(
          "/api/history/get-history-by-customer-id/" + customerId,
          this.headers
        )
        .then((response) => {
          if (response) {
            this.historyCount = response.data.count;
            this.favoriteItem = response.data.favorite_item;
            this.historyList = response.data.historyList;
            this.isTableReady = true;
            console.log(response.data.historyList);
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
