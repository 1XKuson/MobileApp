const express = require('express');
const router = express.Router();
const puppeteer = require('puppeteer'); 
const base64Img = require('base64-img');
const axios = require('axios');

const { response } = require('../app');
const fs = require('fs');
const path = require('path');
const fetch = require('node-fetch');



router.get('/',(req,res)=>{
    let name_contact = []; 
    let program = [];
    let edubackground = [];
    let proceeding = [];
    let journal = [];
    let project = [];
    let otherProject = [];
    let interestTopic = [];
    let image = [];
    const ID = "2e76190e-8eb5-49c1-b47f-b66f6a33d2e6";
    //const ID = req.params.ProfessorID;

    async function fetchData() {
        try {
            //part1

            const response1 = await axios.get(`http://localhost:8080/jointtablecv/professor_academic/${ID}`);
            name_contact = response1.data.results;

            //--------------------------------------------------
            //part2

            const response2 = await axios.get(`http://localhost:8080/Academic/getdataby_profID/${ID}`);
            program = response2.data.results;
        
            //--------------------------------------------------
            //part3
            
            const response3 = await axios.get(`http://localhost:8080/EduBackground/getdataby_profID/${ID}`);
            edubackground = response3.data.results;

            //--------------------------------------------------
            //part4

            const response4 = await axios.get(`http://localhost:8080/proceeding/GETProceeding/${ID}`);
            proceeding = response4.data.results;

            const response5 = await axios.get(`http://localhost:8080/proceeding/GETJournal/${ID}`);
            journal = response5.data.results;

            const response6 = await axios.get(`http://localhost:8080/project/GETProject/${ID}`);
            project = response6.data.results;

            const response7 = await axios.get(`http://localhost:8080/project/GETOtherProject/${ID}`);
            otherProject = response7.data.results;

            //--------------------------------------------------
            //part5

            const response8 = await axios.get(`http://localhost:8080/ResearchInterestTopic/getdataby_profID/${ID}`);
            interestTopic = response8.data.results;

            //--------------------------------------------------

            const imagedata = await axios.get(`http://localhost:8080/image/read/${ID}`)
            image = imagedata.data[0].url;


        } catch (err) {
            console.error('Error fetching data:', err);
        }
    }

    

    fetchData().then(()=>{
        const Head = [
            name_contact[0].AcademicRankPosition,
            name_contact[0].FirstNameTH,
            name_contact[0].LastNameTH,
            name_contact[0].AcademicRankPositionEng, 
            name_contact[0].FirstNameEng,
            name_contact[0].LastNameEng,
            program[0].ProgramName,
            name_contact[0].Phone,
            name_contact[0].Email,
            name_contact[0].OfficeLocation
        ]
        //
        
        const imagePaths = [
            path.join(__dirname,'../views/public','phone-call.png'), 
            path.join(__dirname,'../views/public','email.png'),
            path.join(__dirname,'../views/public','building-silhouette.png')
        ];
        
            
        // Convert each image to base64
        const base64Images = imagePaths.map((imagePath) => base64Img.base64Sync(imagePath));

        res.render('cv.ejs', { base64Images,Head,edubackground,journal,proceeding,project,otherProject,interestTopic,image});
        
        

        // Render the EJS template with the base64-encoded images
        
    }).catch(err => {
        console.error(err)
    })
    
})

router.post('/capture',async(req,res)=>{
        try {
            const { htmlContent } = req.body;

            if (!htmlContent) {
                return res.status(400).json({ error: 'Missing HTML content in the request body.' });
            }

            const browser = await puppeteer.launch();
            const page = await browser.newPage();

            // Set the HTML content of the page

            
            await page.setContent(htmlContent, { waitUntil: 'domcontentloaded' });

            await page.evaluate(() => {
                const images = document.querySelectorAll('img');
                const imagePromises = Array.from(images).map((img) => {
                    if (img.complete) return; // Skip if the image is already loaded
                    return new Promise((resolve) => {
                        img.onload = img.onerror = resolve;
                    });
                });
                return Promise.all(imagePromises);
            });

            // Generate PDF from the page content
            const pdfBuffer = await page.pdf({format:'A4',printBackground: true,preferCSSPageSize: true});

            // Close the browser
            await browser.close();

            // Send the PDF as the response
            res.setHeader('Content-Type', 'application/pdf');
            res.send(pdfBuffer);
        } catch (error) {
            console.error('Error generating PDF:', error);
            res.status(500).json({ error: 'Internal server error' });
        }
})



module.exports = router