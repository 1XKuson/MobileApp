const express = require('express');
const router = express.Router();
const Department = require('../controller/Department');

router.get("/GET",Department.get_department);

module.exports = router
 