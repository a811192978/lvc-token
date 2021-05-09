import Vue from 'vue'
import Router from 'vue-router'

import Home from '@/pages/home/home';
// import Poi from '@/pages/home/poi';
// import Transfer from '@/pages/home/transfer';

Vue.use(Router);


export default new Router({
  routes: [{
    path: '/',
    redirect: '/home'
  },
  {
    path: '/home',
    name: 'home',
    component: Home
  },
  ]
})