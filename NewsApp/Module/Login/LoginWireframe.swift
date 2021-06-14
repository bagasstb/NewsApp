//
//  LoginWireframe.swift
//  NewsApp
//
//  Created by Sekolahmu on 10/06/21.
//

import UIKit

class LoginWireframe {
    
//    weak var view: LoginViewController?
    
    func setupNavigationController() -> LoginViewController {
        let interactor = LoginInteractor()
        let presenter = LoginPresenter(interactor: interactor, wireframe: self)
        let view = LoginViewController()
        view.presenter = presenter
        presenter.view = view
        
        return view
    }
    
}

extension LoginWireframe: LoginWireframeProtocol {
    
    func dismissLogin(from viewController: UIViewController) {
        viewController.dismiss(animated: true, completion: nil)
    }
}
