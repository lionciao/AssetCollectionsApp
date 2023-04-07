//
//  NSObject+className.swift
//  AssetCollectionsApp
//
//  Created by Ciao on 2023/4/7.
//

import Foundation

public extension NSObject {

    static var className: String {
        return String(describing: self)
    }
}
