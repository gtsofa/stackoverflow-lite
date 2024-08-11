//
//  RemoteQuestionLoaderTests.swift
//  stackoverflow-liteTests
//
//  Created by Julius on 11/08/2024.
//

import XCTest

class RemoteQuestionLoader {
    func post() {}
}

class HTTPClient {
    var requestedURL: URL?
}

final class RemoteQuestionLoaderTests: XCTestCase {
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClient()
        
        _ = RemoteQuestionLoader()
        
        XCTAssertNil(client.requestedURL)
        
    }

}
