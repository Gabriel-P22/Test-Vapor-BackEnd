import UIKit

let json = """
{
    "Name" : "Networking With URLSession",
    "Language" : "Swift",
    "version" : 5.2
}

"""
guard let upLoadUrl = URL(string: "http://127.0.0.1:8080/upload") else  {
    fatalError()
}

var request = URLRequest(url: upLoadUrl)
let jsonData = json.data(using: .utf8)

request.httpMethod = "Post"
request.setValue("application/json", forHTTPHeaderField: "Content-type")

let urlSession = URLSession(configuration: .default, delegate: nil, delegateQueue: nil)

let task = urlSession.uploadTask(with: request, from: jsonData) {
    data, response, error in
    
    print(response ?? "no response")
}

task.resume()
