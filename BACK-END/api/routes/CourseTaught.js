const express = require('express');
const router = express.Router();
const CoursesTaughtController = require('../controller/CourseTaught.js');

router.get('/getdataby_profID',CoursesTaughtController.getdataby_profID);

router.get('/getdataby_profID/:ProfessorID',CoursesTaughtController.getdataby_profID_byID);

router.get('/getdataby_profID_courseID',CoursesTaughtController.getdataby_profID_courseID);

router.post('/insert_to_coursestaught',CoursesTaughtController.postdata_insert);

router.put('/edit_coursestaught',CoursesTaughtController.update_data);

router.delete('/delete_coursestaught',CoursesTaughtController.delete_data);

module.exports = router;