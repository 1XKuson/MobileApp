const express = require("express");
const db = require("../dbconnection");
const { v4: uuidv4 } = require("uuid");
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');

require('dotenv').config()

//console.log(process.env)


exports.login = (req, res) => {
    const query = `SELECT *
                    FROM userlogin
                    LEFT JOIN professor
                    ON userlogin.ProfessorID = professor.ProfessorID
                    WHERE userlogin.Email = ?`;

    value = [req.body.Email];
    db.execute(query, value, (err, db_hash) => {
        if (err) {
            res.status(500).json({
                error: err.message,
                message: " Login failed"
            })
        } else {
            if (db_hash.length == 1) {
                bcrypt.compare(req.body.Password, db_hash[0].PasswordHash).then(function (result) {
                    if (result) {
                        const token = jwt.sign({
                            email: db_hash[0].Email,
                            UserID: db_hash[0].UserID,
                            Role: db_hash[0].role,
                            ProfessorID: db_hash[0].ProfessorID,
                            FirstNameTH : db_hash[0].FirstNameTH
                        }, process.env.JWT_KEY, {
                            expiresIn: "1h"
                        });
                        console.log("login successful");
                        res.status(200).json({
                            message: "Login successful",
                            token: token
                        });
                    }
                    else {
                        res.status(500).json({
                            error: err,
                            message: " Login failed"
                        })
                    }
                });
            }
            else {
                res.status(500).json({
                    error: err,
                    message: "Login failed"
                });
            }
        }
    });
};


exports.register = (req, res, next) => {
    const query = "SELECT * FROM userlogin WHERE email = ?";
    const insert_query = `INSERT INTO userlogin (ProfessorID, Username, PasswordHash, Email, role) 
    VALUES (?,?,?,?,?)`;
    value = [req.body.Email];
    db.execute(query, value, (err, results) => {
        if (err) {
            res.status(500).json({
                error: err.message
            })
        } else {
            if (results.length >= 1) {
                res.status(500).json({
                    message: 'Email already registered'
                })
            }
            else {
                bcrypt.hash(req.body.Password, 10, (err, hash) => {
                    if (err) {
                        res.status(500).json({
                            error: err.message
                        })
                    } else {
                        insert_value = [req.body.ProfessorID, req.body.Username, hash, req.body.Email, req.body.Role]
                        db.execute(insert_query, insert_value, (err, results) => {
                            if (err) {
                                res.status(500).json({
                                    error: err,
                                    message: "error here"
                                });
                            }
                            else {
                                res.status(200).json({
                                    message: 'created account successfully',
                                    results: results
                                })
                            }
                        })
                    }
                })
            }
        }
    })



};