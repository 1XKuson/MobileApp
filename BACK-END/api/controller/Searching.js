const db = require('../api/dbconnection.js')

exports.show_example_page_filter = (req, res) => {
    res.render('filter.ejs', { results: [] });
};

exports.Recommend_searching = async (req, res) => {
    const searchTerm = req.body.searchInput;
    const tables = ['academicdetails', 'professors', 'researchpublications'];
    const columns = [
        ['Department', 'FacultyCollege', 'AcademicRankPosition', 'CoursesTaught', 'ResearchAreasInterests', 'EducationBackground'],
        ['FirstName', 'Lastname'],
        ['PublishedPapers', 'ResearchProjects', 'ConferencePresentations', 'Patents']
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
            await Promise.all(queryPromises);

            // Search for the specified ID (searchID) in all tables and columns
            const idSearchPromises = searchID.map(async (id) => {
                const idQueryPromises = tables.map(async (table, i) => {
                    const query = `SELECT * FROM ${table} WHERE ProfessorID = '${id}'`;

                    return new Promise((resolve, reject) => {
                        db.execute(query, (err, results) => {
                            if (err) {
                                reject(err);
                            } else {
                                resolve(results);
                            }
                        });
                    });
                });

                const idSearchResults = await Promise.all(idQueryPromises);

                //console.log(idSearchResults)

                // Flatten the array of ID search results for the current ID
                const flattenedIdSearchResults = [].concat(...idSearchResults);
                return flattenedIdSearchResults;
            });

            // Wait for all ID search queries to complete
            const finalIdSearchResults = await Promise.all(idSearchPromises);

            // console.log(typeof finalIdSearchResults)
            // console.log(finalIdSearchResults)

            let complete_data=[]
            //merge data

            function combineObjects(dataArray) {
                const combinedObject = dataArray.reduce((result, obj) => {
                    Object.entries(obj).forEach(([key, value]) => {
                        result[key] = value;
                    });
                    return result;
                }, {});
            
                return combinedObject;
            }

            for(let data_id = 0 ; data_id < finalIdSearchResults.length ; data_id++) {
                complete_data.push(combineObjects(finalIdSearchResults[data_id]))
            }
            console.log(complete_data) 
            // Flatten the array of all ID search results
            //const flattenedIdSearchResults = [].concat(...finalIdSearchResults);

            // console.log("-----------------------------------------------------------------");
            // console.log(Data);
            // console.log("-----------------------------------------------------------------");
            // console.log(searchID);
            // console.log("-----------------------------------------------------------------");
            //console.log(flattenedIdSearchResults);

            res.status(200).json({
                message : "Data search",
                data:complete_data
            })
        } catch (error) {
            console.error(error);
            res.status(500).send('Internal Server Error');
        }
    }
};