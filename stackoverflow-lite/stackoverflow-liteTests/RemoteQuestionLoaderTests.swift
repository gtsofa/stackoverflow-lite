//
//  RemoteQuestionLoaderTests.swift
//  stackoverflow-liteTests
//
//  Created by Julius on 11/08/2024.
//

import XCTest

class RemoteQuestionLoader {
    
    func post() {
        HTTPClient.shared.get(from: URL(string: "https://a-url.com")!)
    }
}

class HTTPClient {
    static var shared = HTTPClient()
    
    func get(from url: URL) {}
}

class HTTPClientSpy: HTTPClient {
    var requestedURL: URL?
    
    override func get(from url: URL) {
        requestedURL = url
    }
    
}

final class RemoteQuestionLoaderTests: XCTestCase {
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        
        _ = RemoteQuestionLoader()
        
        XCTAssertNil(client.requestedURL)
        
    }
    
    func test_post_requestDataFromURL() {
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        
        let sut = RemoteQuestionLoader()
        
        sut.post()
        
        XCTAssertNotNil(client.requestedURL)
    }

}
