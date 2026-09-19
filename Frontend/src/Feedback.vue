<script setup>
import { postFeedback } from './api'

const username = "sinead"
const fname = "Sinéad"
const lname = "Cleary"
const exam = "Physics"
const date = "26/07/2026"

var number;
var general;
var specific;

</script>

<template>
  <header>
    <h1>Exam Question Feedback</h1>
  </header>

  <main>
    <div class="form-row">
      <span><label class="form-label">Username:</label> {{ username }} </span>
      <span><label class="form-label">Name:</label> {{ fname }} {{ lname }} </span>
      <span><label class="form-label">Exam:</label> {{ exam }} </span>
      <span>{{ date }} </span>
    </div>

    <form @submit="postFeedback( 1, number, general, specific)">
      <div class="form-row">
        <span>
          <label class="form-label" for="question">Question number:</label>
          <input v-model="number" type="number" id="question" min="1" required>
        </span>
      </div>
       
      <div class="form-row">
      <label for="general" class="form-label">General feedback:</label>
        <span>
          <input v-model="general" type="radio" name="general" id="a" value="Not covered in notes" checked>
          <label for="a">Not covered in notes</label>
          
          <input v-model="general" type="radio" name="general" id="b" value="Question/answers unclear">
          <label for="b">Question/answers unclear</label>
          
          <input v-model="general" type="radio" name="general" id="c" value="More than one correct answer">
          <label for="c">More than one correct answer</label>

          <input v-model="general" type="radio" name="general" id="d" value="No correct answer">
          <label for="d">No correct answer</label>

          <input v-model="general" type="radio" name="general" id="e" value="Other">
          <label for="d">Other</label>
        </span>
      </div>

      <div class="form-row">
        <label class="form-label">Specific feedback:</label>
        <textarea v-model="specific" placeholder="Specific feedback" rows="10" cols="100"></textarea>
      </div>

      <div class="form-row">
        <button type="submit">Submit</button>
      </div>

    </form>
  </main>
</template>

<style scoped>
  span {
    padding-right: 3em;
  }

  .form-row {
    margin-bottom: 0.75em;
  }

  label, input {
    display: table-cell;
  }

  label {
    padding-right: 1em;
  }

  header {
    margin-bottom: 1em;
  }

  .form-label {
    font-weight: bold;
  }

  #question {
    width:3em
  }

</style>
