//NUST student records

import ballerina/graphql;
import ballerina/http;


http:Listener httpListener = new(1677);

service graphql:Service /graphql on new graphql:Listener(httpListener) {

    resource function get studentdetails(int content) returns Student {

        return mankind[content];
    }
}

public type Student record {
    string Fullname;
    string DateofBirth;
    string Gender;
    UniversityDetails universitydetails;
};
public type UniversityDetails record {
    string Last_University_Programme_Enrolled;
    string Year_of_Last_University_Programme_Enrolled;
    string Name_of_Last_Tertiary_Institute;
};

Student student1 = {
    Fullname: "Fifi Shaki Peaches",
    DateofBirth: "07 05 1992",
    Gender:"Female",
    universitydetails: {
        Last_University_Programme_Enrolled: "Bachelor of Computer Science Software Development",
        Year_of_Last_University_Programme_Enrolled: "2019",
        Name_of_Last_Tertiary_Institute: "Namibia University of Science and Technology"
    }
};
Student student2 = {
    Fullname: "Tweedy Plum Lemon",
    DateofBirth: "04 03 1990",
    Gender:"Female",
    universitydetails: {
        Last_University_Programme_Enrolled: "Bachelor of Computer Science Network Administration",
        Year_of_Last_University_Programme_Enrolled: "2020",
        Name_of_Last_Tertiary_Institute: "Namibia University of Science and Technology"
    }
};
Student student3 = {
    Fullname: "Jared Daisy",
    DateofBirth: "12 06 1995",
    Gender: "Male",
    universitydetails: {
        Last_University_Programme_Enrolled: "Bachelor of Computer Science Informatics",
        Year_of_Last_University_Programme_Enrolled: "2020",
        Name_of_Last_Tertiary_Institute: "Namibia University of Science and Technology"
    }
};
Student[] mankind = [student1, student2, student3];



















