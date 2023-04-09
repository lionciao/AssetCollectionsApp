//
//  AssetCollectionsViewModel.swift
//  AssetCollectionsApp
//
//  Created by Ciao on 2023/4/7.
//

import Foundation

protocol AssetCollectionsViewModelDelegate: AnyObject {

    typealias Asset = AssetCollectionsModel.AssetModel
    
    func assetCollectionsViewModel(
        _ viewModel: AssetCollectionsViewModel,
        didFetchAssets assets: [Asset]
    )
}

final class AssetCollectionsViewModel {
    
    weak var delegate: AssetCollectionsViewModelDelegate?
    
    var assets: [AssetCollectionsModel.AssetModel] = []
    var shouldShowEmptyView: Bool { return assets.isEmpty }
    
    private let interactor: AssetCollectionsInteractor
    private let coordinator: AssetCollectionCoordinatorSepc
    
    init(
        interactor: AssetCollectionsInteractor,
        coordinator: AssetCollectionCoordinatorSepc
    ) {
        self.interactor = interactor
        self.assets = interactor.assets
        self.coordinator = coordinator
    }
    
    func fetchAssetCollections() {
        interactor.fetchAssetCollections() { [weak self] assets in
            guard let self = self else { return }
            self.assets = assets
            self.delegate?.assetCollectionsViewModel(self, didFetchAssets: assets)
        }
    }
    
    func isTimeToFetchNextPage(whenScrollTo itemIndex: Int) -> Bool {
        guard
            let lastItemIndex = assets.indices.last,
            itemIndex + 3 > lastItemIndex else {
            return false
        }
        return true
    }
}

// MARK: - Coordinator

extension AssetCollectionsViewModel {
    
    func present(asset: AssetCollectionsModel.AssetModel) {
        coordinator.present(asset: asset)
    }
    
    func dismissAsset() {
        coordinator.dismissAsset()
    }
}
