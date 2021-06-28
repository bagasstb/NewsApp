//
//  TabViewController.swift
//  NewsApp
//
//  Created by bagasstb on 09/06/21.
//

import UIKit
import SwiftUI

class TabViewController: UITabBarController {

    @IBOutlet weak var tabBarView: UITabBar!
    let favoriteActive = #imageLiteral(resourceName: "star").withRenderingMode(.alwaysOriginal)
    let favoriteInactive = #imageLiteral(resourceName: "star-inactive").withRenderingMode(.alwaysOriginal)
    let newsActive = #imageLiteral(resourceName: "news-filled").withRenderingMode(.alwaysOriginal)
    let newsInactive = #imageLiteral(resourceName: "news-outline").withRenderingMode(.alwaysOriginal)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarController?.delegate = self
        
        let customNewsBarItem = UITabBarItem(title: "News", image: newsInactive, selectedImage: newsActive)
        let customFavBarItem = UITabBarItem(title: "Favorite", image: favoriteInactive, selectedImage: favoriteActive)
        let homeController = UINavigationController(rootViewController: HomeViewController())
        homeController.tabBarItem = customNewsBarItem
        homeController.hidesBarsOnSwipe = true
        
        let programmeController = UINavigationController(rootViewController: FavoriteViewController())
        programmeController.tabBarItem = customFavBarItem
        self.viewControllers = [homeController, programmeController]
    }

}

extension TabViewController: UITabBarControllerDelegate {
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("Selected")
    }
}

struct TabControllerRepresentable: UIViewControllerRepresentable {
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
    func makeUIViewController(context: Context) -> UIViewController {
        UINavigationController(rootViewController: TabViewController())
    }
}

struct TabViewController_Previews: PreviewProvider {
    
    static var previews: some SwiftUI.View {
        TabControllerRepresentable()
            .edgesIgnoringSafeArea(.vertical)
//            .colorScheme(.dark)
        //            .environment(\.sizeCategory, ContentSizeCategory.accessibilityExtraExtraExtraLarge)
    }
    
}
