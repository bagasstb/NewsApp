//
//  LoginWireframe.swift
//  NewsApp
//
//  Created by Sekolahmu on 10/06/21.
//

import Foundation

class LoginWireframe {
    
//    weak var view: LoginViewController?
    
    func setupNavigationController() -> LoginViewController {
//        let service = resolver.resolve(ISekolahmuService.self)
        let interactor = LoginInteractor()
//        interactor.service = service
        let presenter = LoginPresenter(interactor: interactor, wireframe: self)
//        interactor.delegate = presenter
        let view = LoginViewController()
        view.presenter = presenter
//        view.setLoadingView(shimmer: loadShimmerView())
        presenter.view = view
//        controller = view
        
        return view
    }
    
}
