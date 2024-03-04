const express = require('express');
const router = express.Router();
const ResearchInterestTopicController = require('../controller/ResearchInterestTopic.js');

router.get('/getdataby_profID',ResearchInterestTopicController.getdataby_profID);

router.get('/getdataby_profID/:ProfessorID',ResearchInterestTopicController.getdataby_profID_byID);

router.get('/getdataby_profID_interestID',ResearchInterestTopicController.getdataby_profID_interestID);

router.post('/insert_to_researchinteresttopic',ResearchInterestTopicController.postdata_insert);

router.put('/edit_researchinteresttopic',ResearchInterestTopicController.update_data);

router.delete('/delete_researchinteresttopic',ResearchInterestTopicController.delete_data);


module.exports = router;