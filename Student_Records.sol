// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Features;
// Add Student (name, age, matricNo, Grades)
// Remove Student Details by Id
// Update Student Grades
// Retrieve Student Details
// Get total numbers of Students

contract StudentRecord {
    struct Student {
        string name;
        uint8 age;
        string matricNo;
        Grade[] grades;
    }
    struct Grade {
        int grade;
        string subjects;
    }
    uint256 totalNumberOfStudents;

    Grade[] public grades;
    mapping(string => Student) public student;

    function addStudent (string memory _name, uint8 _age, string memory _matricNo) external {
        Student storage newStudent = student[_name];
        newStudent.name = _name;
        newStudent.age = _age;
        newStudent.matricNo = _matricNo;

        totalNumberOfStudents += 1;
    }
    function removeStudent(string memory _name) external {
        delete student[_name];

        totalNumberOfStudents -= 1;
    }
    function updateStudentGrades(string memory _name, int _grade, string memory _subject) external {
        Grade memory newGrade = Grade(_grade, _subject);

        Student storage studentRecord = student[_name];
        studentRecord.grades.push(newGrade);
    }

    function viewStudentGrades(string memory _name) external view returns (Grade[]memory) {
        return student[_name].grades;
    }

    function getTotalNumberOfStudent() external view returns (uint256) {
        return totalNumberOfStudents;
    }
}