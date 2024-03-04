const express = require('express');
const router = express.Router();
const AcademicContoller = require('../controller/Academic');

router.get('/getdataby_profID',AcademicContoller.getdataby_profID);

router.get('/getdataby_profID/:ProfessorID',AcademicContoller.getdataby_profID_byID);

router.get('/getdataby_profID_departmentID',AcademicContoller.getdataby_profID_departmentID);

router.get('/getdataby_profID_programID',AcademicContoller.getdataby_profID_programID);

router.get('/getdataby_departmentID_programID',AcademicContoller.getdatby_departmentID_programID);

router.get('/getdataby_profID/:ProfessorID',AcademicContoller.getdataby_profID_byID);

router.get('/getdataby_profID_departmentID_programID/:ProfessorID/:DepartmentID/:ProgramID',AcademicContoller.getdataby_profID_departmentID_programID);

router.post('/insert_to_academic',AcademicContoller.postinsert_data);

router.put('/edit_academic',AcademicContoller.edit_data);

router.delete('/delete_academic',AcademicContoller.delete_data);


module.exports = router