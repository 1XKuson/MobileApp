const express = require('express');
const router = express.Router();
const TrainingExpController = require('../controller/TrainingExperience');

router.get('/getdataby_profID',TrainingExpController.getdataby_profID);

router.get('/getdataby_profID/:ProfessorID',TrainingExpController.getdataby_profID_byID);

router.get('/getdataby_profID_trainingexpID',TrainingExpController.getdataby_profID_trainExpID);

router.post('/insert_to_traningexperience',TrainingExpController.postdata_insert);

router.put('/edit_trainingexperience',TrainingExpController.edit_data);

router.delete('/delete_trainingexperience',TrainingExpController.delete_data);

module.exports = router
