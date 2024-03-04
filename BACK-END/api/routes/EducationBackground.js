const express = require('express');
const router = express.Router();
const Educontroller = require('../controller/EducationBackground.js');

router.get('/getdataby_profID',Educontroller.getdataBy_profID);

router.get('/getdataby_profID/:ProfessorID',Educontroller.getdataBy_profID_byID);

router.get('/getdataby_profID_eduID',Educontroller.getdataBy_profId_eduID);

router.get('/getdataby_profID/:ProfessorID',Educontroller.getdataBy_profID_byID);

router.post('/insert_to_educationbackground',Educontroller.postinsert_data);

router.put('/edit_educationbackground',Educontroller.edit_data);

router.delete('/delete_educationbackground',Educontroller.delete_data);

module.exports =router