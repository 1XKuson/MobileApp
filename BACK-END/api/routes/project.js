const express = require("express")
const router = express.Router()
const project_controller = require('../controller/project')

router.get('/GETProject', project_controller.project_get);
router.get('/GETOtherProject', project_controller.other_project_get);
router.get('/GETProject/:ProfessorID', project_controller.project_get_ID);
router.get('/GETOtherProject/:ProfessorID', project_controller.other_project_get_ID);
router.post('/POSTProject', project_controller.project_post);
router.put('/PUTProject', project_controller.project_put);
router.delete('/DELETEProject', project_controller.project_delete);
router.delete('/DELETEOtherProject', project_controller.other_project_delete);

module.exports = router;