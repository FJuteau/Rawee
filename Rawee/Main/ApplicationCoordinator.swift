//
//  ApplicationCoordinator.swift
//  CoordinatorPattern
//
//  Created by François Juteau on 09/03/2018.
//  Copyright © 2018 vente-privee. All rights reserved.
//

import UIKit

class ApplicationCoordinator: Coordinator {
    let window: UIWindow
    let tabBarController: UITabBarController
    let tabBarItemCoordinators: [Coordinator]

    init(window: UIWindow) {
        self.window = window

        UserManager.current.signIn(params: SignInQuery(login: "lol", password: "lilol"), success: { member in
            print("member: \(member)")
        }) { error in
            print("error: \(error)")
        }
        
        tabBarController = UITabBarController()
        tabBarController.tabBar.barTintColor = .raweeBackground
        tabBarController.tabBar.tintColor = .titleText

        let homeCoordinator = HomeCoordinator()
        let homeViewController = homeCoordinator.presenter
        homeViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)

        let libraryCoordinator = LibraryCoordinator()
        let libraryViewController = libraryCoordinator.presenter
        libraryViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)

        let settingsCoordinator = SettingsCoordinator()
        let settingsViewController = settingsCoordinator.presenter
        settingsViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)

        tabBarItemCoordinators = [homeCoordinator, libraryCoordinator, settingsCoordinator]
        tabBarController.viewControllers = [homeViewController, libraryViewController, settingsViewController]
    }
    
    func start() {
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }
}
