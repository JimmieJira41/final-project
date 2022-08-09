<template>
  <div class="container-fluid min-vh-100">
    <div class="row flex-column flex-md-row">
      <!-- <div class="col-12"> -->
        <Menu v-if="this.$cookies.get('token')" />
      <!-- </div> -->
      <div class="col min-vh-100 px-0 flex-grow-1 py-4">
        <div class="contianer-fluid">
          <router-view />
        </div>
      </div>
    </div>
  </div>
</template>
<style lang="scss">
@import url("https://fonts.googleapis.com/css2?family=Prompt&display=swap");
#app {
  font-family: "Prompt", sans-serif;
}
html,
body {
  min-height: 100vh !important;
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
.tbody-scroll {
  height: 350px;
  overflow: auto;
}
.tbody-scroll thead th {
  position: sticky;
  top: 0;
  /* height: 2px; */
  z-index: 1;
}
/* Just common table stuff. Really. */
table {
  /* border-collapse: collapse; */
  width: 100%;
}
th,
td {
  padding: 8px 16px;
}
th {
  
  background: #fff;
}
i {
  width: 42px;
  height: 42px;
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