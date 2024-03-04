const express = require("express");
const db = require("../dbconnection");
const { v4: uuidv4 } = require("uuid");

exports.post_prof_research = (req, res, next) => {
  const query = `INSERT INTO AcademicDetails (ProfessorID, Department, FacultyCollege, AcademicRankPosition, CoursesTaught, ResearchAreasInterests, EducationBackground)
                  VALUES (?,?,?,?,?,?, ?, ?, ?)`;
  value = [
    req.body.ProfessorID,
    req.body.Department,
    req.body.FacultyCollege,
    req.body.AcademicRankPosition,
    req.body.CoursesTaught,
    req.body.ResearchAreasInterests,
    req.body.EducationBackground,
  ];

  db.execute(query, value, (err, results) => {
    if (err) {
      res.status(500).json({
        error: err,
        request: {
          method: "POST",
          url: "http://localhost:8080/users/POSTProfAcademic",
          format: {},
        },
      });
    } else {
      res.status(200).json({
        message: "INSERT INTO AcademicDetails Success",
        results: results,
      });
    }
  });
};

exports.post_prof_info = (req, res) => {
  const query = `INSERT INTO Professors
    (ProfessorID, FirstName, LastName, DateOfBirth, Gender, Email, Phone, OfficeLocation)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?)`;

  const value = [
    req.params.ProfessorID,
    req.body.FirstName,
    req.body.LastName,
    req.body.DateOfBirth,
    req.body.Gender,
    req.body.Email,
    req.body.Phone,
    req.body.OfficeLocation,
  ];

  db.execute(query, value, (err, results) => {
    if (err) {
      res.status(500).json({
        error: err,
        request: {
          method: "POST",
          url: "http://localhost:8080/users/POSTProfInfo/:ProfessorID",
          format: {
            ProfessorID: "64b60a64-384e-4369-b066-c1aa21d43a03(uuidv4)",
            FirstName: "Kuson",
            LastName: "Ta",
            DateOfBirth: "1990-01-01",
            Gender: "F",
            Email: "kuson@gmail.com",
            Phone: "0123456789",
            OfficeLocation: "Lad Krabang",
          },
        },
      });
    } else if (results) {
      res.status(200).json({
        message: "INSERT To professor table success",
        results: results,
      });
    } else {
      res.status(404).json({
        message: "Not Found",
        request: {
          method: "POST",
          url: "http://localhost:8080/users/POSTProfInfo",
          format: {
            FirstName: "Kuson",
            LastName: "Ta",
            DateOfBirth: "1990-01-01",
            Gender: "F",
            Email: "kuson@gmail.com",
            Phone: "0123456789",
            OfficeLocation: "Lad Krabang",
          },
        },
      });
    }
  });
};

exports.post_prof_academic = (req, res, next) => {
  const query = `INSERT INTO AcademicDetails (ProfessorID, Department, FacultyCollege, AcademicRankPosition, CoursesTaught, ResearchAreasInterests, EducationBackground)
                VALUES (?,?,?,?,?,?,?)`;
  value = [
    req.params.ProfessorID,
    req.body.Department,
    req.body.FacultyCollege,
    req.body.AcademicRankPosition,
    req.body.CoursesTaught,
    req.body.ResearchAreasInterests,
    req.body.EducationBackground
  ];

  db.execute(query, value, (err, results) => {
    if (err) {
      res.status(500).json({
        error: err,
        request: {
          method: "POST",
          url: "http://localhost:8080/users/POSTProfAcademic/:ProfessorID",
          format: {},
        },
      });
    } else {
      res.status(200).json({
        message: "INSERT INTO AcademicDetails Success",
        results: results,
      });
    }
  });
};

exports.post_prof_research=(req,res)=>{
  const query = `INSERT INTO ResearchPublications (ProfessorID, PublishedPapers, ResearchProjects, ConferencePresentations, Patents)
  VALUES (?,?,?,?,?);`


  value = [
    req.params.ProfessorID,
    req.body.PublishedPapers,
    req.body.ResearchProjects,
    req.body.ConferencePresentations,
    req.body.Patents
  ]
  db.execute(query,value, (err, results) => {
    if(err) {
        res.status(500).json({
            error :err,
            request : {
                method : 'POST',
                url : 'http://localhost:8080/users/POSTResearch',
                format :{
                  
                }
            }
        });
    }
    else{
        res.status(200).json({
            message : 'INSERT INTO researchpublications Success',
            results : results
        })
    }
  });
};

exports.post_prof_teaching = (req,res)=>{
  const query =`INSERT INTO TeachingAdvising (ProfessorID, CoursesTaught) VALUES (?,?);`
  value = [
    req.params.ProfessorID,
    req.body.CoursesTaught
  ]
  
  db.execute(query,value, (err, results) => {
      if(err) {
          res.status(500).json({
              error :err,
              request : {
                  method : 'POST',
                  url : 'http://localhost:8080/users/POSTTeaching',
                  format :{
                    
                  }
              }
          });
      }
      else{
          res.status(200).json({
              message : 'INSERT INTO teachingadvising Success',
              results : results
          })
      }
    });
          
};




