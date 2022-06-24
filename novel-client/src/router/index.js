import Vue from 'vue'
import Router from 'vue-router'
import index from '@/pages/index'
import novelDetail from '@/components/novelDetail'
import inputnovel from '@/components/inputnovel'
import login from '@/pages/login'
import history from '@/pages/history'
import register from '@/pages/register'
Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'index',
      component: index
    },
    {
      path: '/novelDetail',
      name: 'novelDetail',
      component: novelDetail
    }
    ,
    {
      path: '/inputnovel',
      name: 'inputnovel',
      component: inputnovel
    },
    {
      path:'/login',
      name:'login',
      component:login
    },
    {
      path:'/history',
      name:'hitory',
      component:history
    },{
      path:'/register',
      name:'register',
      component:register
    }
  ]
})
