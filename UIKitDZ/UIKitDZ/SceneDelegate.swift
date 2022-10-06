//
//  SceneDelegate.swift
//  UIKitDZ
//
//  Created by Dima Kovrigin on 22.09.2022.
//

import UIKit
/// Начальный делегат
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
          _ scene: UIScene,
          willConnectTo session: UISceneSession,
          options connectionOptions: UIScene.ConnectionOptions) {
              guard let windowScene = scene as? UIWindowScene else { return }
              let window = UIWindow(windowScene: windowScene)
              let mainVC = MainViewController()
              let secondVC = SecondViewController()
              let firstNavigationController = UINavigationController(rootViewController: mainVC)
              let secondNavigationController = UINavigationController(rootViewController: secondVC)

              let tabBarVC = UITabBarController()
              tabBarVC.setViewControllers([firstNavigationController, secondNavigationController], animated: true)

              window.rootViewController = tabBarVC
              window.makeKeyAndVisible()
              window.backgroundColor = .white
              self.window = window
    }
}
