<template>
  <div class="container-fluid" style="height: 100vh">
    <div class="row min-vh-100 flex-column flex-md-row">
      <Menu/>
      <div class="col px-0 flex-grow-1 py-4">
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