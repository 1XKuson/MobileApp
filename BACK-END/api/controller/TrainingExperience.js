const db = require('../dbconnection');

exports.getdataby_profID = (req,res)=>{
    const professorID = req.body.ProfessorID ;
    const query = `SELECT * FROM trainingexperience WHERE ProfessorID ='${professorID}'` ;

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

exports.getdataby_profID_trainExpID = (req,res)=>{
    const professorID = req.body.ProfessorID;
    const trainexpID = req.body.TrainExpID;
    const query = `SELECT * FROM trainingexperience WHERE ProfessorID = '${professorID}' AND TrainExpID = ${trainexpID}`;
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

exports.postdata_insert =  (req,res)=>{
    const values =[
        req.body.TrainingName,
        req.body.Organization,
        req.body.StartDate,
        req.body.EndDate,
        req.body.ProfessorID,
        req.body.Url
    ];
    const querry = `INSERT INTO 
    trainingexperience(TrainingName,Organization,StartDate,EndDate,ProfessorID,Url) 
    VALUES(?,?,?,?,?,?)`;

    db.query(querry,values,(err,results)=>{
        if(err){
            res.status(500).json({ error: err });
        }
        else if(results.affectedRows > 0){
            res.status(200).json({
                message : "TraningExperience inserted successfully",
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
        req.body.TrainingName,
        req.body.Organization,
        req.body.StartDate,
        req.body.EndDate,
        req.body.Url,
        req.body.ProfessorID,
        req.body.TrainExpID
    ];
    const query = `UPDATE trainingexperience
    SET 
        TrainingName = ?,
        Organization = ?, 
        StartDate = ?, 
        EndDate = ? , 
        URL = ?
    WHERE ProfessorID = ? AND TrainExpID = ?`;

    db.query(query,values,(err,results)=>{
        if (err){
            res.status(500).json({error : err});
        }
        else if(results.affectedRows > 0){
            res.status(200).json({
                message : "TrainingExperience updated successfully",
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
    const trainExpID = req.body.TrainExpID;
    const query = `DELETE FROM trainingexperience WHERE ProfessorID = '${professorID}' AND TrainExpID = '${trainExpID}'`;

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
    const query = `SELECT * FROM trainingexperience WHERE ProfessorID ='${professorID}'` ;

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