exports.get_prof_data = (req, res) => {
  const query = `
          SELECT
          P.ProfessorID,
          P.FirstName,
          P.LastName,
          P.DateOfBirth,
          P.Gender,
          P.Email,
          P.Phone,
          P.OfficeLocation,
          P.imagesID,
          AD.Department,
          AD.FacultyCollege,
          AD.AcademicRankPosition,
          AD.CoursesTaught AS AcademicCoursesTaught,
          AD.ResearchAreasInterests AS AcademicResearchAreasInterests,
          AD.EducationBackground,
          RP.PublishedPapers,
          RP.ResearchProjects,
          RP.ConferencePresentations,
          RP.Patents,
          TA.CoursesTaught AS TeachingCoursesTaught
        FROM Professors P
        LEFT JOIN AcademicDetails AD ON P.ProfessorID = AD.ProfessorID
        LEFT JOIN ResearchPublications RP ON P.ProfessorID = RP.ProfessorID
        LEFT JOIN TeachingAdvising TA ON P.ProfessorID = TA.ProfessorID`;

  db.query(query, (err, results, fields) => {
    if (err) {
      res.status(500).json({ error: err });
    } else {
      if (results.length > 0) {
        res.status(200).json({
          Info: results.map((data) => ({
            ProfessorID: data.ProfessorID,
            FirstName: data.FirstName,
            LastName: data.LastName,
            DateOfBirth: data.DateOfBirth,
            Gender: data.Gender,
            Email: data.Email,
            Phone: data.Phone,
            OfficeLocation: data.OfficeLocation,
            Department: data.Department,
            FacultyCollege: data.FacultyCollege,
            AcademicRankPosition: data.AcademicRankPosition,
            CoursesTaught: data.CoursesTaught,
            ResearchAreasInterests: data.ResearchAreasInterests,
            EducationBackground: data.EducationBackground,
            request: {
              type: "GET",
              url: `http://localhost:8080/users/GETData/${data.ProfessorID}`,
            },
          })),
        });
      } else {
        res.status(404).json({ message: "No results found" });
      }
    }
  });
};

exports.get_prof_data_id = (req, res) => {
  const professorID = req.params.ProfessorID;
  const query = `
          SELECT
          P.ProfessorID,
          P.FirstName,
          P.LastName,
          P.DateOfBirth,
          P.Gender,
          P.Email,
          P.Phone,
          P.OfficeLocation,
          P.imagesID,
          AD.Department,
          AD.FacultyCollege,
          AD.AcademicRankPosition,
          AD.CoursesTaught AS AcademicCoursesTaught,
          AD.ResearchAreasInterests AS AcademicResearchAreasInterests,
          AD.EducationBackground,
          RP.PublishedPapers,
          RP.ResearchProjects,
          RP.ConferencePresentations,
          RP.Patents,
          TA.CoursesTaught AS TeachingCoursesTaught
        FROM Professors P
        LEFT JOIN AcademicDetails AD ON P.ProfessorID = AD.ProfessorID
        LEFT JOIN ResearchPublications RP ON P.ProfessorID = RP.ProfessorID
        LEFT JOIN TeachingAdvising TA ON P.ProfessorID = TA.ProfessorID
        WHERE P.ProfessorID = '${professorID}'`;

  db.query(query, (err, results, fields) => {
    if (err) {
      res.status(500).json({ error: err });
    } else {
      if (results.length === 0) {
        res.status(404).json({ message: "No results found" });
      } else {
        res.status(200).json({
          Info: results.map((data) => ({
            ProfessorID: data.ProfessorID,
            FirstName: data.FirstName,
            LastName: data.LastName,
            DateOfBirth: data.DateOfBirth,
            Gender: data.Gender,
            Email: data.Email,
            Phone: data.Phone,
            OfficeLocation: data.OfficeLocation,
            Department: data.Department,
            FacultyCollege: data.FacultyCollege,
            AcademicRankPosition: data.AcademicRankPosition,
            CoursesTaught: data.CoursesTaught,
            ResearchAreasInterests: data.ResearchAreasInterests,
            EducationBackground: data.EducationBackground,
            request: {
              type: "GET All Professor ID",
              url: `http://localhost:8080/users/GETData`,
            },
          })),
        });
      }
    }
  });
};




exports.put_prof_info = (req, res) => {
  const query = `
  UPDATE Professors
  SET 
      FirstName = ?,
      LastName = ?,
      DateOfBirth = ?,
      Gender = ?,
      Email = ?,
      Phone = ?,
      OfficeLocation = ?
  WHERE ProfessorID = ?;`;
  const update_value = [
    req.body.NewFirstName,
    req.body.NewLastName,
    req.body.NewDateOfBirth,
    req.body.NewGender,
    req.body.NewEmail,
    req.body.NewPhone,
    req.body.NewOfficeLocation,
    req.params.ProfessorID,
  ];

  db.execute(query, update_value, (err, results, fields) => {
    console.log(req.body);
    if (err) {
      res.status(500).json({
        errors: err,
      });
    } else if (results) {
      res.status(200).json({
        message: "Updated Professor Information Successfully",
      });
    } else {
      res.status(400).json({
        message: "An error occurred while updating",
        request: {
          method: "PUT",
          url: "http://localhost:8080/users/editProfInfo/:ProfessorID",
          format: {
            NewFirstName: "Kuson",
            NewLastName: "Ta",
            NewDateOfBirth: "1990-01-01",
            NewGender: "F",
            NewEmail: "kuson@gmail.com",
            NewPhone: "0123456789",
            NEwOfficeLocation: "Lad Krabang",
          },
        },
      });
    }
  });
};

