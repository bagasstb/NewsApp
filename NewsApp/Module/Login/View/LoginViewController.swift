//
//  LoginViewController.swift
//  NewsApp
//
//  Created by Sekolahmu on 10/06/21.
//

import UIKit

class LoginViewController: UIViewController {

    var presenter: LoginPresenter?
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }

    @IBAction func loginTouchUpInside(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextfield.text {
            presenter?.loginTouchUpInside(email: email, password: password)
        }
    }
    
    @IBAction func emailTextFieldEditingChanged(_ sender: UITextField) {
        presenter?.emailEditingChanged(email: sender.text)
    }
    
    @IBAction func passwordTextFieldEditingChanged(_ sender: UITextField) {
        presenter?.passwordEditingChanged(password: sender.text)
    }
}

extension LoginViewController: LoginViewInterface {
    
    func showEmailError(with message: String) {
        emailErrorLabel.isHidden = false
        emailErrorLabel.text = message
    }
    
    func showPasswordError(with message: String) {
        passwordErrorLabel.isHidden = false
        passwordErrorLabel.text = message
    }
    
}
