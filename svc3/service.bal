import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
@display {
    label: "svc3",
    id: "svc3-3d8549d4-566d-41f7-9803-72ae53d74118"
}
service / on new http:Listener(9090) {

    @display {
        label: "svc4",
        id: "svc4-466a440b-620d-4eb1-9acd-5042419e6c43"
    }
    http:Client svc4Client = check new ("");

    function init() returns error? {
        self.svc4Client = check new ("");
    }

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    resource function get greeting(string name) returns string|error {
        // Send a response back to the caller.
        if name is "" {
            return error("name should not be empty!");
        }
        return "Hello, " + name;
    }
}
