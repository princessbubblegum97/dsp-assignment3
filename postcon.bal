
import ballerina/kafka;
import ballerina/log;
import ballerina/io;



//Kafka Consumer Client 

kafka:ConsumerConfiguration consumerConfigs = {
    bootstrapServers: "localhost:7078",
    groupId: "group-id",

    topics: ["Postgrad"],
    pollingIntervalInMillis: 1000,

    keyDeserializerType: kafka:DES_INT,

    valueDeserializerType: kafka:DES_STRING,

    autoCommit: false
};

listener kafka:Consumer consumer = new (consumerConfigs);
service kafkaService on consumer {
    resource function onMessage(kafka:Consumer kafkaConsumer,
            kafka:ConsumerRecord[] records) {

        foreach var kafkaRecord in records {
            processKafkaRecord(kafkaRecord);
        }

        var commitResult = kafkaConsumer->commit();
        if (commitResult is error) {
            log:printError("You might want to check that connection " +
                "The consumer offsets figure is", commitResult);
        }
    }
}

function processKafkaRecord(kafka:ConsumerRecord kafkaRecord) {
    anydata value = kafkaRecord.value;
    anydata key = kafkaRecord.key;
    if (value is string) {

        if (key is int) {

            log:printInfo("NUST Postgraduate Topic: " + kafkaRecord.topic);
            log:printInfo("NUST Postgraduate Partition: " + kafkaRecord.partition.toString());
            log:printInfo("NUST Postgraduate Key: " + key.toString());
            log:printInfo("NUST Postgraduate Value: " + value);
        } else {
            log:printError("Unable to load connection");
        }
    } else {
        log:printError("Still unable to load connection");
    }
}

//

//
function closeRc(io:ReadableCharacterChannel apricot) {
    var result = apricot.close();
    if (result is error) {
        log:printError("Unable to complete request.",
                        err = result);
    }
}

function closeWc(io:WritableCharacterChannel plum) {
    var result = plum.close();
    if (result is error) {
        log:printError("Devil's in the details..",
                        err = result);
    }
}

function write(json content, string path) returns @tainted error? {

io:WritableByteChannel cake = check io:openWritableFile(path);

io:WritableCharacterChannel jam = new (cake, "UTF8");
    var result = jam.writeJson(content);
    closeWc(jam);
    return result;
}

function read(string path) returns @tainted json|error {
io:ReadableByteChannel biscuit = check io:openReadableFile(path);

io:ReadableCharacterChannel lion = new (biscuit, "UTF8");
    var result = lion.readJson();
    closeRc(lion);
    return result;
}
//

