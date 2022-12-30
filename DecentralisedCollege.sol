// SPDX-License-Identifier: GPL-3.0
pragma solidity >0.5.0;
contract DecentralisedCollege{

    address University;
    constructor (){
        University=msg.sender;
    }
    modifier OnlyUniversity(){
        require(msg.sender==University,"Unauthorised operation");
        _;
    }

    modifier OnlyCollege(){
        require(College[msg.sender].collegeAddress==msg.sender,"Unauthorised operation");
        _;
    }

    struct Collegedetails{
        string collegeName;
        address collegeAddress;
        uint32 registerNumber;
        uint numOfStudents;
        bool addStudentFunction;
    }

    struct Studentdetails{
        string studentName;
        uint UIN;
        address studentCollegeAddress;
        uint phoneNo;
        string course;
        }

    mapping(address=> Collegedetails)College;
    mapping(uint => Studentdetails)Student;

    function addNewCollege(string memory _collegeName,address _collegeAddress,uint32 _registerNumber) public OnlyUniversity {
        College[_collegeAddress]=Collegedetails(_collegeName,_collegeAddress,_registerNumber,0,true);
    }

    function addNewStudent(string memory _studentName,uint _UIN,uint _phoneNo,string memory _course) public OnlyCollege {
        require(College[msg.sender].addStudentFunction=true,"You are blocked from adding students");
        Student[_UIN]=Studentdetails(_studentName,_UIN,msg.sender,_phoneNo,_course);
        College[msg.sender].numOfStudents++;
    }

    function blockCollege(address _collegeAddress) public OnlyUniversity{
        College[_collegeAddress].addStudentFunction=false;
    }

     function unBlockCollege(address _collegeAddress) public OnlyUniversity{
        College[_collegeAddress].addStudentFunction=true;
    }

    function changeCourse(uint _UIN,string memory _course) public OnlyCollege{
        Student[_UIN].course= _course;
    }

    function viewCollegeDetails(address _collegeAddress) public view OnlyUniversity returns( string memory,address,uint32,uint,bool){
        return (College[_collegeAddress].collegeName,
               College[_collegeAddress].collegeAddress,
               College[_collegeAddress].registerNumber,
               College[_collegeAddress].numOfStudents,
               College[_collegeAddress].addStudentFunction);
    }

    function viewStudentDetails(uint _UIN) public view returns(string memory,uint,address,uint,string memory){
        require(Student[_UIN].studentCollegeAddress==msg.sender,"Unauthorised Operation");
        return (Student[_UIN].studentName,
                Student[_UIN].UIN,
                Student[_UIN].studentCollegeAddress,
                Student[_UIN].phoneNo,
                Student[_UIN].course);
    }

}
