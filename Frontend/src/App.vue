<script setup>
import Login from './Login.vue'
import Feedback from './Feedback.vue'
</script>

<template>
  <header>
    <h1>Exam Question Feedback</h1>
  </header>

  <!-- <nav>
    <RouterLink to="/">Login</RouterLink>
    <RouterLink to="/feedback">Feedback</RouterLink>
  </nav> -->

  <main>
    <RouterView />
  </main>
</template>

<style scoped>

</style>
