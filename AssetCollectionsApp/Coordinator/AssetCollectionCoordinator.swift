//
//  AssetCollectionsCoordinator.swift
//  AssetCollectionsApp
//
//  Created by Ciao on 2023/4/9.
//

import UIKit

protocol AssetCollectionsCoordinatorSepc: AnyObject {
    
    func present(asset: AssetCollectionsModel.AssetModel)
    func dismissAsset()
}
      
final class AssetCollectionsCoordinator: AssetCollectionsCoordinatorSepc {
    
    weak var navigationController: UINavigationController?
        
    func present(asset: AssetCollectionsModel.AssetModel) {
        let coordinator = AssetDetailCoordinator()
        coordinator.navigationController = navigationController
        let vm = AssetDetailViewModel(asset: asset, coordinator: coordinator)
        let vc = AssetDetailViewController(viewModel: vm)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func dismissAsset() {
        navigationController?.popViewController(animated: true)
    }
}
