//
//  AssetDetailCoordinator.swift
//  AssetCollectionsApp
//
//  Created by Ciao on 2023/4/9.
//

import UIKit

protocol AssetDetailCoordinatorSepc: AnyObject {
    
    func presentPermalink(url: URL)
}

final class AssetDetailCoordinator: AssetDetailCoordinatorSepc {
    
    weak var navigationController: UINavigationController?
    
    func presentPermalink(url: URL) {
        let vc = SafariViewController(url: url)
        navigationController?.present(vc, animated: true)
    }
}
