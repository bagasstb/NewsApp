//
//  LoginPresenterTest.swift
//  NewsAppTests
//
//  Created by Sekolahmu on 14/06/21.
//

import XCTest
@testable import NewsApp

class LoginPresenterTest: XCTestCase {

    var presenter: LoginPresenter?
    
    override func setUp() {
        super.setUp()
        presenter = LoginPresenter(interactor: LoginInteractor(), wireframe: LoginWireframe())
        presenter?.viewDidLoad()
        presenter?.emailEditingChanged(email: "ayam@sgmail.com")
        presenter?.emailEditingChanged(email: nil)
        presenter?.passwordEditingChanged(password: "Password123")
        presenter?.passwordEditingChanged(password: nil)
        presenter?.loginTouchUpInside(email: "", password: "")
        presenter?.loginTouchUpInside(email: "ayam@sgmail.com", password: "")
        presenter?.loginTouchUpInside(email: "ayam@sgmail.com", password: "asdskdjskdjsk")
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

    func testEmailValidation() {
        let emailValidationValid = presenter?.isEmailValid(email: "bagas@gmail.co.id")
        let emailValidationInvalid = presenter?.isEmailValid(email: "bagasgmail.co.id")
        let emailValidationNil = presenter?.isEmailValid(email: nil)
        let emptyEmail = presenter?.isEmailEmpty(email: "")
        let notEmptyEmail = presenter?.isEmailEmpty(email: "bagas@gmail.co.id")
        let emptyEmailNil = presenter?.isEmailEmpty(email: nil)
        XCTAssertEqual(emailValidationValid, true)
        XCTAssertEqual(emailValidationInvalid, false)
        XCTAssertEqual(emailValidationNil, false)
        XCTAssertEqual(emptyEmail, true)
        XCTAssertEqual(notEmptyEmail, false)
        XCTAssertEqual(emptyEmailNil, true)
    }
    
    func testPasswordValidation() {
        let passwordValidation = presenter?.isPasswordValid(password: "abcd")
        let passwordValidationNil = presenter?.isPasswordValid(password: nil)
        let emptyPassword = presenter?.isPasswordEmpty(password: "password")
        let emptyPasswordNil = presenter?.isPasswordEmpty(password: nil)
        XCTAssertEqual(passwordValidation, false)
        XCTAssertEqual(passwordValidationNil, false)
        XCTAssertEqual(emptyPassword, false)
        XCTAssertEqual(emptyPasswordNil, true)
    }
}
