<script setup>
import { getStudentExam, login } from './api';

var username;
var password;
</script>

<template>
  <header>
    <h1>Exam Question Feedback - Login</h1>
  </header>

  <main>
    <form @submit="login(username, password)">
      <div class="form-row">
        <label for="username">Username</label>
        <input v-model="username" id="username" required>
      </div>
        
      <div class="form-row">
        <label for="password">Password</label>
        <input v-model="password" type="password" id="password">
      </div>

      <div class="form-row">
        <button type="submit">Login</button>
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
