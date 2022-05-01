<template>
  <div class="container-fluid px-0">
    <div class="row">
      <div class="col-12 col-sm-12 col-md-12 col-lg-2 col-xl-2 bg-white shadow">
        <Menu></Menu>
      </div>
      <div class="col-12 col-sm-12 col-md-12 col-lg-10 col-xl-10 content pt-5">
        <router-view />
      </div>
    </div>
  </div>
  <!-- <div v-else class="container h-100 d-flex justify-content-center">
       <div class="col-12 col-sm-12 col-md-12 col-lg-10 col-xl-10 content pt-5">
            <router-view />
        </div>
    </div> -->
</template>
<style lang="scss">
@import url("https://fonts.googleapis.com/css2?family=Prompt&display=swap");
#app {
  font-family: "Prompt", sans-serif;
}
html,
body {
  min-height: 100vh;
  width: 100%;
  margin: 0;
}
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
<script>
import Menu from "./share/menu/menu.vue";
export default {
  components: {
    Menu,
  },
};
</script>