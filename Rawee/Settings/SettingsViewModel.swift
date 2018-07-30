//
//  SettingsViewModel.swift
//  Rawee
//
//  Created by François Juteau on 28/07/2018.
//  Copyright © 2018 rawee. All rights reserved.
//

import Foundation
import FirebaseUI

class SettingsViewModel {
    
    private let auth = Auth.auth()
    
    enum Navigation {
        case loginScreen
    }
    
    enum Item {
        case user(model: UserSettingsCellModel)
        case login(model: SettingsCellModel)
        case disconnect(model: SettingsCellModel)
    }
    
    // MARK: - Output
    
    var items: (([Item]) -> Void)?
    var navigateTo: ((Navigation) -> Void)?

    // MARK: - Input
    
    func viewDidLoad() {
        if let user = auth.currentUser {
            
            items?(loggedIems(user: user))
        } else {
            items?(logoffIems)
        }
        Auth.auth().addStateDidChangeListener({ [unowned self] auth, user in
            if let user = user {
                self.items?(self.loggedIems(user: user))
                print(user)
            } else {
                self.items?(self.logoffIems)
            }
        })
    }
    
    func selectItem(_ item: Item) {
        switch item {
        case .login:
            navigateTo?(.loginScreen)
        case .disconnect:
            do {
                try auth.signOut()
            } catch {
                
            }
        default:
            return
        }
    }
    
    private let logoffIems: [Item] = [.login(model: SettingsCellModel(title: "Login"))]
    private func loggedIems(user: User) -> [Item] {
        return [.user(model: UserSettingsCellModel(photoUrl: user.photoURL, displayName: user.displayName)), .disconnect(model: SettingsCellModel(title: "Disconnect"))]
    }
}
