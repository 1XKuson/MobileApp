const db = require('../dbconnection.js');

exports.getdataBy_profID = (req,res)=>{
    const professorID = req.body.ProfessorID ;
    const query = `SELECT * FROM educationbackground WHERE ProfessorID ='${professorID}'` ;

    db.query(query,(err,results)=>{
        if (err) {
            res.status(500).json({ error: err });
        }else{
            if (results.length === 0){
                res.status(404).json({ 
                    message: "No results found",
                    results: results
                });
            }
            else{
                res.status(200).json({
                    results: results
                })
                
            }
        }
    })
};

exports.getdataBy_profId_eduID = (req,res)=>{
    const professorID = req.body.ProfessorID;
    const educationID = req.body.EducationID;
    const query = `SELECT * FROM educationbackground WHERE ProfessorID = '${professorID}' AND EducationID = ${educationID}`;
    db.query(query,(err,results)=>{
        if (err) {
            res.status(500).json({ error: err });
        }else{
            if (results.length === 0){
                res.status(404).json({ 
                    message: "No results found",
                    results: results
                });
            }
            else{
                res.status(200).json({
                    results: results
                })
                
            }
        }
    })
};

exports.postinsert_data = (req,res)=>{
    const values =[
        req.body.Year,
        req.body.Faculty,
        req.body.Degree,
        req.body.Institute,
        req.body.Program,
        req.body.ProfessorID
    ];
    const querry = `INSERT INTO 
    educationbackground(Year,Faculty,Degree,Institute,Program,ProfessorID) 
    VALUES(?,?,?,?,?,?)`;

    db.query(querry,values,(err,results)=>{
        if(err){
            res.status(500).json({ error: err });
        }
        else if(results.affectedRows > 0){
            res.status(200).json({
                message : "Educationbackground inserted successfully",
                results :  results
            })  
        }
        else{
            res.status(404).json({ 
                message: "No results found",
                results: results
            });
        }
    })
};

exports.edit_data = (req,res)=>{
    const values =[
        req.body.Year,
        req.body.Faculty,
        req.body.Degree,
        req.body.Institute,
        req.body.Program,
        req.body.ProfessorID,
        req.body.EducationID
    ];
    const query = `UPDATE educationbackground 
    SET 
        Year = ?,
        Faculty = ?, 
        Degree = ?, 
        Institute = ? , 
        Program = ?
    WHERE ProfessorID = ? AND EducationID = ?`;

    db.query(query,values,(err,results)=>{
        if (err){
            res.status(500).json({error : err});
        }
        else if(results.affectedRows > 0){
            res.status(200).json({
                message : "Educationbackground updated successfully",
                results : results 
            })
        }
        else{
            res.status(404).json({
                message : "No results found",
                response : results
            })
        }
    })
};

exports.delete_data = (req, res) => {
    const professorID = req.body.ProfessorID;
    const educationID = req.body.EducationID;
    console.log(typeof educationID);
    console.log(typeof ProfessorID);
    
    const query = 'DELETE FROM educationbackground WHERE ProfessorID = ? AND EducationID = ?';
    db.query(query, [professorID, educationID], (err, results) => {
        if (err) {
            console.error(err);
            res.status(500).json({ error: err });
        } else if (results.affectedRows > 0) {
            res.status(200).json({
                message: "Deleted data successfully",
                results: results
            });
        } else {
            res.status(404).json({
                message: "No results found",
                response: results
            });
        }
    });
};


exports.getdataBy_profID_byID = (req,res)=>{
    const professorID = req.params.ProfessorID ;
    const query = `SELECT * FROM educationbackground WHERE ProfessorID ='${professorID}'` ;

    db.query(query,(err,results)=>{
        if (err) {
            res.status(500).json({ error: err });
        }else{
            if (results.length === 0){
                res.status(404).json({ 
                    message: "No results found",
                    results: results
                });
            }
            else{
                res.status(200).json({
                    results: results
                })
                
            }
        }
    })
};

exports.getdataBy_profID_byID = (req,res)=>{
    const professorID = req.params.ProfessorID ;
    const query = `SELECT * FROM educationbackground WHERE ProfessorID ='${professorID}'` ;

    db.query(query,(err,results)=>{
        if (err) {
            res.status(500).json({ error: err });
        }else{
            if (results.length === 0){
                res.status(404).json({ 
                    message: "No results found",
                    results: results
                });
            }
            else{
                res.status(200).json({
                    results: results
                })
                
            }
        }
    })
};