//
//  RemoteQuestionLoaderTests.swift
//  stackoverflow-liteTests
//
//  Created by Julius on 11/08/2024.
//

import XCTest

class RemoteQuestionLoader {
    let url: URL
    let client: HTTPClient
    
    init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    func post() {
        client.get(from: url)
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
        let url = URL(string: "https://a-url.com")!
        let client = HTTPClientSpy()
        
        _ = RemoteQuestionLoader(url: url, client: client)
        
        XCTAssertNil(client.requestedURL)
        
    }
    
    func test_post_requestDataFromURL() {
        let url = URL(string: "https://a-given-url.com")!
        let client = HTTPClientSpy()
        
        let sut = RemoteQuestionLoader(url: url, client: client)
        
        sut.post()
        
        XCTAssertEqual(client.requestedURL, url)
    }

}
