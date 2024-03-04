const express = require('express');
const cors = require('cors');
const app = express();
const bodyParser = require('body-parser');
const db = require('./api/dbconnection');
const path = require('path');
const fileUpload = require('express-fileupload');


//set image loader
app.use(fileUpload());
app.use(express.urlencoded({ extended: true }))
app.use(express.json())
//app.use(express.json({ limit: '50mb' }));



//set ejs
app.set("views",path.join(__dirname,"views"))
app.set('view engine', 'ejs');
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static(__dirname + '/public'));

// parse application/json
app.use(cors());
app.use(bodyParser.json());



//Route handlers
const UsersRoute = require('./api/routes/Users');
const EducationBackground = require('./api/routes/EducationBackground');
const ResearchInterestTopic = require('./api/routes/ResearchInterestTopic');
const CourseTaught = require('./api/routes/CourseTaught');
const StudentAdvisor = require('./api/routes/StudentAdvisor');
const Experience = require('./api/routes/Experience');
const TrainingExperience = require('./api/routes/TrainingExperience');
const Academic = require('./api/routes/Academic');
const accountsRoute = require('./api/routes/login')
const ProfessorRoute = require('./api/routes/professor')
const ProceedingsRoute = require('./api/routes/proceeding_journal');
const BookRoute = require('./api/routes/book');
const ProjectRoute = require('./api/routes/project');
const jointtable_for_cv = require('./api/routes/join_professor_academic');

const image = require("./api/routes/image");


const DepartmentRoute = require('./api/routes/Department');
const ProgramRoute = require('./api/routes/Program');


const FilterRoute=require('./filter/route_filter');
const pdfRoute = require('./get_cv/get_cv');

app.use('/users',UsersRoute);
app.use('/accounts',accountsRoute);
app.use('/EduBackground',EducationBackground);
app.use('/ResearchInterestTopic',ResearchInterestTopic);
app.use('/CourseTaught',CourseTaught);
app.use('/StudentAdvisory',StudentAdvisor);
app.use('/Experience',Experience);
app.use('/TrainingExp',TrainingExperience);
app.use('/Academic',Academic);
app.use('/professor',ProfessorRoute);
app.use('/proceeding',ProceedingsRoute);
app.use('/book',BookRoute);
app.use('/project',ProjectRoute);
app.use('/jointtablecv',jointtable_for_cv);

app.use('/image',image);


app.use('/department',DepartmentRoute);
app.use('/program',ProgramRoute);



app.use('/users',UsersRoute);
app.use('/accounts',accountsRoute);
app.use('/filters',FilterRoute);
app.use('/pdf',pdfRoute);


module.exports = app;