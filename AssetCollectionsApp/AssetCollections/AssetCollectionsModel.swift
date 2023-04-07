//
//  AssetCollectionsModel.swift
//  AssetCollectionsApp
//
//  Created by Ciao on 2023/4/7.
//

import Foundation

struct AssetCollectionsModel {
    
    let assets: [AssetModel]
    
    struct AssetModel {
        
        /// 收藏品圖片
        let imageURL: URL?
        /// 收藏品名稱
        let name: String
        /// 收藏品描述
        let contentDescription: String
        /// 按鈕連結
        let permalinkURL: URL?
        let collection: CollectionModel
        
        struct CollectionModel {
            
            let name: String
        }
    }
}
