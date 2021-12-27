require('./bootstrap');

import Vue from 'vue'
import Home from './vue/home.vue'

const app = new Vue({
    el: '#app',
    components: {
        'Home' : Home
    }
})
