// Quick sample used in README
import XCPlayground
import AGURLSessionStubs

println("inside2")

// set up http stub
StubsManager.stubRequestsPassingTest({ (request: NSURLRequest!) -> Bool in
    return true
    }, withStubResponse:( { (request: NSURLRequest!) -> StubResponse in
        return StubResponse(data:NSData.data(), statusCode: 200, headers: ["Content-Type" : "text/json"])
    }))


let request = NSMutableURLRequest(URL: NSURL(string: "http://server.com"))

let config = NSURLSessionConfiguration.defaultSessionConfiguration()
let session = NSURLSession(configuration: config)

let task = session.dataTaskWithRequest(request) {(data, response, error) in
    if (response == nil ) {
        println("nil")
    }


    println(">>>\(response)")
}

task.resume()

XCPSetExecutionShouldContinueIndefinitely()
