const express = require("express");
const db = require("../dbconnection");

exports.project_get = (req, res) => {
    const query = 'SELECT * FROM project WHERE ProfessorID  =?';
    const value = req.body.ProfessorID;

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

exports.other_project_get = (req, res) => {
    const query = 'SELECT * FROM otherproject WHERE ProfessorID  =?';
    const value = req.body.ProfessorID;

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

exports.project_post = (req, res) => {
    if(req.body.type == 'project') {
        const query = `INSERT INTO Project 
        (ProjectName, StartDate, Description, Position, ProfessorID, FundingType, Funder, EndDate, Budget)
        VALUES 
        (?, ?, ?, ?, ?, ?, ?, ?, ?)`
        const value = [
            req.body.ProjectName, 
            req.body.StartDate, 
            req.body.Description, 
            req.body.Position, 
            req.body.ProfessorID, 
            req.body.FundingType, 
            req.body.Funder, 
            req.body.EndDate, 
            req.body.Budget
        ]

        db.query(query, value, (err, results, fields) => {
            if (err) {
                res.status(500).json({ error: err });
            } else if (results.affectedRows > 0) {
                res.status(200).json({
                    message: "INSERT INTO Project successfully",
                    response: results
                })
            } else {
                res.status(404).json({ message: "No results found" });
            }
        })

    }else if(req.body.type == 'other project') {
        const query = `INSERT INTO OtherProject (Title, Description, ProfessorID)
        VALUES 
        (?, ?, ?)`
        const value =  [
            req.body.Title, 
            req.body.Description, 
            req.body.ProfessorID
        ]
        db.query(query, value, (err, results, fields) => {
            if (err) {
                res.status(500).json({ error: err });
            } else if (results.affectedRows > 0 ) {
                res.status(200).json({
                    message: "INSERT INTO Other Project successfully",
                    response: results
                })
            } else {
                res.status(404).json({ message: "No results found" });
            }
        })
    }
    else {
        res.status(404).json({ message: "type project or other project" });
    }

};

exports.project_put = (req, res) => {
    if(req.body.type == 'project') {
        const query = `UPDATE Project
        SET 
            ProjectName = ?, 
            StartDate = ?, 
            Description = ?, 
            Position = ?,  
            FundingType = ?, 
            Funder = ?, 
            EndDate = ?, 
            Budget = ?
        WHERE ProfessorID = ? AND ProjectID = ?`
        const value = [
            req.body.ProjectName, 
            req.body.StartDate, 
            req.body.Description, 
            req.body.Position, 
            req.body.FundingType, 
            req.body.Funder, 
            req.body.EndDate, 
            req.body.Budget,
            req.body.ProfessorID, 
            req.body.ProjectID
        ]

        db.query(query, value, (err, results, fields) => {
            if (err) {
                res.status(500).json({ error: err });
            } else if (results.affectedRows > 0 ) {
                res.status(200).json({
                    message: "UPDATE INTO Project successfully",
                    response: results
                })
            } else {
                res.status(404).json({ message: "No results found" });
            }
        })

    }else if(req.body.type == 'other project') {
        const query = `UPDATE OtherProject 
        SET 
            Title = ?, 
            Description = ?
        WHERE ProfessorID = ? AND OtherProjectID = ? `
        const value =  [
            req.body.Title, 
            req.body.Description, 
            req.body.ProfessorID,
            req.body.OtherProjectID
        ]
        db.query(query, value, (err, results, fields) => {
            if (err) {
                res.status(500).json({ error: err });
            } else if (results.affectedRows > 0 ) {
                res.status(200).json({
                    message: "UPDATE INTO Other Project successfully",
                    response: results
                })
            } else {
                res.status(404).json({ message: "No results found" });
            }
        })
    }
    else {
        res.status(404).json({ message: "type project or other project" });
    }

};

exports.project_delete = (req, res) => {
    const query = 'DELETE FROM project WHERE ProfessorID  = ? AND ProjectID = ?';
    const value = [req.body.ProfessorID,req.body.ProjectID];

    db.query(query, value, (err, results, fields) => {
        if (err) {
            res.status(500).json({ error: err });
        } else if (results.affectedRows > 0) {
            res.status(200).json({
                message : "Project deleted successfully",
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

exports.other_project_delete = (req, res) => {
    const query = 'DELETE FROM  otherproject WHERE ProfessorID  =? AND OtherProjectID =?';
    const value = [req.body.ProfessorID,req.body.OtherProjectID];

    db.query(query, value, (err, results, fields) => {
        if (err) {
            res.status(500).json({ error: err });
        } else if (results.affectedRows > 0) {
            res.status(200).json({
                message : "Delete from other project successfully",
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

exports.project_get_ID = (req, res) => {
    const query = 'SELECT * FROM project WHERE ProfessorID  =?';
    const value = req.params.ProfessorID;

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

exports.other_project_get_ID = (req, res) => {
    const query = 'SELECT * FROM otherproject WHERE ProfessorID  =?';
    const value = req.params.ProfessorID;

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


