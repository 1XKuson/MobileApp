const express = require("express");
const router = express.Router();
const db = require("../dbconnection");

const checkAuth = require("../middleware/checkAuth.js");
const checkPermissions = require("../middleware/Permissions.js");
//import controllers 
const UserController = require("../controller/Users.js");

//test Axios
// router.get("/GETData", UserController.get_prof_data);

router.get("/GETData/:ProfessorID",checkAuth,checkPermissions(["admin","user","professor"]) ,UserController.get_prof_data_id);
router.get("/GETData",checkAuth,checkPermissions(["admin","user","professor"]), UserController.get_prof_data);

router.post('/POSTProfInfo/:ProfessorID',checkAuth, checkPermissions(["admin","professor"]),UserController.post_prof_info);
router.post('/POSTProfAcademic/:ProfessorID',checkAuth, checkPermissions(["admin","professor"]), UserController.post_prof_academic);
router.post('/POSTResearch/:ProfessorID',checkAuth, checkPermissions(["admin","professor"]),UserController.post_prof_research);
router.post('/POSTTeaching/:ProfessorID',checkAuth, checkPermissions(["admin","professor"]),UserController.post_prof_teaching);

router.put('/editProfInfo/:ProfessorID',checkAuth, checkPermissions(["admin","professor"]), UserController.put_prof_info);
router.put('/editProfAcademic/:ProfessorID',checkAuth, checkPermissions(["admin","professor"]), UserController.put_prof_academic);
router.put('/editResearch/:ProfessorID',checkAuth, checkPermissions(["admin","professor"]),UserController.put_prof_research);
router.put('/editTeaching/:ProfessorID',checkAuth, checkPermissions(["admin","professor"]),UserController.put_prof_teaching);

router.delete('/DELETEResearch/:ProfessorID',checkAuth, checkPermissions(["admin","professor"]),UserController.delete_prof_research);
router.delete('/DELETEProfAcademic/:ProfessorID',checkAuth, checkPermissions(["admin","professor"]), UserController.delete_prof_academic);
router.delete('/DELETETeaching/:ProfessorID',checkAuth, checkPermissions(["admin","professor"]),UserController.delete_prof_teaching);
//router.delete('/DELETEProfInfo/:ProfessorID',UserController.delete_prof_info);

module.exports = router;
