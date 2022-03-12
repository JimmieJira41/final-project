<template>
    <div class="container card borderless shadow p-3">
        <form class="form-group">
            <h3>ข้อมูลสต็อกสินค้า</h3>
            <div class="row p-3">
                <div class="col">
                    <label for="title_stock">ชื่อสต็อกสินค้า</label>
                    <input
                        v-model="title_stock"
                        type="text"
                        class="form-control text-center"
                        id="title_stock"
                        placeholder=""
                    />
                </div>
                <div class="col">
                    <label for="description_stock">รายละเอียด</label>
                    <input
                        v-model="description_stock"
                        type="text"
                        class="form-control text-center"
                        id="description_stock"
                        placeholder=""
                    />
                </div>
                <div class="col">
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
        <div class="my-3 text-end">
            <button
                class="btn btn-primary mx-1 col-1"
                v-on:click="submitCreateStock()"
            >
                ยืนยัน
            </button>
            <button class="btn btn-danger mx-1 col-1"><router-link to="/stock">ยกเลิก</router-link></button>
        </div>
    </div>
</template>
<script>
export default {
    data: function () {
        return {
            title_stock: "",
            description_stock: "",
            total_stock: 0,
        };
    },
    methods: {
        submitCreateStock() {
            const stockObj = {};
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
            }).then((result) => {
                if (result.isConfirmed) {
                    axios
                        .post("/api/stock/new-stock", stockObj)
                        .then((response) => {
                            if (response) {
                                this.$router.go(-1);
                            }
                        });
                }
            });
        },
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
