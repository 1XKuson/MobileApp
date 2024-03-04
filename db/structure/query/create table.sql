  UPDATE academicdetails
  SET 
      Department = @firstName,
      LastName = @lastName,
      DateOfBirth = @dateOfBirth,
      Gender = @gender,
      Email = @email,
      Phone = @phone,
      OfficeLocation = @officeLocation
  WHERE ProfessorID = @professorI;
  
  
use professordb;

-- Construct the SQL query to update Academic Details
UPDATE AcademicDetails
SET 
    Department = 'New Department',
    FacultyCollege = 'New Faculty/College',
    AcademicRankPosition = 'New Academic Rank/Position',
    CoursesTaught = 'New Courses Taught',
    ResearchAreasInterests = 'New Research Areas/Interests',
    EducationBackground = 'New Education Background'
WHERE ProfessorID = 'a37ef366-5456-4c11-bb89-99442d3d0ac0';

