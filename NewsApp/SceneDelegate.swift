//
//  SceneDelegate.swift
//  NewsApp
//
//  Created by bagasstb on 14/03/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
      
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = TabViewController() // Your initial view controller.
        window.makeKeyAndVisible()
        self.window = window
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded
        // (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }

    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        if let url =  URLContexts.first?.url {
            let urlString = url.absoluteString
            let component = urlString.components(separatedBy: "=")
            if let urlValue = component.last {
                navigateToDetail(url: urlValue)
            }
        }
    }

    func navigateToDetail(url: String) {
//        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let detailPage = NewsDetailViewController()
        if let newsList = NewsServices.shared.getCache() {
            if let index = newsList.results.firstIndex(where: { $0.url == url }) {
                detailPage.newsModel = newsList.results
                detailPage.currentIndex = index
                let navigation = self.window?.rootViewController as? UINavigationController
                navigation?.pushViewController(detailPage, animated: true)
            }
        }
    }
}
