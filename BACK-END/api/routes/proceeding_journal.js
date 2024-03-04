const express = require("express")
const router = express.Router()
const proceeding_controller = require('../controller/proceeding_journal')

router.get("/GETProceeding",proceeding_controller.proceeding_get);
router.get("/GETJournal",proceeding_controller.journal_get);
router.get("/GETProceeding/:ProfessorID",proceeding_controller.proceeding_get_byID);
router.get("/GETJournal/:ProfessorID",proceeding_controller.journal_get_byID);
router.post("/POSTProceeding",proceeding_controller.proceeding_post);
router.put("/PUTProceeding",proceeding_controller.proceeding_put);
router.delete("/DELETEProceeding",proceeding_controller.proceeding_delete);
router.delete("/DELETEJournal",proceeding_controller.journal_delete);


module.exports = router;
