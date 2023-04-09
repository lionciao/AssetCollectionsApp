//
//  AssetDetailViewModel.swift
//  AssetCollectionsApp
//
//  Created by Ciao on 2023/4/7.
//

import Foundation

final class AssetDetailViewModel {
    
    let asset: AssetCollectionsModel.AssetModel
    private let coordinator: AssetDetailCoordinatorSepc
    
    init(
        asset: AssetCollectionsModel.AssetModel,
        coordinator: AssetDetailCoordinatorSepc
    ) {
        self.asset = asset
        self.coordinator = coordinator
    }
}

// MARK: - Coordinator

extension AssetDetailViewModel {
    
    func presentPermalink() {
        if let url = asset.permalinkURL {
            coordinator.presentPermalink(url: url)
        }
    }
}
