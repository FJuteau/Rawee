//
//  UIView+Helper.swift
//  TabBarCoordinator
//
//  Created by François Juteau on 13/05/2018.
//  Copyright © 2018 vente-privee. All rights reserved.
//

import UIKit

extension UIView {

    /// Set the given image as background
    ///
    /// - Parameters:
    ///   - imageNamed: image used as the pattern
    ///   - bundle: optional
    public func backgroundPattern(_ imageNamed: String, in bundle: Bundle? = nil) {
        if let pattern = UIImage(named: imageNamed, in: bundle, compatibleWith: nil) {
            backgroundColor = UIColor(patternImage: pattern)
        }
    }

    /// Set the border of a view. BorderWidth is 1
    /// - Test : UIViewTests.swift
    ///
    /// - Parameters:
    ///   - color: of the border
    ///   - cornerRadius: of the border. optional : 0 by default
    public func border(color: UIColor, cornerRadius: CGFloat? = nil) {
        layer.borderColor = color.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = cornerRadius ?? 0
        layer.masksToBounds = true
    }

    /// Get the className
    /// - Test : UIViewTests.swift
    public var className: String {
        return String(describing: type(of: self))
    }

    /// Get the storyboard identifier. It must be the name of the class.
    /// - Test : UIViewTests.swift
    public static var storyboardIdentifier: String {
        return String(describing: self)
    }

    /// Get the nib of a view. It must be the name of the class
    public static var nib: UINib {
        return UINib.init(nibName: storyboardIdentifier, bundle: Bundle(for: self))
    }
}
