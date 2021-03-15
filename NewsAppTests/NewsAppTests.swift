//
//  NewsAppTests.swift
//  NewsAppTests
//
//  Created by bagasstb on 14/03/21.
//

import XCTest
@testable import NewsApp

class NewsAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testNewsViewModel() throws {
        let news = News(title: "Title", abstract: "New Description", section: "community", url: "http://www.google.com", byline: "", multimedia: [])
        let newsViewModel = NewsViewModel(news: news)
        XCTAssertEqual(newsViewModel.section, "COMMUNITY")
    }
    
    func testNewsDetailViewModel() throws {
        /// Get normal photo from multimedia array
        let multimedia1 = Multimedia(url: "https://static01.nyt.com/images/2021/03/14/world/14virus-southafrica-print1/merlin_184251252_33054031-c95c-4cbe-8b42-fe3ac50862cd-mediumThreeByTwo210.jpg", format: "mediumThreeByTwo210", caption: "What amazing view", copyright: "Bagas")
        let multimedia2 = Multimedia(url: "https://static01.nyt.com/images/2021/03/14/world/14virus-southafrica-print1/merlin_184251252_33054031-c95c-4cbe-8b42-fe3ac50862cd-articleInline.jpg", format: "Normal", caption: "caption", copyright: "copyright")
        
        let news = News(title: "Title", abstract: "New Description", section: "community", url: "http://www.google.com", byline: "", multimedia: [multimedia1, multimedia2])
        let newsDetailViewModel = NewsDetailViewModel(news: news)
        
        XCTAssertEqual(newsDetailViewModel.photo, multimedia1.url)
        XCTAssertEqual(newsDetailViewModel.caption, "\(multimedia1.caption) by, \(multimedia1.copyright)")
    }
}
