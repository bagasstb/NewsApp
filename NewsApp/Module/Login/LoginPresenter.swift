//
//  LoginPresenter.swift
//  NewsApp
//
//  Created by Sekolahmu on 10/06/21.
//

import Foundation

class LoginPresenter: LoginViewProtocol {
    
    weak var view: LoginViewController?
    let interactor: LoginInteractor
    let wireframe: LoginWireframe
    let emailRule = EmailRule()
    let passwordRule = PasswordRule()
    
    init(interactor: LoginInteractor, wireframe: LoginWireframe) {
        self.interactor = interactor
        self.wireframe = wireframe
    }
    
    func viewDidLoad() {
        view?.emailErrorLabel.isHidden = true
        view?.passwordErrorLabel.isHidden = true
    }
    
    func loginTouchUpInside(email: String, password: String) {
        
        if isEmailEmpty(email: email) {
            view?.showEmailError(with: "Email Required")
            return
        }
        
        if isPasswordEmpty(password: password) {
            view?.showPasswordError(with: "Password Required")
            return
        }
        
        guard let view = view else { return }
        wireframe.dismissLogin(from: view)
    }
    
    func emailEditingChanged(email: String?) {
        if isEmailValid(email: email) {
            view?.emailErrorLabel.isHidden = true
        } else {
            view?.showEmailError(with: emailRule.errorMessage())
        }
    }
    
    func passwordEditingChanged(password: String?) {
        if isPasswordValid(password: password) {
            view?.passwordErrorLabel.isHidden = true
        } else {
            view?.showPasswordError(with: passwordRule.errorMessage())
        }
    }
    
    // MARK: - Validation
    
    func isEmailEmpty(email: String?) -> Bool {
        guard let email = email else {
            return true
        }
        return email.isEmpty
    }
    
    func isPasswordEmpty(password: String?) -> Bool {
        guard let password = password else {
            return true
        }
        return password.isEmpty
    }
    
    func isEmailValid(email: String?) -> Bool {
        guard let email = email else {
            return false
        }
        return emailRule.isValid(value: email)
    }
    
    func isPasswordValid(password: String?) -> Bool {
        guard let password = password else {
            return false
        }
        return passwordRule.isValid(value: password)
    }
    
}
