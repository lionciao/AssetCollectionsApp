//
//  AssetCollectionCoordinator.swift
//  AssetCollectionsApp
//
//  Created by Ciao on 2023/4/9.
//

import UIKit

protocol AssetCollectionCoordinatorSepc: AnyObject {
    
    func present(asset: AssetCollectionsModel.AssetModel)
    func dismissAsset()
}
      
final class AssetCollectionCoordinator: AssetCollectionCoordinatorSepc {
    
    weak var navigationController: UINavigationController?
        
    func present(asset: AssetCollectionsModel.AssetModel) {
        let vm = AssetDetailViewModel(asset: asset)
        let vc = AssetDetailViewController(viewModel: vm)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func dismissAsset() {
        navigationController?.popViewController(animated: true)
    }
}
