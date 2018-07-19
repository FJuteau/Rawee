//
//  UIColor+Application.swift
//  TabBarCoordinator
//
//  Created by François Juteau on 05/06/2018.
//  Copyright © 2018 vente-privee. All rights reserved.
//

import UIKit

// MARK: Background
extension UIColor {
    static var raweeBackground: UIColor {
        return UIColor(named: "Rawee Background") ?? UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    }

    static var applicationBackground: UIColor {
        return UIColor(named: "Application Background") ?? UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    }

    static var viewBackground: UIColor {
        return UIColor(named: "View Background") ?? UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    }

    static var buttonBackground: UIColor {
        return UIColor(named: "Button Background") ?? UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    }
}

// MARK: Text
extension UIColor {
    static var globalText: UIColor {
        return UIColor(named: "Global Text") ?? UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    }

    static var titleText: UIColor {
        return UIColor(named: "Title Text") ?? UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    }

    static var buttonTitleText: UIColor {
        return UIColor(named: "Button Title Text") ?? UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    }
}
