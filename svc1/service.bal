import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
@display {
    label: "svc1",
    id: "svc1-ecef161a-e5bb-4535-860d-5d09c4aedc6c"
}
service / on new http:Listener(9090) {

    @display {
        label: "svc2",
        id: "svc2-a006bf45-e3ec-4f97-8b59-d2dd78ecf969"
    }
    http:Client svc2Client = check new ("");

    function init() returns error? {
        self.svc2Client = check new ("");
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
