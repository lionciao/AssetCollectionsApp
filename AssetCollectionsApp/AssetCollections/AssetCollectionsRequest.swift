//
//  AssetsCollectionRequest.swift
//  AssetCollectionsApp
//
//  Created by Ciao on 2023/4/6.
//

import Foundation
import Moya

struct AssetCollectionsRequest: NetworkRequest {
    
    typealias Entity = AssetCollectionsEntity

    var baseURL: URL { URL(string: "https://testnets-api.opensea.io/")! }
    let path: String = "/api/v1/assets"
    let method: Moya.Method = .get
    let task: Task
    let headers: [String : String]? = ["Content-Type": "application/json"]
    
    init(parameter: AssetsCollectionParameter) {
        self.task = .requestParameters(
            parameters: parameter.parameters,
            encoding: URLEncoding.queryString
        )
    }
}

struct AssetsCollectionParameter {
    
    var parameters: [String: Any] {
        [
            "owner": owner,
            "limit": limit,
            "offset": offset
        ]
    }
    
    /// Requests specific owner all the time.
    private let owner: String = "0x85fD692D2a075908079261F5E351e7fE0267dB02"
    private let limit: Int
    private let offset: Int
    
    init(
        limit: Int,
        offset: Int
    ) {
        self.limit = limit
        self.offset = offset
    }
}
