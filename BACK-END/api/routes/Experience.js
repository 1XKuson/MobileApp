const express = require('express');
const router = express.Router();
const experienceController = require('../controller/Experience');

router.get('/getdataby_profID',experienceController.getdataby_profID);

router.get('/getdataby_profID/:ProfessorID',experienceController.getdataby_profID_byID);

router.get('/getdataby_profID_expID',experienceController.getdataby_profID_expID);

router.post('/insert_to_experience',experienceController.postdata_insert);

router.put('/edit_experience',experienceController.insert_experience);

router.delete('/delete_experience',experienceController.delete_experience);

module.exports = router
 