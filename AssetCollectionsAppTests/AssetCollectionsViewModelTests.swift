//
//  AssetCollectionsViewModelTests.swift
//  AssetCollectionsAppTests
//
//  Created by Ciao on 2023/4/9.
//

@testable import AssetCollectionsApp
import XCTest

final class AssetCollectionsViewModelTests: XCTestCase {
    
    private var interactor: MockAssetCollectionsInteractor!
    private var coordinator: MockAssetCollectionsCoordinator!
    private var sut: AssetCollectionsViewModel!

    override func setUpWithError() throws {
        try super.setUpWithError()
        interactor = MockAssetCollectionsInteractor()
        coordinator = MockAssetCollectionsCoordinator()
        sut = AssetCollectionsViewModel(
            interactor: interactor,
            coordinator: coordinator
        )
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        interactor = nil
        coordinator = nil
        sut = nil
    }

    func test_assetCollectionsViewModel_fetchAssets() throws {
        sut.fetchAssetCollections()
        XCTAssertEqual(sut.assets.count, 50)
    }
    
    func test_assetCollectionsViewModel_presentAndDismiss() throws {
        let asset = AssetCollectionsModel.AssetModel(
            imageURL: nil,
            name: "",
            contentDescription: "",
            permalinkURL: nil,
            collection: AssetCollectionsModel.AssetModel.CollectionModel(
                name: ""
            )
        )
        sut.present(asset: asset)
        XCTAssertTrue(coordinator.isPresented)
        XCTAssertFalse(coordinator.isDismissed)
        
        sut.dismissAsset()
        XCTAssertTrue(coordinator.isPresented)
        XCTAssertTrue(coordinator.isDismissed)
    }
}

// MARK: - Mock objects

final class MockAssetCollectionsInteractor: AssetCollectionsInteractorSpec {
    
    private(set) var assets: [AssetCollectionsModel.AssetModel] = []
    
    func fetchAssetCollections(
        completion: @escaping (_ assets: [AssetCollectionsModel.AssetModel]) -> Void
    ) {
        assets = (0..<50).map { _ in
            AssetCollectionsModel.AssetModel(
                imageURL: nil,
                name: "",
                contentDescription: "",
                permalinkURL: nil,
                collection: AssetCollectionsModel.AssetModel.CollectionModel(
                    name: ""
                )
            )
        }
        completion(assets)
    }
}

final class MockAssetCollectionsCoordinator: AssetCollectionsCoordinatorSepc {
    
    var isPresented = false
    var isDismissed = false
    
    func present(asset: AssetCollectionsModel.AssetModel) {
        isPresented = true
    }
    
    func dismissAsset() {
        isDismissed = true
    }
}
