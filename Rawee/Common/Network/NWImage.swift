//
//  NWImage.swift
//  TabBarCoordinator
//
//  Created by François Juteau on 15/05/2018.
//  Copyright © 2018 vente-privee. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

extension UIImageView {
    func setImageWithURL(_ url: URL, placeholderImage: UIImage, success: @escaping ((Bool) -> Void)) {
        af_setImage(withURL: url, placeholderImage: placeholderImage, filter: nil, imageTransition: .crossDissolve(0.1), completion: { response in
            success(response.result.isSuccess)
        })
    }

    func setImageWithURL(_ url: URL) {
        self.af_setImage(withURL: url, placeholderImage: UIImage(named: "placeHolder"), filter: nil, imageTransition: .crossDissolve(0.2))
    }
}
