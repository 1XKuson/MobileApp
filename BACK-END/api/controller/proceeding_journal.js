const express = require("express");
const db = require("../dbconnection");


exports.proceeding_get = (req, res, next) => {

    const query = "SELECT * FROM Proceeding WHERE ProfessorID = ?"
    const value = [req.body.ProfessorID ]

    db.query(query, value, (err, results, fields) => {
        if (err) {
            res.status(500).json({ error: err });
        } else if (results.length > 0) {
            res.status(200).json({
                results: results
            })
        } else {
            res.status(404).json({ message: "No results found" ,
            response: results});
        }
    })
};


exports.journal_get = (req, res, next) => {

    const query = "SELECT * FROM Journal WHERE ProfessorID = ? "

    const value = [req.body.ProfessorID]
    
    db.query(query, value, (err, results, fields) => {
        if (err) {
            res.status(500).json({ error: err });
        } else if (results.length > 0) {
            res.status(200).json({
                results: results
            })
        } else {
            res.status(404).json({ message: "No results found" ,
            response: results});
        }
    })
};


exports.proceeding_post = (req, res, next) => {
    req.body.PublishedDate = convertDate(req.body.PublishedDate);
   
    if (req.body.type == "proceeding") {

        const query = `INSERT INTO Proceeding 
    (Topic, PublishedDate, TypeID, Description, Publisher, ProfessorID, Level, AcadDatabase, URL, DOI, AuthorProfessorID)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`

        const value = [
            req.body.Topic,
            req.body.PublishedDate,
            req.body.TypeID,
            req.body.Description,
            req.body.Publisher,
            req.body.ProfessorID,
            req.body.Level,
            req.body.AcadDatabase,
            req.body.URL,
            req.body.DOI,
            req.body.AuthorProfessorID
        ]

        db.query(query, value, (err, results, fields) => {
            if (err) {
                res.status(500).json({ error: err });
            } else if (results) {
                res.status(200).json({
                    message: "INSERT INTO Proceeding successfully",
                    response: results
                })
            } else {
                res.status(404).json({ message: "No results found" });
            }
        })
    }
    else if (req.body.type == "journal") {

        const query = `INSERT INTO Journal (Topic, PublishedDate, TypeID, Description, Publisher, ProfessorID, Level, AcadDatabase, URL, DOI, Quatile)
    VALUES (?,?,?,?,?,?,?,?,?,?,?);
    `

        const value = [
            req.body.Topic,
            req.body.PublishedDate,
            req.body.TypeID,
            req.body.Description,
            req.body.Publisher,
            req.body.ProfessorID,
            req.body.Level,
            req.body.AcadDatabase,
            req.body.URL,
            req.body.DOI,
            req.body.Quatile
        ]

        db.query(query, value, (err, results, fields) => {
            if (err) {
                res.status(500).json({ error: err });
            } else if (results.affectedRows > 0) {
                res.status(200).json({
                    message: "INSERT INTO Journal successfully",
                    response: results
                })
            } else {
                res.status(405).json({ message: "No results found" });
            }
        })
    }
    else {
        console.log(err);
        res.status(404).json({ message: "type proceeding or journal" });
    }
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

exports.proceeding_put = (req, res, next) => {
    if (req.body.type == 'proceeding') {
        // Convert PublishedDate format
        req.body.PublishedDate = convertDate(req.body.PublishedDate);

        const query = `UPDATE  Proceeding 
        SET
            Topic = ?, 
            PublishedDate = ?, 
            TypeID  = ?,  
            Description = ?, 
            Publisher = ?, 
            Level = ?, 
            AcadDatabase = ?, 
            URL = ?, 
            DOI = ?, 
            AuthorProfessorID = ?
        WHERE ProfessorID = ? AND ProceedingID = ?`;

        const value = [
            req.body.Topic,
            req.body.PublishedDate,
            req.body.TypeID,
            req.body.Description,
            req.body.Publisher,
            req.body.Level,
            req.body.AcadDatabase,
            req.body.URL,
            req.body.DOI,
            req.body.AuthorProfessorID,
            req.body.ProfessorID,
            req.body.ProceedingID
        ];

        db.query(query, value, (err, results, fields) => {
            if (err) {
                res.status(500).json({ error: err });
            } else if (results.affectedRows == 1) {
                res.status(200).json({
                    message: "update INTO Proceeding successfully",
                    response: results
                });
            } else {
                res.status(404).json({
                    message: "No results found",
                    response: results
                });
            }
        });
    } else if (req.body.type == 'journal') {
        // Convert PublishedDate format
        req.body.PublishedDate = convertDate(req.body.PublishedDate);

        const query = `UPDATE  Journal 
            SET 
            Topic = ?, 
            PublishedDate = ?,
            TypeID = ?, 
            Description = ?, 
            Publisher = ?,  
            Level = ?, 
            AcadDatabase = ?, 
            URL = ?, 
            DOI = ?, 
            Quatile  = ?
        WHERE ProfessorID = ? AND JournalID = ?`;

        const value = [
            req.body.Topic,
            req.body.PublishedDate,
            req.body.TypeID,
            req.body.Description,
            req.body.Publisher,
            req.body.Level,
            req.body.AcadDatabase,
            req.body.URL,
            req.body.DOI,
            req.body.Quatile,
            req.body.ProfessorID,
            req.body.JournalID
        ];

        db.query(query, value, (err, results, fields) => {
            if (err) {
                res.status(500).json({ error: err });
            } else if (results.affectedRows == 1) {
                res.status(200).json({
                    message: "Update Journal successfully",
                    response: results
                });
            } else {
                res.status(404).json({
                    message: "No results found",
                    response: results
                });
            }
        });
    } else {
        res.status(404).json({
            message: "type proceeding or journal",
            response: results
        });
    }
};



exports.proceeding_delete = (req, res, next) => {

    const query = "DELETE FROM Proceeding WHERE ProfessorID = ? AND ProceedingID = ?"
    const value = [req.body.ProfessorID, req.body.ProceedingID ]

    db.query(query, value, (err, results, fields) => {
        if (err) {
            res.status(500).json({ error: err });
        } else if (results.affectedRows == 1) {
            res.status(200).json({
                message :"Deleted Proceeding successfully",
                results: results
            })
        } else {
            res.status(404).json({ message: "No results found" ,
            response: results});
        }
    })

};


exports.journal_delete = (req, res, next) => {

    const query = "DELETE FROM Journal WHERE ProfessorID = ? AND JournalID = ?"

    const value = [req.body.ProfessorID, req.body.JournalID ]
    
    db.query(query, value, (err, results, fields) => {
        if (err) {
            res.status(500).json({ error: err });
        } else if (results.affectedRows == 1) {
            res.status(200).json({
                message :"Deleted Journal successfully",
                results: results
            })
        } else {
            res.status(404).json({ message: "No results found" ,
            response: results});
        }
    })
};

exports.proceeding_get_byID = (req, res, next) => {

    const query = "SELECT * FROM Proceeding WHERE ProfessorID = ?"
    const value = [req.params.ProfessorID ]

    db.query(query, value, (err, results, fields) => {
        if (err) {
            res.status(500).json({ error: err });
        } else if (results.length > 0) {
            res.status(200).json({
                results: results
            })
        } else {
            res.status(404).json({ message: "No results found" ,
            response: results});
        }
    })
};

exports.journal_get_byID = (req, res, next) => {

    const query = "SELECT * FROM Journal WHERE ProfessorID = ? "

    const value = [req.params.ProfessorID]
    
    db.query(query, value, (err, results, fields) => {
        if (err) {
            res.status(500).json({ error: err });
        } else if (results.length > 0) {
            res.status(200).json({
                results: results
            })
        } else {
            res.status(404).json({ message: "No results found" ,
            response: results});
        }
    })
};