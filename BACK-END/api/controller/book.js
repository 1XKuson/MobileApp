const express = require("express");
const db = require("../dbconnection");

exports.book_get_id = (req, res) => {
    const query = 'SELECT * FROM book WHERE ProfessorID = ?'
    const value = [req.body.ProfessorID];

    db.query(query, value, (err, results, fields) => {
        if (err) {
            res.status(500).json({ error: err });
        } else if (results.length > 0) {
            res.status(200).json({
                results: results
            })
        } else {
            res.status(404).json({
                message: "No results found",
                response: results
            });
        }
    })
};

exports.book_get_eachbook = (req, res) => {
    const query = 'SELECT * FROM book WHERE ProfessorID = ? AND BookID = ?'
    const value = [req.body.ProfessorID, req.body.BookID];

    db.query(query, value, (err, results, fields) => {
        if (err) {
            res.status(500).json({ error: err });
        } else if (results.length > 0) {
            res.status(200).json({
                results: results
            })
        } else {
            res.status(404).json({
                message: "No results found",
                response: results
            });
        }
    })
};

exports.book_post = (req, res) => {
    const query = `INSERT INTO Book 
   (Title, PublishedDate, Description, Publisher, ProfessorID, ISBN, Author)
   VALUES 
   (?, ?, ?, ?, ?, ?, ?);`

    const value = [
        req.body.Title,
        req.body.PublishedDate,
        req.body.Description,
        req.body.Publisher,
        req.body.ProfessorID,
        req.body.ISBN,
        req.body.Author
    ]
    db.query(query, value, (err, results, fields) => {
        if (err) {
            res.status(500).json({ error: err });
        } else if (results.affectedRows > 0) {
            res.status(200).json({
                message : "Book inert successfully",
                results: results
            })
        } else {
            res.status(404).json({
                message: "No results found",
                response: results
            });
        }
    })
};

exports.book_put = (req, res) => {
    const query = `UPDATE Book 
    SET 
        Title = ?, 
        PublishedDate = ?, 
        Description = ?, 
        Publisher = ?, 
        ISBN = ?, 
        Author = ?
    WHERE ProfessorID = ? AND BookID = ? `

    const value = [
        req.body.Title,
        req.body.PublishedDate,
        req.body.Description,
        req.body.Publisher,
        req.body.ISBN,
        req.body.Author,
        req.body.ProfessorID,
        req.body.BookID
    ]
    db.query(query, value, (err, results, fields) => {
        if (err) {
            res.status(500).json({ error: err });
        } else if (results.affectedRows > 0) {
            res.status(200).json({
                message : "Book inert successfully",
                results: results
            })
        } else {
            res.status(404).json({
                message: "No results found",
                response: results
            });
        }
    })
};

exports.book_delete = (req, res) => {
    const query = 'DELETE FROM book WHERE ProfessorID = ? AND BookID = ?'
    const value = [req.body.ProfessorID, req.body.BookID];

    db.query(query, value, (err, results, fields) => {
        if (err) {
            res.status(500).json({ error: err });
        } else if (results.affectedRows > 0) {
            res.status(200).json({
                message:"DELETE FROM book successfully",
                results: results
            })
        } else {
            res.status(404).json({
                message: "No results found",
                response: results
            });
        }
    })
};

exports.book_get_byid = (req, res) => {
    const query = 'SELECT * FROM book WHERE ProfessorID = ?'
    const value = [req.params.ProfessorID];

    db.query(query, value, (err, results, fields) => {
        if (err) {
            res.status(500).json({ error: err });
        } else if (results.length > 0) {
            res.status(200).json({
                results: results
            })
        } else {
            res.status(404).json({
                message: "No results found",
                response: results
            });
        }
    })
};

exports.book_get_eachbook_byid = (req, res) => {
    const query = 'SELECT * FROM book WHERE ProfessorID = ? AND BookID = ?'
    const value = [req.params.ProfessorID, req.params.BookID];

    db.query(query, value, (err, results, fields) => {
        if (err) {
            res.status(500).json({ error: err });
        } else if (results.length > 0) {
            res.status(200).json({
                results: results
            })
        } else {
            res.status(404).json({
                message: "No results found",
                response: results
            });
        }
    })
};