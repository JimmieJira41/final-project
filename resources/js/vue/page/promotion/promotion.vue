<template>
  <div class="container px-3">
    <div>
      <h1 class="text-center">จัดการโปรโมชั่น</h1>
    </div>
    <div class="text-end pb-2">
      <button class="btn btn-primary" type="button">
        <router-link to="/promotion/create-promotion">สร้างโปรโมชั่น</router-link>
      </button>
    </div>
    <TablePromotionList></TablePromotionList>
  </div>
</template>
<script>
import TablePromotionList from "./component/table-promotion-list.vue";
export default {
  components: {
    TablePromotionList: TablePromotionList,
  },
  data: function () {
    return {
      side_bar: true,
    };
  },
};
</script>
