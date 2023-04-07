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
    
    init(interactor: AssetCollectionsInteractor) {
        self.interactor = interactor
        self.assets = interactor.assets
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
