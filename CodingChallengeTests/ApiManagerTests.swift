//
//  ApiManagerTests.swift
//  CodingChallengeTests
//
//  Created by Konrad Leszczyński on 22/09/2022.
//

import XCTest
@testable import CodingChallenge

class ApiManagerTests: XCTestCase {
    func test_buildRequest_forDefaultConfig() throws {
        let request = ApiManager.getDefaultRequest()
        XCTAssertNotNil(request.url, "Result url cannot be nil")

        guard let urlString = request.url?.absoluteString else {
            return
        }

        XCTAssertTrue(urlString.hasPrefix("https://staging-app.shiftkey.com/api/v2/available_shifts?"))
        // NOTE, the parameters order may differ
        XCTAssertTrue(urlString.contains("address=Dallas,%20TX"))
        XCTAssertTrue(urlString.contains("type=list"))
        let numberOfAnds = urlString.filter{ $0 == "&" }.count
        XCTAssertEqual(numberOfAnds, 3)
    }
}
