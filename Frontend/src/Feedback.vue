<script setup>
import { postFeedback } from './api'
import router from './router'
import { ref } from 'vue'

const feedbackForm = ref();

const username = "sinead"
const fname = "Sinéad"
const lname = "Cleary"
const exam = "Physics"
const date = "26/07/2026"

const generalFeedback = [
  "Not covered in notes",
  "Question/answers unclear",
  "More than one correct answer",
  "No correct answer"
]

var number = ref();
var general = ref(generalFeedback[0]);
var specific = ref("");

function submitForm() {
  try {
    postFeedback( 1, number.value, general.value, specific.value);
    alert("Feedback submitted");

    // reset form
    number.value = null;
    general.value = generalFeedback[0];
    specific.value = "";
  } catch (error) {
    console.error(error)
    alert("Error submitting feedback");
  }
}

function logout() {
  router.push('/')
}

</script>

<template>
  <main>
    <div class="form-row">
      <span><label class="form-label">Username:</label> {{ username }} </span>
      <span><label class="form-label">Name:</label> {{ fname }} {{ lname }} </span>
      <span><label class="form-label">Exam:</label> {{ exam }} </span>
      <span>{{ date }} </span>
      <button @click="logout" id="logout">Log out</button>
    </div>

    <form ref="feedbackForm" @submit.prevent="submitForm">
      <div class="form-row">
        <span>
          <label class="form-label" for="question">Question number:</label>
          <input v-model="number" type="number" id="question" min="1" required>
        </span>
      </div>
       
      <div class="form-row">
      <label for="general" class="form-label">General feedback:</label>
        <span>
          <input v-model="general" type="radio" name="general" id="a" :value="generalFeedback[0]" checked>
          <label for="a">{{ generalFeedback[0] }}</label>
          
          <input v-model="general" type="radio" name="general" id="b" :value="generalFeedback[1]">
          <label for="b">{{generalFeedback[1]}}</label>
          
          <input v-model="general" type="radio" name="general" id="c" :value="generalFeedback[2]">
          <label for="c">{{generalFeedback[2]}}</label>

          <input v-model="general" type="radio" name="general" id="d" :value="generalFeedback[3]">
          <label for="d">{{generalFeedback[3]}}</label>

          <input v-model="general" type="radio" name="general" id="e" value="Other">
          <label for="e">Other</label>
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

  /* #logout {
    float: right;
  } */

</style>
