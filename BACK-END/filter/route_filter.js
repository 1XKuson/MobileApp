const express = require("express")
const router = express.Router()
const db = require('../api/dbconnection.js');
const { error } = require("pdf-lib");
const {Sequelize,Op} = require('sequelize');
const { default: axios } = require("axios");



router.get('/', (req, res) => {
    res.render('filter.ejs', { results: [] });
});

router.post('/search', async (req, res) => {
    const searchTerm = req.body.searchInput;
    const tables = ['academic', 'book', 'coursestaught','educationbackground','journal','otherproject','proceeding','professor','project','researchinteresttopic'];
    const columns = [
        ['Faculty','AcademicRankPosition'],
        ['Title','Description','Publisher','ISBN','Author'],
        ['Course'],
        ['Faculty','Degree','Institute','Program'],
        ['Topic','Description','Publisher','Level','DOI'],
        ['Title',"Description"],
        ['Topic','PublishedDate','Description','Level','DOI'],
        ['FirstNameTH','LastNameTH','OfficeLocation','FirstNameEng','LastNameEng'],
        ['ProjectName','Description','Position','FundingType','Funder'],
        ['Topic','Description']
    ];
    let Data = []
    let searchID = []
    // Create an array of promises for each query
    if(searchTerm.length>0){
        const queryPromises = tables.map(async (table, i) => {
            const columnConditions = columns[i].map(column => `${column} LIKE '%${searchTerm}%'`).join(' OR ');
            const query = `SELECT * FROM ${table} WHERE ${columnConditions}`;
            
            return new Promise((resolve, reject) => {
                db.execute(query, (err, results) => {
                    if (err) {
                        reject(err);
                    } else {
                        let data = Object.entries(results).map(([key,value])=>value);
                        for(let i=0 ; i<data.length ; i++){
                            Data.push(data[i]);
                        }
                        for(let j=0 ; j<Data.length ; j++){
                            if(!searchID.includes(Data[j].ProfessorID)){
                                searchID.push(Data[j].ProfessorID)
                            }
                        }
                        resolve(results);
                    }
                });
            });
        });

        try {
            // Wait for all queries to complete
            //[ProfessorID,['academic'],['book'],['coursestaught'],['educationbackground'],['journal'],['otherproject'],['proceeding'],['professor'],['project'],['researchinteresttopic']]
            await Promise.all(queryPromises)
            let all_data_search = [];
            const key_data = ['DepartmentID','BookID','CourseID','EducationID','JournalID','OtherProjectID','ProceedingID','ProfessorID','ProjectID','InterestID'];
            for(let id=0 ; id < searchID.length ; id++) { 
                let data_element_byID = [searchID[id],[],[],[],[],[],[],[],[],[],[]];
                //console.log(data_element_byID)
                for(let i =0 ; i < Data.length ; i++) {
                    for(let key=0 ; key<key_data.length ; key++) {
                        if(Data[i].hasOwnProperty(key_data[key]) && Data[i].ProfessorID === searchID[id]){
                            if(Data[i].hasOwnProperty(key_data[0])){
                                const DepartmentID = Data[i].DepartmentID;
                                const ProgramID = Data[i].ProgramID;
                                const newAcademic = await axios.get(`http://localhost:8080/Academic/getdataby_profID_departmentID_programID/${searchID[id]}/${DepartmentID}/${ProgramID}`)
                                Data[i] = newAcademic.data.results[0]
                            }
                            data_element_byID[key+1].push(Data[i]);
                            break;
                        }
                    }
                }
                all_data_search.push(data_element_byID);
            }
            res.status(200).json({
                message: "Data search",
                results: all_data_search
            });
        } catch (error) {
            console.error(error);
            res.status(500).send('Internal Server Error');
        }
    }
});

router.post("/search_by_acdemic_professor_department_program",async(req,res)=>{
    const name = req.body.Name ;
    const lastname = req.body.Lastname;
    const departmentID = req.body.DepartmentID;
    const programID = req.body.ProgramID;

    console.log(req.body)

    const params = [name,lastname,departmentID,programID]
    const conditions = [];
    
    if (params[2] !== '' && params[2] !== 0) {
        conditions.push(`academic.DepartmentID = ${params[2]}`);
    }
    
    if (params[3] !== '' && params[3] !== 0) {
        conditions.push(`academic.ProgramID = ${params[3]}`);
    }
    
    if (params[0] !== '') {
        conditions.push(`professor.FirstNameTH LIKE '%${params[0]}%' OR professor.FirstNameEng LIKE '%${params[0]}%'`);
    }
    
    if (params[1] !== '') {
        conditions.push(`professor.LastNameTH LIKE '%${params[1]}%' OR professor.LastNameEng LIKE '%${params[1]}%'`);
    }

    const whereClause = conditions.length > 0 ? `WHERE ${conditions.join(' OR ')}` : '';
   
    const query =  `SELECT professor.ProfessorID AS ProfessorID,
                        professor.FirstNameTH AS FirstNameTH,
                        professor.LastNameTH AS LastNameTH,
                        academic.AcademicRankPosition AS AcademicRankPosition,
                        program.ProgramName AS ProgramName,
                        images.url AS url
                    FROM professor
                    LEFT JOIN academic ON academic.ProfessorID = professor.ProfessorID
                    LEFT JOIN department ON academic.DepartmentID = department.DepartmentID
                    LEFT JOIN program ON academic.ProgramID = program.ProgramID
                    LEFT JOIN images ON images.ID = professor.imageID
                    ${whereClause}`;

        console.log(query);
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
                // console.log(results);
                res.status(200).json({
                    results: results
                })
            }
        }
    })
})



module.exports = router