//
//  RemoteQuestionLoaderTests.swift
//  stackoverflow-liteTests
//
//  Created by Julius on 11/08/2024.
//

import XCTest

class RemoteQuestionLoader {
    let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    func post() {
        client.get(from: URL(string: "https://a-url.com")!)
    }
}

protocol HTTPClient {
    func get(from url: URL)
}

class HTTPClientSpy: HTTPClient {
    var requestedURL: URL?
    
    func get(from url: URL) {
        requestedURL = url
    }
    
}

final class RemoteQuestionLoaderTests: XCTestCase {
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        
        _ = RemoteQuestionLoader(client: client)
        
        XCTAssertNil(client.requestedURL)
        
    }
    
    func test_post_requestDataFromURL() {
        let client = HTTPClientSpy()
        
        let sut = RemoteQuestionLoader(client: client)
        
        sut.post()
        
        XCTAssertNotNil(client.requestedURL)
    }

}
