//
//  HomePresenterTest.swift
//  NewsAppTests
//
//  Created by bagasstb on 03/06/21.
//

import XCTest
@testable import NewsApp

class HomePresenterTest: XCTestCase {

    fileprivate var mockNews: [News] = []
    var presenter: HomePresenter?
    
    override func setUp() {
        super.setUp()
        presenter?.viewDidLoad()
        presenter = HomePresenter()
        let fakeMultimedia = Multimedia(url: "Fake Url", format: "Fake format", caption: "Fake caption", copyright: "Fake copyright")
        let fakeNews = News(title: "Fake Title", abstract: "Fake Abstract", section: "Fake Section", url: "Fake Url", byline: "Fake Author", multimedia: [fakeMultimedia])
        mockNews = [fakeNews]
    }

    func testCountNews() {
        presenter?.newsDidFetch(news: NewsList(results: mockNews))
        XCTAssertEqual(presenter?.newsCount(), 1)
    }
    
    func testCountMultimedia() {
        presenter?.newsDidFetch(news: NewsList(results: mockNews))
        XCTAssertEqual(presenter?.newsModel[0].multimedia.count, 1)
    }
    
    func testSelectedNews() {
        presenter?.newsDidFetch(news: NewsList(results: mockNews))
        let selectedNews = presenter?.news(at: 0)
        XCTAssertEqual(selectedNews?.title, "Fake Title")
    }
    
    
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

}
