import ballerina/config;
import ballerina/http;
import ballerina/kubernetes;
import ballerina/log;
import ballerina/io;

public function main()
{

io:println("NUST POSTGRADUATE APPLICATION DEPLOYMENT");
}

@kubernetes:Ingress {
    hostname: "NUST",
    name: "Grande"
}
@kubernetes:Service {
    serviceType: "NodePort",
    name: "Unicorn"
}
listener http:Listener userRetrievalEP = new (4823, config = {
    secureSocket: {
        keyStore: {
            path: "./security/ballerinaKeystore.p12",
            password: config:getAsString("keystore-password")
        }
    }
});

@kubernetes:ConfigMap {
    conf: "nuststudents.toml"
}
@kubernetes:Deployment {
    image: "ballerina.guides.io/user_retrieval_service:v1.0",
    name: "unicorn"
}
@http:ServiceConfig {
    basePath: "/users"
}
service userRetrievalService on userRetrievalEP {
    @http:ResourceConfig {
        methods: ["GET"],
        path: "/{postgrad}"
    }
    resource function getUserInfo(http:Caller pie, http:Request lime, string postgrad) {
        string student = config:getAsString(string `${<@untainted>postgrad}.student`);
        string gender = config:getAsString(string `${<@untainted>postgrad}.gender`);

        // check if candidate exists
        json payload = { message: "Faulty service." };
        if (student != "" && gender != "") {
            payload = { 
                student: student, 
                gender: gender
            };
        }

        var responseResult = pie->respond(payload);
        if (responseResult is error) {
            log:printError("Some kind of a mistake", responseResult);
        }
    }
}

//https://ballerina.io/learn/deployment/kubernetes/#table-of-content
//https://ballerina.io/learn/by-example/kubernetes-deployment.html














