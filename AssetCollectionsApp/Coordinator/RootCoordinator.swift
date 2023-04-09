//
//  RootCoordinator.swift
//  AssetCollectionsApp
//
//  Created by Ciao on 2023/4/9.
//

import UIKit

final class RootCoordinator {
    
    func assetCollectionsViewController() -> UINavigationController {
        let collectionsCoordinator = AssetCollectionsCoordinator()
        let vc = AssetCollectionsViewController(
            viewModel: AssetCollectionsViewModel(
                interactor: AssetCollectionsInteractor(
                    service: DefaultNetworkService()
                ),
                coordinator: collectionsCoordinator
            )
        )
        let nvc = UINavigationController(rootViewController: vc)
        collectionsCoordinator.navigationController = nvc
        return nvc
    }
}
