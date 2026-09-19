<script setup>
import { getStudentExam } from './api';


</script>

<template>
  <header>
    <h1>Exam Question Feedback - Login</h1>
  </header>

  <main>
    <form>
      <div class="form-row">
        <label for="username">Username</label>
        <input id="username" required>
      </div>
        
      <div class="form-row">
        <label for="password">Password</label>
        <input type="password" id="password">
      </div>

      <div class="form-row">
        <button type="submit" @click="getStudentExam(1)">Login</button>
      </div>

    </form>
  </main>
</template>

<style scoped>
  div.form-row {
    display: table-row;
  }

  label, input {
    display: table-cell;
    margin-bottom: 0.5em;
  }

  label {
    padding-right: 1em;
  }

  header {
    margin-bottom: 1em;
  }

</style>
