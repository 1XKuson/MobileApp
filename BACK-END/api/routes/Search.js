const express = require("express")
const router = express.Router()
const db = require('../api/dbconnection.js')

const Search_Controller = require("../controller/Searching.js")

router.get('/',Search_Controller.show_example_page_filter);

router.post('/search', Search_Controller.Recommend_searching);

module.exports = router