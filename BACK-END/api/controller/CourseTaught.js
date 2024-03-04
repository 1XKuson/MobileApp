const db = require('../dbconnection.js');

exports.getdataby_profID =(req,res)=>{
    const professorID = req.body.ProfessorID ;
    const query = `SELECT * FROM coursestaught WHERE ProfessorID ='${professorID}'` ;

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

exports.getdataby_profID_courseID = (req,res)=>{
    const professorID = req.body.ProfessorID;
    const courseID = req.body.CourseID;
    const query = `SELECT * FROM coursestaught WHERE ProfessorID = '${professorID}' AND CourseID = ${courseID}`;
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
        req.body.Course,
        req.body.Credit,
        req.body.ProfessorID
    ];
    const querry = `INSERT INTO 
    coursestaught(Course,Credit,ProfessorID) 
    VALUES(?,?,?)`;

    db.query(querry,values,(err,results)=>{
        if(err){
            res.status(500).json({ error: err });
        }
        else if(results.affectedRows > 0){
            res.status(200).json({
                message : "Coursestaught inserted successfully",
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
        req.body.Course,
        req.body.Credit,
        req.body.ProfessorID,
        req.body.CourseID
    ];
    const query = `UPDATE coursestaught 
    SET 
        Course = ?,
        Credit = ?
    WHERE ProfessorID = ? AND CourseID = ?`;

    db.query(query,values,(err,results)=>{
        if (err){
            res.status(500).json({error : err});
        }
        else if(results.affectedRows > 0){
            res.status(200).json({
                message : "CoursesTaught updated successfully",
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
    const courseID = req.body.CourseID;
    const query = `DELETE FROM coursestaught WHERE ProfessorID = '${professorID}' AND CourseID = '${courseID}'`;

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
}

exports.getdataby_profID_byID =(req,res)=>{
    const professorID = req.params.ProfessorID ;
    const query = `SELECT * FROM coursestaught WHERE ProfessorID ='${professorID}'` ;

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