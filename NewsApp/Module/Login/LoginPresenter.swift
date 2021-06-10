//
//  LoginPresenter.swift
//  NewsApp
//
//  Created by Sekolahmu on 10/06/21.
//

import Foundation

class LoginPresenter {
    
    weak var view: LoginViewController?
    let interactor: LoginInteractor
    let wireframe: LoginWireframe
    
    init(interactor: LoginInteractor, wireframe: LoginWireframe) {
        self.interactor = interactor
        self.wireframe = wireframe
    }
    
}
