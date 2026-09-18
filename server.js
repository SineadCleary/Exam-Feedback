require('dotenv').config();
const express = require('express');
const mysql = require('mysql2');

const app = express();
const port = process.env.PORT;

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

const conn = mysql.createPool({
    connectionLimit: Number(process.env.DB_CONNECTION_LIMIT),
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME
})

// Routes
// Get all students
app.get('/students', (req, res) => {
    conn.query('SELECT * FROM student', (err, rows) => {
        if (err) res.status(500).json({error: 'database error'});
        res.json(rows);
    });
});

// Get student by id
app.get('/students/:id', (req, res) => {
    const userId = req.params.id;
    conn.query('SELECT * FROM student WHERE id = ?', userId, (err, rows) => {
        if (err) res.status(500).json({error: 'database error'});
        else if (rows.length===0) res.status(404).json({error: 'student not found'});
        res.json(rows[0]);
    });
});

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
})