public function main() {
io:println("**~~**~~**~~**~~**~~**~~**~~**~~**DSP ASSIGNMENT 3**~~**~~**~~**~~**~~**~~**~~**~~**");

io:println("   ");
io:println("            NUST POSTGRADUATE PROGRAMME PROCESS APPLICATION©  ");
io:println("   ");
io:println("   ");

io:println("The process is as follows: *Application* >> *Proposal* >> *Thesis* >> *Examination*");




io:println("ONLY students, supervisors, Head of Department (HOD), Faculty Internal Examiner (FIE) and Higher Degree Committee (HDC) are permitted to use this system. ");
//At the application stage, a student starts the process by completing and submitting an application form, which is stored in the system. Thereafter, a supervisor based on his/her profile (skills, specialism, interests, workload) can browse the applications and express his/her interests. The HOD then compiles the augmented list (applications and supervisor interests). The applicants whose application received interest will be invited for an interview. Subsequent deliberations among panel members will decide on the acceptance or not of each application and the outcome communicated to the candidate.

//The first milestone for a student who recently enrolled in a postgraduate programme is to successfully present his/her proposal (within the prescribed period). Once the draft of the proposal is ready and approved by the supervisor, the student will upload the proposal to the system. The HOD can then view the proposal and assign FIEs for its evaluation. A proposal that has been sanctioned by all FIEs is ready for submission to HDC. The faculty HDC representative can view the proposal or upload the resolution from HDC after evaluation by the committee. When HDC approves a proposal, the HOD will change the student status with the mention final admission. For proposals that have not been approved by HDC, the submission to HDC sub-process will be repeated until approval.
//A student whose proposal has been approved enters the thesis stage. While the actual research is being conducted, the student will register at the beginning of each semester and submit regular reports attesting to her progress.
//When the (research) work is completed and the draft of the thesis ready (with the approval of the supervisor), the student will upload the thesis to the system. The HOD will then send the thesis to the appointed external examiner(s) and await their assessment. When the examiner assessment is received, he/she will upload it into the system. When the thesis handling is completed, the results are compiled and submitted to HDC for its endorsement. At the end of the process, a successful student's status will change to graduate. For cases with minor changes, they must be effected to the satisfaction of an appointed member of the Faculty. Finally, for cases that require an extended amount of work, the necessary steps should be taken and the thesis resubmitted.
io:println("**~~APPLICATION~~**");
io:println("At the application stage, a student starts the process by completing and submitting an application form, which is stored in the system--just check the muffinsandsunsfolder>>cakefolder>>jam.json file. The applications are converted to a json file. Below is an unanswered application. ");
io:println("");
io:println("");
io:println(" ");
io:println("");
io:println(" ");
io:println("");


io:println("_______________________________________________________________________________________________________");
io:println("|                                                                                                      |");
io:println("|                                  NUST POSTGRADUATE APPLICATION 2021                                  |");
io:println("|                                                                                                      |");
io:println("|                                                                                                      |");
io:println("|                          DEPARTMENT OF COMPUTER SCIENCE AND INFORMATICS                              |");
io:println("|                                                                                                      |");
io:println("|                                                                                                      |");
io:println("| *Instructions: Please fill in the following information using a black or dark blue pen               |");
io:println("|                Please use block letters                                                              |");
io:println("|                                                                                                      |");
io:println("| Fullname __________________________________________________________________________                  |");
io:println("| Date of Birth ______________________________                                                         |");
io:println("| Gender ______________________________                                                                |");
io:println("| Last University Programme Enrolled ___________________________________________________________       |");
io:println("| Year of Last University Programme Enrollment Graduation _______________                              |");
io:println("| Name of Last Tertiary Institute___________________________________________________________________-  |");
io:println("| Which programme(s) would you like to apply for. Please select with a tick [√]                        |");
io:println("|                                                                                                      |");
io:println("|  *~**POSTGRADUATE PROGRAMMES**~*                                                                     |");
io:println("|  Department of Computer Science                                                                      |");
io:println("|                                                                                                      |");
io:println("|Bachelor of Computer Science Honours (with specialisation in Information Security or Digital Forensics|");
io:println("|                                                                                              _       | ");
io:println("|                                                                                             |_|      |");
io:println("|                                                                                                   _  |");
io:println("|Mobile Development, Information Security or Digital Forensics                                     |_| |");
io:println("|                                                                                       _              |");
io:println("|Doctor of Philosophy (PhD) in Computer Science                                        |_|             |");
io:println("|                                                                                              _       |");
io:println("|Postgraduate Certificate in Information & Communication Technology Policy and Regulations    |_|      |");
io:println("|                                                                                              _       |");
io:println("|Postgraduate Certificate in Informatics (Information Systems Audit)                          |_|      |");
io:println("|                                                                                              _       |");
io:println("|Master of Informatics                                                                        |_|      |");
io:println("|                                                                                                      |");
io:println("|                                                                                                      |");
io:println("|In a few sentences (not more than 50 words), why would you like to further your studies?              |");
io:println("|    _____________________________________________________________________________________________     |");
io:println("|    _____________________________________________________________________________________________     |");
io:println("|    _____________________________________________________________________________________________     |");
io:println("|    _____________________________________________________________________________________________     |");
io:println("|    _____________________________________________________________________________________________     |");
io:println("|    _____________________________________________________________________________________________     |");
io:println("|                                                                                                      |");
io:println("|Do you have any special skills? Please feel free to elaborate.                                        |");
io:println("|    _____________________________________________________________________________________________     |");
io:println("|    _____________________________________________________________________________________________     |");
io:println("|    _____________________________________________________________________________________________     |");
io:println("|    _____________________________________________________________________________________________     |");
io:println("|                                                                                                      |");
io:println("|What are your interests?                                                                              |");
io:println("|    _____________________________________________________________________________________________     |");
io:println("|    _____________________________________________________________________________________________     |");
io:println("|    _____________________________________________________________________________________________     |");
io:println("|    _____________________________________________________________________________________________     |");
io:println("|                                                                                                      |");
io:println("|  Thank you for applying to NUST.                                                                     |");
io:println("|______________________________________________________________________________________________________|");












           //
string filePath = "muffinsandsuns/cake/jam.json";
    
    

    json cali = {
        "**NUST POSTGRADUATE APPLICATIONS 2021**": {
            "Department of Computer Science": "Department of Informatics",
            
            "APPLICATION NO.236": {
                "Fullname": "Fifi Shaki Peaches",
                "Date of Birth": "07 05 1992",
                "Gender":"Female",
                "Last University Programme Enrolled" : "Bachelor of Computer Science Software Development",
                "Year of Last University Programme Enrolled":"2019",
                "Name of Last Tertiary Institute":"Namibia University of Science and Technology",
                "Which programme(s) would you like to apply for?":"Mobile Development, Information Security or Digital Forensics",
                "In a few sentences (not more than 50 words), why would you like to further your studies?":"In order to broaden my expertise in the Computing department.",
                "Do you have any special skills? Please feel free to elaborate.":"Website development_using Dreamweaver",
                "What are your interests?":"Web development, System Administration",
                "Thank you for applying to NUST.":""
                
                
            },
            
            //
              "APPLICATION NO.234": {
                "Fullname": "Tweedy Plum Lemon",
                "Date of Birth": "04 03 1990",
                "Gender":"Female",
                "Last University Programme Enrolled" : "Bachelor of Computer Science Network Administration",
                "Year of Last University Programme Enrolled":"2020",
                "Name of Last Tertiary Institute":"Namibia University of Science and Technology",
                "Which programme(s) would you like to apply for?":"Doctor of Philosophy (PhD) in Computer Science ",
                "In a few sentences (not more than 50 words), why would you like to further your studies?":"I want to study to my fullest potential.",
                "Do you have any special skills? Please feel free to elaborate.":"Flutter app development. I can create a variety of aplpications such as mobile games, intranets and music applications",
                "What are your interests?":"Mobile development",
                "Thank you for applying to NUST":"__"
                
                
            },
                "APPLICATION NO.239": {
                "Fullname": "Jared Daisy",
                "Date of Birth": "12 06 1995",
                "Gender":"Male",
                "Last University Programme Enrolled" : "Bachelor of Computer Science Informatics",
                "Year of Last University Programme Enrolled":"2020",
                "Name of Last Tertiary Institute":"Namibia University of Science and Technology",
                "Which programme(s) would you like to apply for?":"Postgraduate Certificate in Information & Communication Technology Policy and Regulations",
                "In a few sentences (not more than 50 words), why would you like to further your studies?":"To acquire skills to improve Namibia's networking industry",
                "Do you have any special skills? Please feel free to elaborate.":"Networking. I have CCNA1 and 2 certificates and can manage, troubleshoot and set up small networks.",
                "What are your interests?":"Computer Networking",
                "Thank you for applying to NUST.":"***"
                
                
            },                
                                      
             
      
                                 
             
                    
              
                   //                 
            
            "Applications compiled by": ["Alexis", "Jojo"]
            
            
            
            
            
            //
        }
    };
    io:println("**Writing Postgraduate content**");

    var wResult = write(cali, filePath);
    if (wResult is error) {
        log:printError("Current issue ", wResult);
    } else {
        io:println("**What you requested is being written**");

        var rResult = read(filePath);
        if (rResult is error) {
            log:printError("**Something's in the details.** ",
                            err = rResult);
        } else {
            io:println(rResult.toJsonString());
        }
        
  
  
  
      
        
        
        io:println("Thereafter, a supervisor based on his/her profile (skills, specialism, interests, workload) can browse the applications and express his/her interests. ");
        log:printInfo("**~Supervisor's Applications Interests~**");
        io:println(" ");
        io:println("I've searched high and low for the perfect NUST candidates and here are my answers.I was highly impressed with Tweedy's interests: Mobile development. I shows she is serious about school and the direction she is headed. In addition, Jared's reason for applying was inspirational since he aspires to improve Namibia's networking industry. Finally, Fifi web development ability is impressive, since not everyone who acquires a degree is able to demonstrate their skills. ");
        
        io:println("The HOD then compiles the augmented list (applications and supervisor interests). The applicants whose application received interest will be invited for an interview. Subsequent deliberations among panel members will decide on the acceptance or not of each application and the outcome communicated to the candidate.");
        
        
        log:printInfo("**~HOD Compilation of Applications and Supervisor Interests~**");
        io:println("_____________________________________________________________________________________________________");
        io:println("|                    |                                                   |                           |");
        io:println("|  Application Number|  Supervisor Interests                             |  Interview                |");
        io:println("|____________________|___________________________________________________|___________________________|");
        io:println("| 236                |  Web development skills                           |  Yes                      |");
        io:println("|____________________|___________________________________________________|___________________________|");
        io:println("| 234                | Interests: Mobile development                     |  Yes                      |");
        io:println("|____________________|___________________________________________________|___________________________|");
        io:println("| 239                |Aspiration to improve Namibia's networking industry|  Yes                      |");
        io:println("|____________________|___________________________________________________|___________________________|");
        
        
       //
       
    int z = 4;
    int s= 3;
    if (z < s) {
        io:println("Application received NO interest=> Student NOT invited for interview.");
    } else {
        io:println("Application received interest=> Student will be invited for an interview.");
    }
       //
    
    
    int r = 5;
    int n= 3;
    if (r < n) {
        io:println("Hooray! You're a chosen one. NUST will contact you shortly for an interview");
    } else {
        io:println("Unfortunately  your application was unsuccessful. Maybe try again next year.");
    }
    
    //
    
            io:println("The first milestone for a student who recently enrolled in a postgraduate programme is to successfully present his/her proposal (within the prescribed period). Once the draft of the proposal is ready and approved by the supervisor, the student will upload the proposal to the system. The HOD can then view the proposal and assign FIEs for its evaluation. A proposal that has been sanctioned by all FIEs is ready for submission to HDC. The faculty HDC representative can view the proposal or upload the resolution from HDC after evaluation by the committee. When HDC approves a proposal, the HOD will change the student status with the mention final admission. For proposals that have not been approved by HDC, the submission to HDC sub-process will be repeated until approval");
            io:println("Fifi's Proposal Draft ");
            io:println(" ");
    
    
    
           io:println("Draft of the proposal is ready and approved by the supervisor  ");
           
           io:println("The student can upload the proposal to the system. Please do this by navigating into the muffinsandsuns folder>>cake folder. Upload your file here.  ");
           io:println("Uploading Fifi'sProposal.pdf to the system........... ");
           io:println(" ");
           io:println("HOD views the proposal and assigns FIEs for its evaluation.");
           io:println("HOD's FIEs for its evaluation.");
           io:println("************************************************************");
           io:println("1- Student did a great job");
           io:println("2- Student did a well done job");
           io:println("3- Student did an average job");
           io:println("4- Student did not do a great job");
           io:println("************************************************************");
           io:println("Total");
           io:println("13-16=>> Student performed exceptionally grand and met all expectations");
           io:println("10-12=>> Student performed well and met most expectations");
           io:println("8-11=>> Student performed satisfactorily and just made it");
           io:println("0-7=>> Student did not performed well and did not make most expectations");
           io:println("_________________________________________________________________");
           io:println("|Effort    |Length       |Grammer    |Spelling    |Total        |");
           io:println("|__________|_____________|___________|____________|_____________|");
           io:println("| 4        | 3           |3          |3           | 13          |");
           io:println("|__________|_____________|___________|____________|_____________|");
           io:println(" ");
           io:println("Student performed exceptionally grand and met all expectations");
           
           //A proposal that has been sanctioned by all FIEs is ready for submission to HDC. The faculty HDC representative can view the proposal or upload the resolution from HDC after evaluation by the committee. When HDC approves a proposal, the HOD will change the student status with the mention final admission. For proposals that have not been approved by HDC, the submission to HDC sub-process will be repeated until approval
           io:println("Proposal has been sanctioned by all FIEs is ready for submission to HDC");
    int q = 8;
    int e= 3;
    if (q < e) {
        io:println("For proposals that have not been approved by HDC, the submission to HDC sub-process will be repeated until approval.");
    } else {
        io:println("HDC approved Fifi's proposal. HOD changed Fifi's status to ->> final admission.");
    }
            
    io:println("");
    io:println("**~THESIS STAGE~**");
    io:println("While the actual research is being conducted, the student will register at the beginning of each semester and submit regular reports attesting to her progress.");
    io:println("When the (research) work is completed and the draft of the thesis ready (with the approval of the supervisor), the student will upload the thesis to the system.");
    io:println("Student uploads the thesis to the system.");
    io:println("Uploading thesis.pdf....................");
    io:println("HOD sends the thesis to the appointed external examiner(s) and await their assessment.");
    
    io:println("");
    io:println("");
    io:println("");
    
    io:println("*~Examination~**");
    io:println("Examiner assessment is received, he/she will upload it into the system.");
    io:println("Uploading assessment.pdf....................");
    io:println("When the thesis handling is completed, the results are compiled and submitted to HDC for its endorsement");
    io:println("**~Results~**");
    io:println("");
    io:println("Fifi's status changed to graduate.");
    io:println("");
    io:println("For cases with minor changes, they must be effected to the satisfaction of an appointed member of the Faculty. Finally, for cases that require an extended amount of work, the necessary steps should be taken and the thesis resubmitted.");
    
           
    
    
       }
       }

        //
    
    //








