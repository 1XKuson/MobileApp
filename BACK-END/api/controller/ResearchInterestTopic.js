const db = require('../dbconnection.js');

exports.getdataby_profID = (req,res)=>{
    const professorID = req.body.ProfessorID ;
    const query = `SELECT * FROM researchinteresttopic WHERE ProfessorID ='${professorID}'` ;

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

exports.getdataby_profID_interestID = (req,res)=>{
    const professorID = req.body.ProfessorID;
    const interestID = req.body.InterestID;
    const query = `SELECT * FROM researchinteresttopic WHERE ProfessorID = '${professorID}' AND InterestID = ${interestID}`;
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
        req.body.Topic,
        req.body.Description,
        req.body.ProfessorID
    ];
    const querry = `INSERT INTO 
    researchinteresttopic(Topic,Description,ProfessorID) 
    VALUES(?,?,?)`;

    db.query(querry,values,(err,results)=>{
        if(err){
            res.status(500).json({ error: err });
        }
        else if(results.affectedRows > 0){
            res.status(200).json({
                message : "ResearchInterestTopic inserted successfully",
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
        req.body.Topic,
        req.body.Description,
        req.body.ProfessorID,
        req.body.InterestID
    ];
    const query = `UPDATE researchinteresttopic 
    SET 
        Topic = ?,
        Description = ?
    WHERE ProfessorID = ? AND InterestID = ?`;

    db.query(query,values,(err,results)=>{
        if (err){
            res.status(500).json({error : err});
        }
        else if(results.affectedRows > 0){
            res.status(200).json({
                message : "ResearchInterestTopic updated successfully",
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
    const interestID = req.body.InterestID;
    const query = `DELETE FROM researchinteresttopic WHERE ProfessorID = '${professorID}' AND InterestID = '${interestID}'`;

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
    const query = `SELECT * FROM researchinteresttopic WHERE ProfessorID ='${professorID}'` ;

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