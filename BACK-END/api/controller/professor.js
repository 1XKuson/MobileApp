const express = require("express");
const db = require("../dbconnection");
const { v4: uuidv4 } = require("uuid");

exports.prof_get_all = (req, res, next) => {
    const query = "SELECT * FROM professor"

    db.query(query, (err, results, fields) => {

        if (err) {
            res.status(500).json({ error: err });
        } else if (results.length > 0) {
            res.status(200).json({
                results: results
            })
        } else {
            res.status(404).json({ message: "No results found" });
        }
    })
};


exports.prof_get_id = (req, res, next) => {
    const ProfessorID = req.params.ProfessorID
    const query = "SELECT * FROM Professor WHERE ProfessorID = ?"


    db.query(query, ProfessorID, (err, results, fields) => {
        if (err) {
            res.status(500).json({ error: err });
        } else if (results.length > 0) {
            res.status(200).json({
                results: results
            })
        } else {
            res.status(404).json({ message: "No results found" });
        }
    })
};


exports.prof_post = (req, res, next) => {

    const query = `INSERT INTO Professor (ProfessorID, FirstNameTH, LastNameTH, 
    DateOfBirth, Gender, Email, Phone, OfficeLocation, imageID, LastNameEng, FirstNameEng)
    VALUES (?,?,?,?,?,?,?,?,?,?,?)`;

    const value = [
        req.body.ProfessorID,
        req.body.FirstNameTH,
        req.body.LastNameTH,
        req.body.DateOfBirth,
        req.body.Gender,
        req.body.Email,
        req.body.Phone,
        req.body.OfficeLocation,
        req.body.imageID,
        req.body.LastNameEng,
        req.body.FirstNameEng
    ]

    db.query(query, value, (err, results, fields) => {
        if (err) {
            res.status(500).json({ error: err });
        } else if (results) {
            res.status(200).json({
                message: "INSERT INTO Professor successfully",
                response: results
            })
        } else {
            res.status(404).json({ message: "No results found" });
        }
    })

};


exports.prof_put = (req, res, next) => {
    req.body.DateOfBirth= convertDate(req.body.DateOfBirth);
    console.log(req.body);
    const query = `
    UPDATE professor
        SET 
        FirstNameTH = ?, 
        LastNameTH = ?, 
        DateOfBirth = ?, 
        Gender = ?, 
        Email = ?, 
        Phone = ?, 
        OfficeLocation = ?, 
        imageID = ?, 
        LastNameEng = ?, 
        FirstNameEng = ?
    WHERE ProfessorID = ?`;
    const value = [
        req.body.FirstNameTH,
        req.body.LastNameTH,
        req.body.DateOfBirth,
        req.body.Gender,
        req.body.Email,
        req.body.Phone,
        req.body.OfficeLocation,
        req.body.imageID,
        req.body.LastNameEng,
        req.body.FirstNameEng,
        req.body.ProfessorID
    ];
    console.log(req.body.ProfessorID);
    db.query(query, value, (err, results, fields) => {
        if (err) {
            console.error(err);
            res.status(500).json({ error: err });

        } else if (results.affectedRows > 0) {
            res.status(200).json({
                message: "Update Professor table ",
                response: results
            })

        } else {
            console.error(results);
            res.status(404).json({
                message: "No results found",
                response: results
            });
        }
    })
};

exports.prof_delete = (req, res, next) => {

    const query = `DELETE FROM Professor WHERE ProfessorID = ?`
    const value = [req.body.ProfessorID]

    db.query(query, value, (err, results, fields) => {
        if (err) {
            res.status(500).json({ error: err });
        } else if (results.affectedRows == 1) {
            res.status(200).json({
                message: "Delete Professor data successfully ",
                response: results
            })
        } else {
            res.status(404).json({
                message: "No results found",
                response: results
            });
        }
    })

};


const convertDate = (inputDate) => {
    const date = new Date(inputDate);
    const year = date.getFullYear();
    let month = date.getMonth() + 1;
    if (month < 10) {
        month = '0' + month;
    }
    let day = date.getDate();
    if (day < 10) {
        day = '0' + day;
    }
    return `${year}-${month}-${day}`;
};
