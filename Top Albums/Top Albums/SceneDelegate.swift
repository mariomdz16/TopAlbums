//
//  SceneDelegate.swift
//  Top Albums
//
//  Created by Mario A Mendez on 3/28/20.
//  Copyright © 2020 XTeam. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var navigationController: UINavigationController?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene

        navigationController = UINavigationController(rootViewController: AlbumsTableViewController())
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .black

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        WebService.loadAlbums { (event, success) in
            if success == true {
                OperationQueue.main.addOperation {
                    let tunesTableViewController = self.navigationController?.viewControllers.first as? AlbumsTableViewController
                    tunesTableViewController?.event = event
                }
            }
        }
    }
}

