//
//  AssetCollectionsViewModel.swift
//  AssetCollectionsApp
//
//  Created by Ciao on 2023/4/7.
//

import Foundation

final class AssetCollectionsViewModel {
    
    private let interactor: AssetCollectionsInteractor
    
    init(interactor: AssetCollectionsInteractor) {
        self.interactor = interactor
    }
    
    func fetchAssetCollections(limit: Int) {
        interactor.fetchAssetCollections(limit: limit)
    }
}
