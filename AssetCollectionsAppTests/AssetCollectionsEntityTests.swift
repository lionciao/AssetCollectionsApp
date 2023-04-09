//
//  AssetCollectionsEntityTests.swift
//  AssetCollectionsAppTests
//
//  Created by Ciao on 2023/4/9.
//

@testable import AssetCollectionsApp
import XCTest

final class AssetCollectionsEntityTests: XCTestCase {
    
    func test_assetCollectionsEntity_isDecodedNormally() {
        do {
            _ = try JSONDecoder().decode(AssetCollectionsEntity.self, from: jsonData)
        } catch {
            XCTFail("Expected decode success instead of \(error)")
        }
    }
}

private let jsonData = """
{
    "assets": [
        {
            "image_url": "https://i.seadn.io/gcs/files/b4d419a67bc7dc52000e6d1336b24c46.png?w=500&auto=format",
            "name": "MultiFaucet Test NFT",
            "description": "A test NFT dispensed from faucet.paradigm.xyz.",
            "permalink": "https://testnets.opensea.io/assets/goerli/0xf5de760f2e916647fd766b4ad9e85ff943ce3a2b/3557424",
            "collection": {
                "name": "MultiFaucet NFT V3"
            }
        },
        {
            "image_url": "https://i.seadn.io/gcs/files/b4d419a67bc7dc52000e6d1336b24c46.png?w=500&auto=format",
            "name": "MultiFaucet Test NFT 2",
            "description": "Another test NFT dispensed from faucet.paradigm.xyz.",
            "permalink": "https://testnets.opensea.io/assets/goerli/0xf5de760f2e916647fd766b4ad9e85ff943ce3a2b/3557424",
            "collection": {
                "name": "MultiFaucet NFT V3"
            }
        }
    ]
}
""".data(using: .utf8)!
