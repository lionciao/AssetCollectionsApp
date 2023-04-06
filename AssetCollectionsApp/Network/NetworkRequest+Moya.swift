//
//  NetworkRequest.swift
//  AssetCollectionsApp
//
//  Created by Ciao on 2023/4/6.
//

import Foundation
import Moya

public protocol NetworkRequest: TargetType {
    
    associatedtype Entity: Decodable
}

