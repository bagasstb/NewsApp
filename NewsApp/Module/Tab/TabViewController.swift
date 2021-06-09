//
//  TabViewController.swift
//  NewsApp
//
//  Created by bagasstb on 09/06/21.
//

import UIKit
import Foundation

class TabViewController: UITabBarController {

    @IBOutlet weak var tabBarView: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarController?.delegate = self
        
        let homeController = UINavigationController(rootViewController: HomeViewController())
        homeController.title = "Home"
        homeController.tabBarItem.image = #imageLiteral(resourceName: "news")
        homeController.tabBarItem.selectedImage = #imageLiteral(resourceName: "news")
        
        let programmeController = UINavigationController(rootViewController: FavoriteViewController())
        programmeController.title = "Programme"
        programmeController.tabBarItem.image = #imageLiteral(resourceName: "love")
        programmeController.tabBarItem.selectedImage = #imageLiteral(resourceName: "love")
//        self.tabBarView.
        self.viewControllers = [homeController, programmeController]
    }

}

extension TabViewController: UITabBarControllerDelegate {
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("Selected")
    }
}
