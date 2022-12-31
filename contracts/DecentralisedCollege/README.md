DESCRIPTION

It is becoming really difficult to track down illegal colleges. Many students' careers are spoiled as they enrol in them.

 

Background of the problem statement:

In many parts of India, illegal colleges are run, which are not affiliated to any university. Many students enroll in these colleges without knowing that and in turn they end up having no jobs or colleges get shut down after some time, which ruins their career.

An immutable solution like Blockchain is needed where all the colleges under a university are tracked as blockchain to ensure that no one can modify any old record. That same solution should also allow banning any college to enroll any new student in case there are any complaints against that college. Later remove the ban once the college addresses all the complaints.

 

Features of the application:

     1. Add new college to Blockchain ledger:

This function is used by the university admin to add a new college. This function can be called by admin only.

 Input parameters:

param {string} collegeName: The name of the college
param {address} add: The unique Ethereum address of the college
param {string} regNo: College registration number
   

     2. View college details:

This function is used to view college details.

Input Parameters:

param {address} add: The unique Ethereum address of the college
Output parameters:

collegeName: The name of the college
collegeRegNo: The registration number of the college
NoOfStudents: Number of students in that college
 

     3. Block college to add any new student:

This function is used by the university admin to block colleges from adding any new students.

Input parameters:

param {address} add: The unique Ethereum address of the college
 

     4. UnBlock college to add new students:

This function is used by the university admin to unblock colleges from adding any new students.

Input parameters:

param {address} add: The unique Ethereum address of the college
 

     5. Add a new student to the college:

This function will add a student to the college.

Input parameters:

param {address} add: The unique address of the college
param {string} sName: The name of the student
param {uint} phoneNo: The phone number of the student
param {string} courseName: The name of the course
 

     6. View student details:

           This function is used to view student details.

Input parameters:

param {string} sName: The name of the student
Output parameters:

Name: The name of the student
PhoneNo: The phone number of the student
Course Enrolled: Course Enrolled by the student
 

     7. Change student course:

This function is used by college admin to change a student's course.

Input parameters:

param {address} add: The unique address of the college
param {string} sName: The name of the student
param {string} newCourse: The new course name
