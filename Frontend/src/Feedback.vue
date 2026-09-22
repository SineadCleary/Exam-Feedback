<script setup>
import { postFeedback, getStudentExam } from './api'
import router from './router'
import { ref } from 'vue'

// var student_exam = await getStudentExam(sessionStorage.getItem("userId"));
// console.log(sessionStorage.getItem("userId"));
// console.log(student_exam);

// var username = student_exam.username;
// var fname = student_exam.firstname;
// var lname = student_exam.lastname;
// var exam = student_exam.exam_name;
// var date = student_exam.date;

const username = ref(""); 
const fname = ref(""); 
const lname = ref(""); 
const exam = ref(""); 
const date = ref(""); 
const examId = ref("");

const loadStudentExam = async () => { 
  try { 
    const userId = sessionStorage.getItem("userId"); 
    const student_exam = await getStudentExam(userId); 

    username.value = student_exam.username; 
    fname.value = student_exam.firstname; 
    lname.value = student_exam.lastname; 
    exam.value = student_exam.exam_name; 
    date.value = student_exam.date; 
    examId.value = student_exam.exam_id;
  } catch (error) { 
    console.error(error); 
  } 
}; 
loadStudentExam();

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
    postFeedback( examId.value, number.value, general.value, specific.value);
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
  router.push('/');
  sessionStorage.clear();
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

    <form @submit.prevent="submitForm">
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
