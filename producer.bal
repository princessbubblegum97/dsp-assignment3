import ballerina/kafka;
import ballerina/log;

//producer

kafka:ProducerConfiguration producerConfiguration = {

    bootstrapServers: "localhost:2453",
    clientId: "NUSTPostgrad",
    acks: "all",
    retryCount: 3,

    valueSerializerType: kafka:SER_STRING,

    keySerializerType: kafka:SER_INT
};

kafka:Producer kafkaProducer = new (producerConfiguration);


public function main() returns error? {


string message = "Nust Postgrad Producer";
    var sendResult = kafkaProducer->send(message, "This is a grande application", key = 1);
    if (sendResult is error) {
        log:printInfo("Kafka producer is experiencing some errors. " + sendResult.toString());
    } else {
        log:printInfo("Success");
    }
    var flushResult = kafkaProducer->flushRecords();
    if (flushResult is error) {
        log:printInfo("Kafka Producer not able to process your request " + flushResult.toString());
    } else {
        log:printInfo("Everything's peaches and creams.");
    }
    
    
    

   } 

    




