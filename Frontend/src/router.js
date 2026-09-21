import { createMemoryHistory, createRouter } from "vue-router";
import Feedback from "./Feedback.vue";
import Login from "./Login.vue";

const routes = [
    { path: '/', component: Login },
    { path: '/feedback', component: Feedback }
]

export const router = createRouter({
    history: createMemoryHistory(),
    routes,
})

export default router