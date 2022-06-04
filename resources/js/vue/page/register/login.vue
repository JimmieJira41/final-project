<template>
  <div class="container-fiuld">
    <div>
      <h1 class="text-center">Login</h1>
    </div>

    <div class="row">
      <form
        class="
          col-xl-5 col-lg-6 col-md-8 col-sm-10
          mx-auto
          form-group
          p-4
        "
      >
        <div class="card">
          <div class="card-body">
            <div class="col-12 text-center">
              <label>Username / Email</label>
              <input type="text" v-model="email" class="form-control" />
            </div>
            <div class="col-12 text-center">
              <label>Password</label>
              <input
                type="password"
                v-model="password"
                class="form-control"
              />
            </div>
          </div>
        </div>
      </form>

      <div class="col-12 text-center">
        <button class="btn btn-primary" type="button" v-on:click="login()">
          เข้าสู่ระบบ
        </button>
        <button class="btn btn-warning" type="button">
          <router-link to="/order/create-order">สมัครสมาชิก</router-link>
        </button>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data: function () {
    return {
      email: "",
      password: "",
      side_bar: true,
    };
  },
  methods: {
    login() {
      const data = {
        "email" : this.email,
        "password" : this.password
      }
      const headers = {
        "Content-Type": "application/json"
      };
      axios.post("/api/admin/login", data, headers).then(response =>{
        if(response){
          this.$cookies.set("token",response.data.access_token);
          this.$cookies.set("username", response.data.user.email);
          this.$router.go("/home");
        }
        // console.log(this.$cookies.get("token"));
      });
    },
  },
};
</script>