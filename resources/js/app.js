require('./bootstrap');
import { createApp } from 'vue'
import { createWebHistory, createRouter } from "vue-router";
import { library } from "@fortawesome/fontawesome-svg-core";
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";
import { fas } from '@fortawesome/free-solid-svg-icons'
library.add(fas);
import { fab } from '@fortawesome/free-brands-svg-icons';
library.add(fab);
import { far } from '@fortawesome/free-regular-svg-icons';
library.add(far);
import { dom } from "@fortawesome/fontawesome-svg-core";
dom.watch();
import VCalendar from 'v-calendar';
import VueSweetalert2 from 'vue-sweetalert2';
import VueNextSelect from 'vue-next-select'
import 'sweetalert2/dist/sweetalert2.min.css';
import App from './vue/app.vue'
import Login from './vue/page/register/login.vue'
import Home from './vue/home.vue'
import Admin from './vue/page/admin/admin.vue'
import CreateAdmin from './vue/page/admin/component/create-admin.vue'
import UpdateAdmin from './vue/page/admin/component/update-admin.vue'
import Customer from './vue/page/customer/customer.vue'
import CreateCustomer from './vue/page/customer/component/create-customer.vue'
import UpdateCustomer from './vue/page/customer/component/update-customer.vue'
import ViewCustomer from './vue/page/customer/component/view-customer.vue'
import Order from './vue/page/order/order.vue'
import CreateOrder from './vue/page/order/component/create-order.vue'
import UpdateOrder from './vue/page/order/component/update-order.vue'
import Item from './vue/page/item/item.vue'
import CreateItem from './vue/page/item/component/create-item.vue'
import UpdateItem from './vue/page/item/component/update-item.vue'
import Stock from './vue/page/stock/stock.vue'
import CreateStock from './vue/page/stock/component/create-stock.vue'
import UpdateStock from './vue/page/stock/component/update-stock.vue'
import Promotion from './vue/page/promotion/promotion.vue';
import CreatePromotion from './vue/page/promotion/component/create-promotion.vue';
import UpdatePromotion from './vue/page/promotion/component/update-promotion.vue';
import Analysis from './vue/page/analysis/analysis.vue'

const options = {
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
}

const routes = [
    {
        path: '/',
        name: 'Login',
        component: Login
    },
    {
        path: '/home',
        name: 'Home',
        component: Home
    },
    {
        path: '/admin',
        name: 'Admin',
        component: Admin
    },
    {
        path: '/admin/craete-admin',
        name: 'CreateAdmin',
        component: CreateAdmin
    },
    {
        path: '/admin/update-admin/:id',
        name: 'UpdateAdmin',
        component: UpdateAdmin
    },
    {
        path: '/customer',
        name: 'Customer',
        component: Customer
    },
    {
        path: '/customer/craete-customer',
        name: 'CreateCustomer',
        component: CreateCustomer
    },
    {
        path: '/customer/update-customer/:id',
        name: 'UpdateCustomer',
        component: UpdateCustomer
    },
    {
        path: '/customer/view-customer/:id',
        name: 'ViewCustomer',
        component: ViewCustomer
    },
    {
        path: '/order',
        name: 'Order',
        component: Order
    },
    {
        path: '/order/create-order',
        name: 'CreateOrder',
        component: CreateOrder
    },
    {
        path: '/order/update-order/:id_order',
        name: 'UpdateOrder',
        component: UpdateOrder
    },
    {
        path: '/item',
        name: 'Item',
        component: Item
    },
    {
        path: '/item/create-item',
        name: 'CreateItem',
        component: CreateItem
    },
    {
        path: '/item/update-item/:id',
        name: 'UpdateItem',
        component: UpdateItem
    },
    {
        path: '/stock',
        name: 'Stock',
        component: Stock
    },
    {
        path: '/stock/craete-stock',
        name: 'CreateStcok',
        component: CreateStock
    },
    {
        path: '/stock/update-stock/:id',
        name: 'UpdateStcok',
        component: UpdateStock
    },
    {
        path: '/promotion',
        name: 'Promotion',
        component: Promotion
    },
    {
        path: '/promotion/create-promotion',
        name: 'CreatePromotion',
        component: CreatePromotion
    },
    {
        path: '/promotion/update-promotion/:id',
        name: 'UpdatePromotion',
        component: UpdatePromotion
    },
    {
        path: '/analysis',
        name: 'Analysis',
        component: Analysis
    }
]

const router = createRouter({
    history: createWebHistory(),
    routes : routes
});

const app = createApp(App);
app.component("font-awesome-icon",FontAwesomeIcon);
app.component('vue-select', VueNextSelect);
app.use(VCalendar, {})
app.use(VueSweetalert2, options);
app.use(router).mount('#app');