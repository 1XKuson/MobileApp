const express = require("express")
const router = express.Router()
const book_controller = require('../controller/book')

router.get("/GETBook",book_controller.book_get_id);
router.get("/GETBook/:ProfessorID",book_controller.book_get_byid);
router.get("/GETeachBook",book_controller.book_get_eachbook);
router.get("/GETeachBook/:ProfessorID/:BookID",book_controller.book_get_eachbook_byid);
router.post("/POSTBook",book_controller.book_post);
router.put("/PUTBook",book_controller.book_put);
router.delete("/DELETEBook",book_controller.book_delete);

module.exports = router