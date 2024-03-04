const db = require('../dbconnection.js');

exports.get_program =(req,res)=>{
    const query = `SELECT * FROM program ` ;

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

exports.get_programid_Programname =(req,res)=>{
    const query = `SELECT ProgramID,ProgramName FROM program ` ;

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