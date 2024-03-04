const express = require('express');
const fs = require('fs')
const router = express.Router();
const image =require("../controller/Image") 

router.get('/read', image.readimage);
router.get('/read/:ProfessorID', image.readimage_byID);
router.post('/upload', image.uploadimage);
router.put("/update", image.updateimage);
router.delete('/delete', image.deleteimage);

module.exports = router;