//
//  AlertUtils.swift
//  NewsApp
//
//  Created by bagasstb on 02/06/21.
//

import UIKit

extension UIViewController {
    
    func showErrorAlert(title: String, message: String) {
        let alert = UIAlertController(title: LocaleString.networkError,
                                      message: LocaleString.networkErrorMessage,
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: LocaleString.okay, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
