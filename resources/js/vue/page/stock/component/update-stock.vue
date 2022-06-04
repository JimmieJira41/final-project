<template>
    <div class="container card borderless shadow p-3">
        <form class="form-group">
             <h3>อัพเดรตรายการสต็อกสินค้า</h3>
            <div class="row p-3">
                <div class="col-12 col-sm-12 col-md-6 col-lg-3 col-xl-3">
                    <label for="title_stock">ชื่อสต็อกสินค้า</label>
                    <input
                        v-model="title_stock"
                        type="text"
                        class="form-control text-center"
                        id="title_stock"
                        placeholder=""
                    />
                </div>
                <div class="col-12 col-sm-12 col-md-6 col-lg-3 col-xl-3">
                    <label for="description_stock">รายละเอียด</label>
                    <input
                        v-model="description_stock"
                        type="text"
                        class="form-control text-center"
                        id="description_stock"
                        placeholder=""
                    />
                </div>
                <div class="col-12 col-sm-12 col-md-6 col-lg-3 col-xl-3">
                    <label for="total_stock">จำนวนคงเหลือ</label>
                    <input
                        v-model="total_stock"
                        type="number"
                        class="form-control text-center"
                        id="total_stock"
                        placeholder=""
                    />
                </div>
            </div>
        </form>
        <div class="row"> 
        <div class="col-lg-12 col-md-12 col-sm-12 col-12 my-3 text-end">
            <button
                class="btn btn-primary mx-1"
                v-on:click="submitUpdateStock()"
            >
                ยืนยัน
            </button>
            <button class="btn btn-danger mx-1">
                <router-link to="/stock">ยกเลิก</router-link>
            </button>
        </div>
        </div>
    </div>
</template>
<script>
export default {
    data: function () {
        return {
            id_stock: "",
            title_stock: "",
            description_stock: "",
            total_stock: 0,
            headers: {
                headers: {
                "Content-Type": "application/json",
                "Authorization": "Bearer " + this.$cookies.get("token"),
                },
            },
        };
    },
    methods: {
        getStockById(stockId) {
            axios.get("/api/stock/get-stock/" + stockId, this.headers).then((response) => {
                if (response) {
                    this.title_stock = response.data[0].title_stock;
                    this.description_stock = response.data[0].description_stock;
                    this.total_stock = response.data[0].total_stock;
                }
            });
        },
        submitUpdateStock() {
            const stockObj = {};
            stockObj.id_stock = this.id_stock;
            stockObj.title_stock = this.title_stock;
            stockObj.description_stock = this.description_stock;
            stockObj.total_stock = this.total_stock;
            console.log(stockObj);
            this.$swal({
                title: "แจ้งเตือน",
                text: "คุณต้องการสร้างสต็อกสินค้าใหม่ ใช่หรือไม่ ?",
                icon: "warning",
                showCancelButton: true,
                confirmButtonText: "ยืนยัน",
                cancelButtonText: "ยกกเลิก",
                reverseButtons: true,
            }, this.headers).then((result) => {
                if (result.isConfirmed) {
                    axios
                        .put("/api/stock/update-stock", stockObj, this.headers)
                        .then((response) => {
                            if (response) {
                                this.$swal({
                                    title: "อัพเดรตสำเร็จ",
                                    icon: "success",
                                    confirmButtonText: "ยืนยัน",
                                }).then((result) =>{
                                    this.$router.go(-1);
                                });
                            }
                        });
                }
            });
        },
    },
    mounted() {
        this.id_stock = this.$route.params.id;
        this.getStockById(this.id_stock);
    },
};
</script>
<style scoped>

</style>
