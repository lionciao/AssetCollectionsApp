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
    private var pagination = Pagination()
    
    init(service: NetworkService = DefaultNetworkService()) {
        self.service = service
    }
    
    func fetchAssetCollections(
        completion: @escaping (_ assets: [AssetCollectionsModel.AssetModel]) -> Void
    ) {
        let page = pagination.nextPage
        if page == pagination.previousPage { return }
        pagination.previousPage = page
        
        let parameter = AssetsCollectionParameter(limit: pagination.limit, offset: pagination.offset)
        service.send(AssetCollectionsRequest(parameter: parameter)) { [weak self] result in
            guard let self = self else { return }
            if case let .success(entity) = result {
                let model = entity.ew.map()
                self.assets += model.assets
                self.pagination.nextPage += 1
                completion(self.assets)
            }
        }
    }
}

fileprivate struct Pagination {
    
    var isPageEnd = false
    var previousPage: Int? = 0
    var nextPage: Int = 1
    
    let limit = 20
    var offset: Int {
        if let page = previousPage {
            return page * limit
        } else {
            return 0
        }
    }
}
