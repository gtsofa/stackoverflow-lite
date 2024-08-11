//
//  RemoteQuestionLoaderTests.swift
//  stackoverflow-liteTests
//
//  Created by Julius on 11/08/2024.
//

import XCTest

class RemoteQuestionLoader {
    
    func post() {
        HTTPClient.shared.requestedURL = URL(string: "https://a-url.com")!
    }
}

class HTTPClient {
    static let shared = HTTPClient()
    
    private init() {}
    
    var requestedURL: URL?
}

final class RemoteQuestionLoaderTests: XCTestCase {
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClient.shared
        
        _ = RemoteQuestionLoader()
        
        XCTAssertNil(client.requestedURL)
        
    }
    
    func test_post_requestDataFromURL() {
        let client = HTTPClient.shared
        let sut = RemoteQuestionLoader()
        
        sut.post()
        
        XCTAssertNotNil(client.requestedURL)
    }

}
