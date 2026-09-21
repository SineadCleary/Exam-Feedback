import './assets/main.css'
import router from './router.js'
import { createApp } from 'vue'
import App from './App.vue'
import Login from './Login.vue'
import Feedback from './Feedback.vue'

createApp(App).use(router).mount('#app')