exports.put_prof_academic = (req, res) => {
  console.log(req.body);
  const query = `
    UPDATE AcademicDetails
    SET 
        Department = ?,
        FacultyCollege = ?,
        AcademicRankPosition = ?,
        CoursesTaught = ?,
        ResearchAreasInterests = ?,
        EducationBackground = ?
    WHERE ProfessorID = ?;`;

  const update_value = [
    req.body.NewDepartment,
    req.body.NewFacultyCollege,
    req.body.NewAcademicRankPosition,
    req.body.NewCoursesTaught,
    req.body.NewResearchAreasInterests,
    req.body.NewEducationBackground,
    req.params.ProfessorID,
  ];

  db.execute(query, update_value, (err, results, fields) => {
    console.log(req.body);
    console.log(req.params.professorID);
    if (err) {
      res.status(500).json({
        errors: err,
      });
    } else if (results) {
      res.status(200).json({
        message: "Updated Professor Academic Successfully",
      });
    } else {
      res.status(400).json({
        message: "An error occurred while updating",
        request: {
          method: "PUT",
          url: "http://localhost:8080/users/editProfAcademic/:ProfessorID",
          format: {
            NewDepartment: "IOT",
            NewFacultyCollege: "Engineering",
            NewAcademicRankPosition: "Professor",
            NewCoursesTaught: "Physics",
            NewResearchAreasInterests: "Atomic Bomb",
            NewEducationBackground: "Ph.D. in Physics, ABC University, 2008",
          },
        },
      });
    }
  });
};

exports.put_prof_research = (req,res)=>{
  const query = `UPDATE ResearchPublications SET PublishedPapers = ? , ResearchProjects = ? , ConferencePresentations = ?, Patents = ? WHERE ProfessorID = ?`
  update_value=[
    req.body.NewPublishedPapers,
    req.body.NewResearchProjects,
    req.body.NewConferencePresentations,
    req.body.NewPatents,
    req.params.ProfessorID
  ]
  db.execute(query,update_value,(err,results)=>{
    if(err) {
      res.status(500).json({
          error :err,
          request : {
              method : 'PATCH',
              url : 'http://localhost:8080/users/PATCHResearch',
              format :{
                
              }
          }
      });
    }
    else{
        res.status(200).json({
            message : 'Update from ResearchPublications success',
            results : results
        })
    }
  });
};

exports.put_prof_teaching = (req,res)=>{
  const query = `UPDATE TeachingAdvising SET CoursesTaught = ? WHERE ProfessorID = ?`
  update_value = [
    req.body.NewCoursesTaught,
    req.params.ProfessorID
  ]
  db.execute(query,update_value,(err,results)=>{
    if(err) {
      res.status(500).json({
          error :err,
          request : {
              method : 'PATCH',
              url : 'http://localhost:8080/users/PATCHTeaching',
              format :{
                
              }
          }
      });
    }
    else{
        res.status(200).json({
            message : 'Update from teachingadvising success',
            results : results
        })
    }
  });
};



exports.delete_prof_research=(req,res)=>{
  const query =`DELETE FROM ResearchPublications WHERE ProfessorID = ?`
  id = [req.params.ProfessorID]

  db.execute(query,id,(err,results)=>{
    if(err) {
      res.status(500).json({
          error :err,
          request : {
              method : 'DELETE',
              url : 'http://localhost:8080/users/DELETEResearch',
              format :{
                
              }
          }
      });
    }
    else{
        res.status(200).json({
            message : 'Delete from ResearchPublications success',
            results : results
        })
    }
  });
};

exports.delete_prof_teaching=(req,res)=>{
  const query =`DELETE FROM TeachingAdvising WHERE ProfessorID = ?`
  id = [req.params.ProfessorID]

  db.execute(query,id,(err,results)=>{
    if(err) {
      res.status(500).json({
          error :err,
          request : {
              method : 'DELETE',
              url : 'http://localhost:8080/users/DELETETeaching',
              format :{
                
              }
          }
      });
    }
    else{
        res.status(200).json({
            message : 'Delete from Teaching advising success',
            results : results
        })
    }
  });
};

exports.delete_prof_academic = (req, res) => {
  const query = `DELETE FROM AcademicDetails WHERE ProfessorID = ?`;
  id = [req.params.ProfessorID];

  db.execute(query, id, (err, results) => {
    if (err) {
      res.status(500).json({
        error: err,
        request: {
          method: "DELETE",
          url: "http://localhost:8080/users/DELETEProfAcademic/:ProfessorID",
        },
      });
    } else {
      res.status(200).json({
        message: "Delete from AcademicDetails success",
        results: results,
      });
    }
  });
};
