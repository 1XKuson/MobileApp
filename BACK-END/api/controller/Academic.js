const db = require('../dbconnection');

exports.getdataby_profID = (req,res)=>{
    const professorID = req.body.ProfessorID ;
    const query = `SELECT * FROM academic
    JOIN department ON academic.DepartmentID = department.DepartmentID 
    JOIN program ON academic.ProgramID = program.ProgramID
    WHERE ProfessorID ='${professorID}'` ;

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

exports.getdataby_profID_departmentID = (req,res)=>{
    const professorID = req.body.ProfessorID ;
    const departmentID = req.body.DepartmentID ;
    const query = `SELECT * FROM academic
    JOIN department ON academic.DepartmentID = department.DepartmentID 
    JOIN program ON academic.ProgramID = program.ProgramID
    WHERE academic.ProfessorID ='${professorID}' AND academic.DepartmentID = '${departmentID}'` ;

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

exports.getdataby_profID_programID = (req,res)=>{
    const professorID = req.body.ProfessorID ;
    const programID = req.body.ProgramID ;
    const query = `SELECT * FROM academic
    JOIN department ON academic.DepartmentID = department.DepartmentID 
    JOIN program ON academic.ProgramID = program.ProgramID
    WHERE academic.ProfessorID ='${professorID}' AND academic.ProgramID = '${programID}'` ;

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

exports.getdatby_departmentID_programID = (req,res)=>{
    const programID = req.body.ProgramID ;
    const departmentID = req.body.DepartmentID ;
    const query = `SELECT * FROM academic
    JOIN department ON academic.DepartmentID = department.DepartmentID 
    JOIN program ON academic.ProgramID = program.ProgramID
    WHERE academic.ProgramID ='${programID}' AND academic.DepartmentID = '${departmentID}'` ;

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

exports.getdataby_profID_departmentID_programID = (req,res)=>{
    const professorID = req.params.ProfessorID;
    const programID = req.params.ProgramID ;
    const departmentID = req.params.DepartmentID ;
    const query = `SELECT * FROM academic
    JOIN department ON academic.DepartmentID = department.DepartmentID 
    JOIN program ON academic.ProgramID = program.ProgramID
    WHERE academic.ProfessorID ='${professorID}' AND academic.ProgramID ='${programID}' AND academic.DepartmentID = '${departmentID}'` ;

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
        req.body.ProfessorID,
        req.body.Faculty,
        req.body.AcademicRankPosition,
        req.body.DepartmentID,
        req.body.ProgramID
    ];
    const querry = `INSERT INTO 
    academic(ProfessorID,Faculty,AcademicRankPosition,DepartmentID,ProgramID) 
    VALUES(?,?,?,?,?)`;

    db.query(querry,values,(err,results)=>{
        if(err){
            res.status(500).json({ error: err });
        }
        else if(results.affectedRows > 0){
            res.status(200).json({
                message : "Academic inserted successfully",
                results :  results
            })  
        }
        else{
            res.status(404).json({ 
                message: "No results found",
                results: results
            })
        }
    })
};

exports.edit_data = (req,res)=>{
    console.log(req.body);
    const values =[
        req.body.Faculty,
        req.body.AcademicRankPosition,
        req.body.DepartmentID,
        req.body.ProgramID,
        req.body.ProfessorID,
    ];
    const query = `UPDATE academic
    SET 
        Faculty = ?,
        AcademicRankPosition = ?,
        DepartmentID = ?, 
        ProgramID = ? 
    WHERE ProfessorID = ?`;

    db.query(query,values,(err,results)=>{
        if (err){
            res.status(500).json({error : err});
        }
        else if(results.affectedRows > 0){
            res.status(200).json({
                message : "Academic updated successfully",
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

exports.delete_data = (req,res)=>{
    const professorID = req.body.ProfessorID;
    const query = `DELETE FROM academic WHERE ProfessorID = '${professorID}'`;

    db.query(query,(err,results)=>{
        if (err){
            res.status(500).json({error : err});
        }
        else if(results.affectedRows > 0){
            res.status(200).json({
                message : "delete data successfully",
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

exports.getdataby_profID_byID = (req,res)=>{
    const professorID = req.params.ProfessorID ;
    const query = `SELECT * FROM academic
    JOIN department ON academic.DepartmentID = department.DepartmentID 
    JOIN program ON academic.ProgramID = program.ProgramID
    WHERE ProfessorID ='${professorID}'` ;

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

exports.getdataby_profID_byID = (req,res)=>{
    const professorID = req.params.ProfessorID ;
    const query = `SELECT * FROM academic
    JOIN department ON academic.DepartmentID = department.DepartmentID 
    JOIN program ON academic.ProgramID = program.ProgramID
    WHERE ProfessorID ='${professorID}'` ;

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