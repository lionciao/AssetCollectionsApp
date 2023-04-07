//
//  UIImageView+Nuke.swift
//  AssetCollectionsApp
//
//  Created by Ciao on 2023/4/7.
//

import Nuke
import UIKit

extension UIImageView: ExtensionCompatibleObject {}

public extension ExtensionWrapper where Base: UIImageView {
    
    /// Set image to image view with urls.
    ///
    /// - Parameters:
    ///   - url: self.image = placeholderImage when `resource` is `nil`
    ///   - placeholder: the default value of the property is `img_placeholder50`
    func setImage(
        with url: URL?,
        placeholder: UIImage = UIImage(named: "img_placeholder50")!
    ) {
        guard let imageURL = url else {
            base.image = placeholder
            return
        }
        let options = ImageLoadingOptions(placeholder: placeholder, failureImage: placeholder)
        Nuke.loadImage(with: imageURL, options: options, into: base) { _ in }
    }
}
