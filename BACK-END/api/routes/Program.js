const express = require('express');
const router = express.Router();
const Program  = require('../controller/Program');

router.get("/GET",Program.get_program);

router.get("/GET_ProgramID_ProgramName",Program.get_programid_Programname)

module.exports = router
 