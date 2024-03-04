const db =require('../dbconnection');

exports.getdata_academic_professor = (req,res)=>{
    const professorID = req.params.ProfessorID ;
    const query = `SELECT * FROM professor
    LEFT JOIN academic ON academic.ProfessorID = professor.ProfessorID 
    WHERE professor.ProfessorID ='${professorID}'` ;

    db.query(query,(err,results)=>{
        if (err) {
            res.status(500).json({ error: err });
        }else{
            function RankPositionEng(THRank,gender){
                let RankPositionEng;
                const THPosition = ["ดร.","อ.","ผศ.","ผศ.ดร.","รศ.","รศ.ดร.","ศ.","ศ.ดร."];
                const EngPosition = ["Dr.",["Mr.","Ms."],"Asst.Prof.","Asst.Prof.Dr.","Assoc.Prof.","Assoc.Prof.Dr.","Prof.","Prof.Dr."];
                for(let i=0 ; i<THPosition.length ; i++){
                    if(THRank === THPosition[i]){
                        if(i === 1 && gender === "Male"){
                            RankPositionEng = EngPosition[i][0];
                        }
                        else if(i === 1 && gender === "Female"){
                            RankPositionEng = EngPosition[i][1];
                        }
                        else{
                            RankPositionEng = EngPosition[i]
                        }
                        break;
                    }
                }
                return RankPositionEng
            }

            if (results.length === 0){
                res.status(404).json({ 
                    message: "No results found",
                    results: results
                });
            }
            else{
                const AcademicRankPositionENG = RankPositionEng(results[0].AcademicRankPosition,results[0].Gender)
                results[0].AcademicRankPositionEng = AcademicRankPositionENG;
                res.status(200).json({
                    results: results
                })
            }
        }
    })
}