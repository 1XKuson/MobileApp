const express = require("express")
const router = express.Router()
const prof_controller = require('../controller/professor.js')

router.get("/GETProf/:ProfessorID",prof_controller.prof_get_id);
router.get("/GETProf",prof_controller.prof_get_all);
router.post("/POSTProf",prof_controller.prof_post);
router.put("/PUTProf",prof_controller.prof_put);

router.delete("/DELETEProf",prof_controller.prof_delete);

module.exports = router;
