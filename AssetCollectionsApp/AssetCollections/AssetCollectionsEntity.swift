//
//  AssetCollectionsEntity.swift
//  AssetCollectionsApp
//
//  Created by Ciao on 2023/4/7.
//

import Foundation

struct AssetCollectionsEntity: Decodable {
    
    let assets: [AssetEntity]
    
    struct AssetEntity: Decodable {
     
        /// 收藏品圖片
        let imageURLString: String?
        /// 收藏品名稱
        let name: String
        /// 收藏品描述
        let contentDescription: String
        /// 按鈕連結
        let permalinkString: String?
        let collection: CollectionEntity
        
        struct CollectionEntity: Decodable {
            
            let name: String
        }
    }
}

private extension AssetCollectionsEntity.AssetEntity {
    
    enum CodingKeys: String, CodingKey {
        case imageURLString = "image_url"
        case name
        case contentDescription = "description"
        case permalinkString = "permalink"
        case collection
    }
}

private extension AssetCollectionsEntity.AssetEntity.CollectionEntity {
    
    enum CodingKeys: String, CodingKey {
        case name
    }
}
