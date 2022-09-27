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
    
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        
        guard scene as? UIWindowScene != nil else { return }
        guard let windowScene = scene as? UIWindowScene else { return }
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
        
        let viewController = MainViewController()
        let navigation = UINavigationController(rootViewController: viewController)
        window?.rootViewController = navigation
    }
}
