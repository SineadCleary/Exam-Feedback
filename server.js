require('dotenv').config();
const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');

const app = express();
const port = process.env.PORT;

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cors());

const db = mysql.createPool({
    connectionLimit: Number(process.env.DB_CONNECTION_LIMIT),
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME
})

// Routes
// Get all students
app.get('/students', (req, res) => {
    db.query('SELECT * FROM student', (err, rows) => {
        if (err) res.status(500).json({error: 'database error'});
        res.json(rows);
    });
});

// Get student by id
app.get('/students/:id', (req, res) => {
    const userId = req.params.id;
    db.query('SELECT * FROM student WHERE id = ?', userId, (err, rows) => {
        if (err) res.status(500).json({error: 'database error'});
        else if (rows.length===0) res.status(404).json({error: 'student not found'});
        res.json(rows[0]);
    });
});

// Post student
app.post('/student', (req, res) => {
    const { username, password, firstname, lastname } = req.body;
    db.query('INSERT INTO student (username, password, firstname, lastname) VALUES (?, ?, ?, ?)', 
    [username, password, firstname, lastname],
    (err, result) => {
        if (err) res.status(500).json({error: 'database error'});
        else res.status(201).json({success: true, msg: 'Student added successfully'});
    });
});

// Post feedback
app.post('/feedback', (req, res) => {
    const { exam_id, q_number, general_feedback, specific_feedback } = req.body;
    db.query('INSERT INTO feedback (exam_id, q_number, general_feedback, specific_feedback) VALUES (?, ?, ?, ?)', 
    [exam_id, q_number, general_feedback, specific_feedback],
    (err, result) => {
        if (err) res.status(500).json({error: 'database error'});
        else res.status(201).json({success: true, msg: 'Feedback added successfully'});
    });
});

// Get all feedback
app.get('/feedback', (req, res) => {
    db.query("SELECT f.id, f.exam_id, f.q_number, f.general_feedback, f.specific_feedback, DATE_FORMAT(e.exam_date, '%d-%m-%Y') AS 'date', e.name AS 'exam_name' FROM feedback f JOIN exam e ON f.exam_id = e.id;", 
    (err, rows) => {
        if (err) res.status(500).json({error: 'database error'});
        res.json(rows);
    });
});

// Get student's exam
app.get('/exam/:id', (req, res) => {
    const studentId = req.params.id;
    db.query("SELECT e.id AS 'exam_id', DATE_FORMAT(e.exam_date, '%d-%m-%Y') AS 'date', e.name AS 'exam_name', s.id AS 'stud_id', s.username,s.firstname, s.lastname FROM exam e JOIN exam_student j ON e.id = j.exam_id JOIN student s ON s.id = j.student_id WHERE s.id = ?;", 
    studentId, 
    (err, rows) => {
        if (err) res.status(500).json({error: 'database error'});
        else res.json(rows[0]);
    });
});

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
})