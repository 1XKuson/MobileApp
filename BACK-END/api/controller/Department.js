const db = require('../dbconnection.js');

exports.get_department =(req,res)=>{
    const query = `SELECT * FROM department ` ;

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