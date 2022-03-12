<template>
    <div class="container card borderless shadow p-3">
        <form class="form-group">
            <h3>ข้อมูลรายการสั่งซื้อ</h3>
            <hr />
            <h4>ข้อมูลผู้สั่งซื้อ</h4>
            <div class="row p-2">
                <div class="row">
                    <div class="col-12">
                        <select
                            v-model="customerSelected"
                            v-on:change="selectCustomer()"
                        >
                            <option
                                v-for="(customer, index) in customerList"
                                v-bind:key="index"
                                v-bind:value="{
                                    id_customer: customer.id_customer,
                                    firstname_customer:
                                        customer.firstname_customer,
                                    lastname_customer:
                                        customer.lastname_customer,
                                    tel_customer: customer.tel_customer,
                                    description_address_customer: customer.address.description_address,
                                    province_address_customer: customer.address.province_address,
                                    amphure_address_customer: customer.address.amphure_address,
                                    tombon_address_customer: customer.address.tombon_address,
                                    zipcode_address_customer: customer.address.zipcode_address
                                }"
                            >
                                {{
                                    customer.firstname_customer +
                                    " " +
                                    customer.lastname_customer
                                }}
                            </option>
                        </select>
                        <!-- <label for="keyword_search_customer"></label>
                        <input
                            v-model="keyword_search_customer"
                            type="text"
                            class="form-control"
                            id="keyword_search_customer"
                            placeholder=""
                        /> -->
                    </div>
                    <div class="col-12 col-sm-12 col-md-6 col-lg-4 col-xl-4">
                        <label for="firstname_customer">ชื่อ</label>
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
                        <input
                            v-model="tel_customer"
                            type="tel"
                            class="form-control"
                            id="tel_customer"
                            placeholder=""
                        />
                    </div>
                    <h3 class="my-3">ข้อมูลที่อยู่</h3>
                    <div class="col-12">
                        <label for="description_address_customer"
                            >รายละเอียด</label
                        >
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
                        <input
                            v-model="province_address_customer"
                            type="text"
                            class="form-control"
                            id="province_address_customer"
                            placeholder=""
                        />
                        <!-- <select>
                        <option></option>
                    </select> -->
                    </div>
                    <div class="col-12 col-sm-12 col-md-6 col-lg-3 col-xl-3">
                        <label for="amphure_address_customer">อำเภอ</label>
                        <input
                            v-model="amphure_address_customer"
                            type="text"
                            class="form-control"
                            id="amphure_address_customer"
                            placeholder=""
                        />
                        <!-- <select>
                        <option></option>
                    </select> -->
                    </div>
                    <div class="col-12 col-sm-12 col-md-6 col-lg-3 col-xl-3">
                        <label for="tombon_address_customer">ตำบล</label>
                        <input
                            v-model="tombon_address_customer"
                            type="text"
                            class="form-control"
                            id="tombon_address_customer"
                            placeholder=""
                        />
                        <!-- <select>
                        <option></option>
                    </select> -->
                    </div>
                    <div class="col-12 col-sm-12 col-md-6 col-lg-3 col-xl-3">
                        <label for="zipcode_address_customer">รหัสไปรษณี</label>
                        <input
                            v-model="zipcode_address_customer"
                            type="text"
                            class="form-control"
                            id="zipcode_address_customer"
                            placeholder=""
                        />
                        <!-- <select>
                        <option></option>
                    </select> -->
                    </div>
                    <!-- <h4 class="my-3 text-center">ข้อมูลที่อยู่</h4> -->
                </div>
                <hr class="my-4" />
                <h4 class="text-center">ข้อมูลสินค้าที่ทำการสั่งซื้อ</h4>
                <div class="text-end pb-2">
                    <button
                        class="btn btn-primary"
                        type="button"
                        data-bs-toggle="modal"
                        data-bs-target="#itemListModal"
                    >
                        เลือกรายการสินค้า
                    </button>
                </div>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="row">รายการ</th>
                            <th scope="row">รายละเอียด</th>
                            <th scope="row">จำนวน</th>
                            <th class="text-center" scope="row" colspan="3">
                                จัดการ
                            </th>
                        </tr>
                    </thead>
                    <tbody v-if="isItemSelectedTableReady">
                        <tr
                            v-for="(item, index) in itemChecked"
                            v-bind:key="index"
                        >
                            <td>{{ item.title_item }}</td>
                            <td>{{ item.description_item }}</td>
                            <td>
                                <div class="col">
                                    <input
                                        v-model="itemChecked[index].number"
                                        type="number"
                                        class="form-control text-center"
                                        id="number"
                                    />
                                </div>
                            </td>
                            <!-- <td
                                class="text-center"
                                v-on:click="removeItemSelected(item.id_item)"
                            >
                                <i class="fas fa-trash-alt"></i>
                            </td> -->
                        </tr>
                    </tbody>
                </table>
            </div>
        </form>
        <div class="my-3 text-end">
            <button
                class="btn btn-primary mx-1 col-1"
                v-on:click="submitCreateOrder()"
            >
                ยืนยัน
            </button>
            <button
                class="btn btn-danger mx-1 col-1"
                v-on:click="this.$router.go(-1)"
            >
                ยกเลิก
            </button>
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
                            <tr
                                v-for="(item, index) in itemList"
                                v-bind:key="index"
                            >
                                <input
                                    type="checkbox"
                                    id="{{item.title_item}}"
                                    v-on:change="!item.isSelected"
                                    v-model="itemChecked"
                                    v-bind:value="{
                                        id_item: item.id_item,
                                        title_item: item.title_item,
                                        description_item: item.description_item,
                                    }"
                                />
                                <td>{{ item.title_item }}</td>
                                <td>{{ item.description_item }}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button
                        type="button"
                        class="btn btn-secondary"
                        data-bs-dismiss="modal"
                    >
                        ยกเลิก
                    </button>
                    <button
                        type="button"
                        class="btn btn-primary"
                        v-on:click="submitItemSelect()"
                        data-bs-dismiss="modal"
                    >
                        ยืนยัน
                    </button>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    data: function () {
        return {
            keyword_search_customer: "",
            itemList: [],
            customerList: [],
            customerSelected: "",
            itemChecked: [],
            title_stock: "",
            firstname_customer: "",
            lastname_customer: "",
            tel_customer: "",
            description_stock: "",
            total_stock: 0,
            number: 0,
            // address
            description_address_customer : "",
            province_address_customer : "",
            amphure_address_customer : "",
            tombon_address_customer : "",
            zipcode_address_customer : "",
            // data
            isItemSelectedTableReady: false,
            isReadyItemTable: false,
        };
    },
    methods: {
        submitItemSelect() {
            this.isItemSelectedTableReady = true;
            console.log(this.itemChecked);
        },
        selectCustomer() {
            console.log(this.customerSelected);
            this.firstname_customer = this.customerSelected.firstname_customer;
            this.lastname_customer = this.customerSelected.lastname_customer;
            this.tel_customer = this.customerSelected.tel_customer;
            this.description_address_customer = this.customerSelected.description_address_customer;
            this.province_address_customer = this.customerSelected.province_address_customer;
            this.amphure_address_customer = this.customerSelected.amphure_address_customer;
            this.tombon_address_customer = this.customerSelected.tombon_address_customer;
            this.zipcode_address_customer = this.customerSelected.zipcode_address_customer;
            console.log(
                this.firstname_customer +
                    this.lastname_customer +
                    this.tel_customer+ 
                    this.description_address_customer
            );
        },
        getAllCustomer() {
            axios.get("/api/customer/get-all-customer").then((response) => {
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
        getSearchCustomer(keyword_search_customer) {
            axios
                .get("/api/customer/search-customer/" + keyword_search_customer)
                .then((response) => {
                    if (response) {
                        this.customerList = response.data;
                        // this.isReadyCustomerT able = true;
                    }
                });
        },
        submitCreateOrder() {
            const orderObj = {};
            orderObj.id_customer = this.customerSelected.id_customer;
            orderObj.id_address = 1;
            orderObj.items = this.itemChecked;
            orderObj.create_by = "jimmie";
            console.log(orderObj);
            this.$swal({
                title: "แจ้งเตือน",
                text: "คุณต้องการสร้างสต็อกสินค้าใหม่ ใช่หรือไม่ ?",
                icon: "warning",
                showCancelButton: true,
                confirmButtonText: "ยืนยัน",
                cancelButtonText: "ยกกเลิก",
                reverseButtons: true,
            }).then((result) => {
                if (result.isConfirmed) {
                    axios
                        .post("/api/order/new-order", orderObj)
                        .then((response) => {
                            if (response) {
                                this.$router.go(-1);
                            }
                        });
                }
            });
        },
    },
    mounted() {
        this.getAllCustomer();
        this.getAllItem();
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
