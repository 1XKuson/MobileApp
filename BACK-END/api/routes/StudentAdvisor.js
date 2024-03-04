const express = require('express');
const router = express.Router();
const StudentAdvisorController = require('../controller/StudentAdvisor');

router.get('/getdataby_profID',StudentAdvisorController.getdataby_profID);

router.get('/getdataby_profID/:ProfessorID',StudentAdvisorController.getdataby_profID_byID);

router.post('/insert_to_studentadvisor',StudentAdvisorController.postdata_insert);

router.put('/edit_studentadvisory',StudentAdvisorController.update_data);

router.delete('/delete_studentadvisor',StudentAdvisorController.delete_data);

module.exports = router