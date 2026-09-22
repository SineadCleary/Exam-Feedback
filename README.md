# Exam Feedback
PWA for students to submit exam question feedback if they have a problem with one or more questions.

## Features
- Login with username and password
- System checks for student's most recent exam and displays student and exam details
- Student presented with feedback form containing question number field, general feedbac radio buttons, and specific feedback text area
- Submitting feedback saves it to the database

## Technologies used
- Vue.js
- axios
- PWA
- MySQL Workbench
- Postman

## Installation instructions
1. Clone the repository.
2. Add a `.env` file with the following:
```
PORT=8080
DB_CONNECTION_LIMIT=10
DB_HOST='localhost'
DB_USER=<your MySQL username>
DB_PASSWORD=<your MySQL password>
DB_NAME='feedback'
```
3. Run `node server.js` to start the API.
4. Navigate to `\Frontend` and run `npm run dev` to start the web app.
