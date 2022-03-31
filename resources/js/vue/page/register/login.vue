<template>
  <div class="container-fiuld">
    <div>
      <h1 class="text-center">Login</h1>
    </div>

    <div class="row py-2">
      <form
        class="
          col-xl-5 col-lg-6 col-md-8 col-sm-10
          mx-auto
          text-center
          form
          p-4
        "
      >
        <div class="card">
          <div class="card-body">
            <div class="text-center">
              <label>Username</label>
              <input type="text" class="form-control" />
            </div>
            <div class="text-center">
              <label>Password</label>
              <input type="password" class="form-control col-6" />
            </div>
          </div>
        </div>
      </form>

      <div class="col-12 text-center">
        <button class="btn btn-primary" type="button">เข้าสู่ระบบ</button>
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
      username_user: "",
      password_user: "",
      side_bar: false,
    };
  },
};
</script>