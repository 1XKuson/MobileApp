const db = require('../dbconnection');

exports.getdataby_profID = (req,res)=>{
    const professorID = req.body.ProfessorID ;
    const query = `SELECT * FROM experience WHERE ProfessorID ='${professorID}'` ;

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

exports.getdataby_profID_expID = (req,res)=>{
    const professorID = req.body.ProfessorID;
    const expID = req.body.ExperienceID;
    const query = `SELECT * FROM experience WHERE ProfessorID = '${professorID}' AND ExperienceID = ${expID}`;
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
        req.body.Organization,
        req.body.EndDate,
        req.body.StartDate,
        req.body.Description,
        req.body.ProfessorID,
        req.body.Position
    ];
    const querry = `INSERT INTO 
    experience(Organization,EndDate,StartDate,Description,ProfessorID,Position) 
    VALUES(?,?,?,?,?,?)`;

    db.query(querry,values,(err,results)=>{
        if(err){
            res.status(500).json({ error: err });
        }
        else if(results.affectedRows > 0){
            res.status(200).json({
                message : "Experience inserted successfully",
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

exports.insert_experience = (req,res)=>{
    const values =[
        req.body.Organization,
        req.body.EndDate,
        req.body.StartDate,
        req.body.Description,
        req.body.Position,
        req.body.ProfessorID,
        req.body.ExperienceID
    ];
    const query = `UPDATE experience
    SET 
        Organization = ?,
        EndDate = ?, 
        StartDate = ?, 
        Description = ? , 
        Position = ?
    WHERE ProfessorID = ? AND ExperienceID = ?`;

    db.query(query,values,(err,results)=>{
        if (err){
            res.status(500).json({error : err});
        }
        else if(results.affectedRows > 0){
            res.status(200).json({
                message : "Experience updated successfully",
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

exports.delete_experience = (req,res)=>{
    const professorID = req.body.ProfessorID;
    const expID = req.body.ExperienceID;
    const query = `DELETE FROM experience WHERE ProfessorID = '${professorID}' AND ExperienceID = '${expID}'`;

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
    const query = `SELECT * FROM experience WHERE ProfessorID ='${professorID}'` ;

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