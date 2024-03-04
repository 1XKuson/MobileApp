const express = require('express');
const imgur = require('imgur');
const fs = require('fs')
const fileUpload = require('express-fileupload');
// const methodOverride = require('method-override');
const db = require("../dbconnection");
const app = express();

app.use(fileUpload());
app.use(express.urlencoded({ extended: true }))
app.use(express.json());


const uploadimage = (req,res)=>{

    if (!req.files && !req.body.ProfessorID) {
        return res.status(400).send('No files were uploaded.')        
      }

      const ProfessorID = req.body.ProfessorID; 
      let sampleFile = req.files.sampleFile
      let uploadPath = __dirname + "/uploads/" + sampleFile.name
    
      sampleFile.mv(uploadPath, function (err) {
        if (err) {
          return res.status(500).send(err)
        }
    
        imgur.uploadFile(uploadPath).then((urlObject) => {
          fs.unlinkSync(uploadPath)
          const URL = urlObject.data.link;
          
          // Insert the urlObject into the MySQL database
          db.query('INSERT INTO images (url,ProfessorID) VALUES (?,?)', [URL,ProfessorID], (err, _result,_fields) => {
            if (err) {
              console.log('Error inserting urlObject into database:', err);
              return res.status(500).send(err);
            }
          });
          res.status(200).json(URL)
        })
        
      })
};

const readimage = async(_req, res) => {
	db.query('SELECT * FROM images', (err, results,_fields) => {
	  if (err) {
		console.log('Error retrieving images from database:', err);
		return res.status(500).send(err);
	  }
	  res.status(200).json(results);
	});
};

const updateimage = async(req, res) => {
	try {
    if (!req.files && !req.body.professorID) {
      return res.status(400).send("No files were uploaded.");
    }

    const professorID = req.body.ProfessorID;
    let Newfile = req.files.Newfile;
    let uploadPath = __dirname + "/uploads/" + Newfile.name;

    Newfile.mv(uploadPath, function (err) {
      if (err) {
        return res.status(500).send(err);
      }

      imgur.uploadFile(uploadPath).then((urlObject) => {
        fs.unlinkSync(uploadPath);
        const Newurl = urlObject.data.link;

        // Insert the urlObject into the MySQL database
        db.query(
          "UPDATE images SET url = ? WHERE ProfessorID = ? ",
          [Newurl, professorID],
          (err, result, fields) => {
            if (err) {
              console.log("Error inserting urlObject into database:", err);
              return res.status(500).send(err);
            }
          }
        );
        res.status(200).json({ message: "Updated successful!!" });
      });
    });
  } catch (err) {
    return res.status(500).send();
  }
};

const deleteimage = async(req, res) => {
  const value = [req.body.ProfessorID, req.body.imageID]
  try {
    db.query(
      "DELETE FROM images WHERE ProfessorID = ? AND ID = ?",
      value,
      (err, results, _fields) => {
        if (err) {
          console.log("Error deleting image from database:", err);
          return res.status(500).send(err);
        }
        if (results.affectedRows >0) {
          return res.status(404).send({
            message: "NO id found",
          });
        }
        res.status(200).json({ message: "Delete successfully" });
      }
    );
  } catch (err) {
    return res.status(500).send();
  }
};

const readimage_byID = async(req, res) => {
  const professorID = req.params.ProfessorID;
	db.query(`SELECT * FROM images WHERE ProfessorID = '${professorID}'`, (err, results,_fields) => {
	  if (err) {
		console.log('Error retrieving images from database:', err);
		return res.status(500).send(err);
	  }
	  res.status(200).json(results);
	});
};

module.exports ={
  uploadimage,
  readimage,
  updateimage,
  deleteimage,
  readimage_byID
  
};
