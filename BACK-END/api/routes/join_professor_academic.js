const express = require('express');
const router = express.Router();
const professor_academic_controller = require('../controller/join_professor_academic');

router.get('/professor_academic/:ProfessorID',professor_academic_controller.getdata_academic_professor);

module.exports = router