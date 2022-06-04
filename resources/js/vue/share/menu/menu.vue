<template lang="pug">
    <aside class="col-12 col-md-3 col-xl-2 p-0 bg-dark flex-shrink-1">
        <nav class="
            navbar navbar-expand-md navbar-dark
            bd-dark
            flex-md-column flex-row
            align-items-center
            py-2
            text-center
            sticky-top
          " id="sidebar">
            <div class="text-center p-3">
                <a href="#" class="navbar-brand mx-0 font-weight-bold text-nowrap">Suansom Kangwan</a>
            </div>
            <button type="button" class="navbar-toggler border-0 order-1" data-bs-toggle="collapse"
                data-bs-target="#nav" aria-controls="nav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse order-last" id="nav">
                <ul class="navbar-nav flex-column w-100 justify-content-center">
                    <li>
                        <a href="javascript:;" class="nav-link align-middle px-0">
                            <i class="fas fa-home fs-3"></i> <span class="ms-1 d-none d-sm-inline">
                                <router-link to="/">แดชบอร์ด</router-link>
                            </span>
                        </a>
                    </li>
                    <li class="mt-3">
                        <a href="javascript:;" class="nav-link px-0 align-middle">
                            <i class="fas fa-shopping-basket fs-3"></i> <span class="ms-1 d-none d-sm-inline">
                                <router-link to="/order">จัดการข้อมูลการสั่งซื้อ</router-link>
                            </span> </a>
                    </li>
                    <li class="mt-3"> 
                        <a href="javascript:;" class="nav-link px-0 align-middle">
                            <i class="fas fa-store fs-3"></i> <span class="ms-1 d-none d-sm-inline">
                                <router-link to="/stock">จัดการข้อมูลสต็อก</router-link>
                            </span></a>
                    </li>
                    <li class="mt-3">
                        <a href="javascript:;" class="nav-link px-0 align-middle ">
                            <i class="fas fa-carrot fs-3"></i> <span class="ms-1 d-none d-sm-inline">
                                <router-link to="/item">จัดการข้อมูลสินค้า</router-link>
                            </span></a>

                    </li>
                    <li class="mt-3">
                        <a href="javascript:;" class="nav-link px-0 align-middle">
                            <i class="fas fa-tag fs-3"></i> <span class="ms-1 d-none d-sm-inline">
                                <router-link to="/promotion">จัดการโปรโมชั่น</router-link>
                            </span> </a>
                    </li>
                    <li class="mt-3">
                        <a href="javascript:;" class="nav-link px-0 align-middle">
                            <i class="fas fa-address-card fs-3"></i> <span class="ms-1 d-none d-sm-inline">
                                <router-link to="/customer">จัดการข้อมูลลูกค้า</router-link>
                            </span> </a>
                    </li>
                    <li class="mt-3">
                        <a href="javascript:;" class="nav-link px-0 align-middle">
                            <i class="fas fa-users-cog fs-3"></i> <span class="ms-1 d-none d-sm-inline">
                                <router-link to="/admin">จัดการข้อมูลพนักงาน</router-link>
                            </span> </a>
                    </li>
                    <li class="mt-3">
                        <a href="javascript:;" class="nav-link px-0 align-middle">
                            <i class="fas fa-chart-bar fs-3"></i> <span class="ms-1 d-none d-sm-inline">
                                <router-link to="/analysis">วิเคราะห์และสรุปผล</router-link>
                            </span> </a>
                    </li>
                     <li class="mt-3">
                        <a href="javascript:;" class="btn btn-danger nav-link px-0 align-middle" v-on:click="logout()">
                            <span class="ms-1 d-none d-sm-inline">logout</span>
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
    </aside>
</template>
<script>
export default {
  data: function () {
    return {
      side_bar: true,
      headers: {
        headers: {
          "Content-Type": "application/json",
          Authorization: "Bearer " + this.$cookies.get("token"),
        },
      },
    };
  },
  methods: {
    logout() {
      axios.get("/api/admin/logout", this.headers).then((response) => {
        if (response) {
          //   this.$cookies.remove("username");
          this.$cookies.remove("token");
          this.$router.go("");
        }
      });
    },
  },
};
</script>
