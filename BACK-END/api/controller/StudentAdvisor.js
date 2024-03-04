const db = require('../dbconnection.js');

exports.getdataby_profID = (req,res)=>{
    const professorID = req.body.ProfessorID ;
    const query = `SELECT * FROM studentadvisor WHERE ProfessorID ='${professorID}'` ;

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

exports.postdata_insert = (req,res)=>{
    const values =[
        req.body.ProfessorID,
        req.body.Master,
        req.body.Doctor,
        req.body.PresentMaster,
        req.body.PresentDoctor
    ];
    const querry = `INSERT INTO 
    studentadvisor(ProfessorID,Master,Doctor,PresentMaster,PresentDoctor) 
    VALUES(?,?,?,?,?)`;

    db.query(querry,values,(err,results)=>{
        if(err){
            res.status(500).json({ error: err });
        }
        else if(results.affectedRows > 0){
            res.status(200).json({
                message : "StudentAdvisor inserted successfully",
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

exports.update_data = (req,res)=>{
    const values =[
        req.body.Master,
        req.body.Doctor,
        req.body.PresentMaster,
        req.body.PresentDoctor,
        req.body.ProfessorID
    ];
    const query = `UPDATE studentadvisor 
    SET 
        Master = ?,
        Doctor = ?,
        PresentMaster = ?,
        PresentDoctor = ?
    WHERE ProfessorID = ?`;

    db.query(query,values,(err,results)=>{
        if (err){
            res.status(500).json({error : err});
        }
        else if(results.affectedRows > 0){
            res.status(200).json({
                message : "StudentAdvisor updated successfully",
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
    const query = `DELETE FROM studentadvisor WHERE ProfessorID = '${professorID}'`;

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
    const query = `SELECT * FROM studentadvisor WHERE ProfessorID ='${professorID}'` ;

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