//
//  AssetCollections+ExtensionWrapper.swift
//  AssetCollectionsApp
//
//  Created by Ciao on 2023/4/7.
//

import Foundation

extension AssetCollectionsEntity: ExtensionCompatibleValue {}

extension ExtensionWrapper where Base == AssetCollectionsEntity {
    
    func map() -> AssetCollectionsModel {
        return AssetCollectionsModel(
            assets: map(assets: base.assets)
        )
    }
}

private extension ExtensionWrapper where Base == AssetCollectionsEntity {
    
    func map(assets: [Base.AssetEntity]) -> [AssetCollectionsModel.AssetModel] {
        return assets.map {
            AssetCollectionsModel.AssetModel(
                imageURL: URL(string: $0.imageURLString),
                name: $0.name,
                contentDescription: $0.contentDescription,
                permalinkURL: URL(string: $0.permalinkString),
                collection: map(collection: $0.collection)
            )
        }
    }
    
    func map(collection: Base.AssetEntity.CollectionEntity) -> AssetCollectionsModel.AssetModel.CollectionModel {
        return AssetCollectionsModel.AssetModel.CollectionModel(
            name: collection.name
        )
    }
}
