//
//  AssetCollectionsInteractor.swift
//  AssetCollectionsApp
//
//  Created by Ciao on 2023/4/7.
//

import Foundation

final class AssetCollectionsInteractor: AssetCollectionsInteractorSpec {
    
    private(set) var assets: [AssetCollectionsModel.AssetModel] = []
    
    private let service: NetworkService
    
    init(service: NetworkService = DefaultNetworkService()) {
        self.service = service
    }
    
    // TODO: pagination
    func fetchAssetCollections(
        limit: Int,
        completion: @escaping (_ assets: [AssetCollectionsModel.AssetModel]) -> Void
    ) {
        let parameter = AssetsCollectionParameter()
        service.send(AssetCollectionsRequest(parameter: parameter)) { [weak self] result in
            guard let self = self else { return }
            if case let .success(entity) = result {
                let model = entity.ew.map()
                self.assets += model.assets
                completion(self.assets)
            }
        }
    }
}
