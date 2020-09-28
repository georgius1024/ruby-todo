import Vue from 'vue'
import Todos from '../Todos.vue'
document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#app',
    render: h => h(Todos)
  })
})
