//
//  LoginContract.swift
//  NewsApp
//
//  Created by Sekolahmu on 10/06/21.
//

import UIKit

protocol LoginViewProtocol {
    func viewDidLoad()
    func emailEditingChanged(email: String?)
    func passwordEditingChanged(password: String?)
    func loginTouchUpInside(email: String, password: String)
    func isEmailEmpty(email: String?) -> Bool
    func isPasswordEmpty(password: String?) -> Bool
    func isEmailValid(email: String?) -> Bool
    func isPasswordValid(password: String?) -> Bool
}

protocol LoginViewInterface {
    func showEmailError(with message: String)
    func showPasswordError(with message: String)
}

protocol LoginWireframeProtocol {
    func dismissLogin(from viewController: UIViewController)
}
