//
//  RWView.swift
//  TabBarCoordinator
//
//  Created by François Juteau on 05/06/2018.
//  Copyright © 2018 vente-privee. All rights reserved.
//

import UIKit

class RWView: UIView {

    // MARK: IBInspectable

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            if self.cornerRadius > 0 {
                self.layer.cornerRadius = cornerRadius
                self.layer.masksToBounds = true
            }
        }
    }

    @IBInspectable var isBorder: Bool = false {
        didSet {
            if self.isBorder {
                self.layer.borderWidth = 0.5
            }
        }
    }

    @IBInspectable var borderColor: UIColor? {
        didSet {
            if let color = self.borderColor {
                self.layer.borderColor = color.cgColor
            }
        }
    }
}

class RWButton: UIButton {

    // MARK: IBInspectable

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            if self.cornerRadius > 0 {
                self.layer.cornerRadius = cornerRadius
                self.layer.masksToBounds = true
            }
        }
    }

    @IBInspectable var isBorder: Bool = false {
        didSet {
            if self.isBorder {
                self.layer.borderWidth = 0.5
            }
        }
    }

    @IBInspectable var borderColor: UIColor? {
        didSet {
            if let color = self.borderColor {
                self.layer.borderColor = color.cgColor
            }
        }
    }
}
