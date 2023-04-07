//
//  AssetDetailViewModel.swift
//  AssetCollectionsApp
//
//  Created by Ciao on 2023/4/7.
//

import Foundation

final class AssetDetailViewModel {
    
    let asset: AssetCollectionsModel.AssetModel
    
    init(asset: AssetCollectionsModel.AssetModel) {
        self.asset = asset
    }
}
