//
//  WebServiceTests.swift
//  MyPictureTests
//
//  Created by Ctibor Šebák on 27/01/2019.
//  Copyright © 2019 Ctibor Šebák. All rights reserved.
//

import XCTest
@testable import MyPicture

class WebServiceTests: XCTestCase {

    var service: WebService!
    var sessionUnderTest: URLSession!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        service = WebService()
        sessionUnderTest = URLSession(configuration: URLSessionConfiguration.default)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sessionUnderTest = nil
        service = nil
        super.tearDown()
    }

    func testValidHttpRequestGetsHttpStatusCode200() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let promise = expectation(description: "Status code: 200")
        let request = service.createPostRequest(url: "https://mobility.cleverlance.com/download/bootcamp/image.php", content_type: "application/x-www-form-urlencoded", userVM: UserViewModel(login: "sebak", password: "ctibor"))
        let dataTask = sessionUnderTest.dataTask(with: request) { data, response, error in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    promise.fulfill()
                } else {
                    XCTFail("Status code: \(statusCode)")
                }
            }
        }
        dataTask.resume()
        waitForExpectations(timeout: 5, handler: nil)
    }
}
