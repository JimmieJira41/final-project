<template>
  <div class="table-response card shadow border-0 p-3">
    <h3>รายการลูกค้า</h3>
    <hr />
    <div class="tbody-scroll">
      <table>
        <thead>
          <tr>
            <th scope="row">ขื่อ-นามสกุล</th>
            <th scope="row">ที่อยู่</th>
            <th scope="row">เบอร์โทรศัพท์</th>
            <th class="text-center" scope="row" colspan="3">จัดการ</th>
          </tr>
        </thead>
        <tbody v-if="isTableReady">
          <tr v-for="(customer, index) in customerList" v-bind:key="index">
            <td>
              {{
                customer.firstname_customer + " " + customer.lastname_customer
              }}
            </td>
            <td>{{ customer.address.description_address + " ต." + customer.address.tombon_address + " อ." + customer.address.amphure_address+ " จ." + customer.address.province_address +" " + customer.address.zipcode_address }}</td>
            <td>{{ customer.tel_customer }}</td>
            <td class="text-center">
              <router-link
                :to="'/customer/view-customer/' + customer.id_customer"
                ><i class="fas fa-eye"></i
              ></router-link>
            </td>
            <td class="text-center">
              <router-link
                :to="'/customer/update-customer/' + customer.id_customer"
                ><i class="fas fa-cog"></i
              ></router-link>
            </td>
            <td
              class="text-center"
              v-on:click="deleteCustomer(customer.id_customer)"
            >
              <i class="fas fa-trash-alt"></i>
            </td>
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
      isTableReady: false,
      customerList: [],
      customer: Object,
      headers: {
        headers: {
          "Content-Type": "application/json",
          Authorization: "Bearer " + this.$cookies.get("token"),
        },
      },
    };
  },
  methods: {
    getAllCustomer() {
      axios
        .get("/api/customer/get-all-customer", this.headers)
        .then((response) => {
          this.customerList = response.data;
          this.isTableReady = true;
        });
    },
    viewDetailCustomer(customerId) {
      axios
        .get("/api/customer/search-customer/" + customerId, this.headers)
        .then((response) => {
          this.customer = response.data;
          console.table(this.customer);
        });
    },
    deleteCustomer(customerId) {
      this.$swal({
        title: "แจ้งเตือน",
        text: "คุณต้องการลบรายการลูกค้า ใช่หรือไม่ ?",
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: "ยืนยัน",
        cancelButtonText: "ยกเลิก",
      }).then((result) => {
        if (result.isConfirmed) {
          axios
            .delete("/api/customer/delete-customer", {
              headers: this.headers.headers,
              data: { id_customer: customerId },
            })
            .then((response) => {
              if (response) {
                this.$swal({
                  title: "ลบรายการลูกค้ารายสำเร็จ",
                  icon: "success",
                  confirmButtonText: "ยืนยัน",
                }).then((result) => {
                  this.getAllCustomer();
                });
              }
            });
        }
      });
    },
  },
  mounted() {
    this.getAllCustomer();
  },
};
</script>