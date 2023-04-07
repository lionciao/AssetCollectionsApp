//
//  AssetCollectionsInteractorSpec.swift
//  AssetCollectionsApp
//
//  Created by Ciao on 2023/4/7.
//

import Foundation

protocol AssetCollectionsInteractorSpec: AnyObject {
    
    var assets: [AssetCollectionsModel.AssetModel] { get }
    
    func fetchAssetCollections(
        completion: @escaping (_ assets: [AssetCollectionsModel.AssetModel]) -> Void
    )
}
