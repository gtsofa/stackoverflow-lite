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

final class RemoteQuestionLoaderTests: XCTestCase {
    func test_init_doesNotRequestDataFromURL() {
        let (_, client) = makeSUT()
        
        XCTAssertNil(client.requestedURL)
        
    }
    
    func test_post_requestDataFromURL() {
        let url = URL(string: "https://a-given-url.com")!
        
        let (sut, client) = makeSUT(url: url)
        
        sut.post()
        
        XCTAssertEqual(client.requestedURL, url)
    }
    
    // MARK: - Helper
    
    private func makeSUT(url: URL = URL(string: "https://a-url.com")!) -> (sut: RemoteQuestionLoader, client: HTTPClientSpy) {
        let client = HTTPClientSpy()
        let sut = RemoteQuestionLoader(url: url, client: client)
        
        return (sut, client)
    }
    
    class HTTPClientSpy: HTTPClient {
        var requestedURL: URL?
        
        func get(from url: URL) {
            requestedURL = url
        }
        
    }

}
