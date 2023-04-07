//
//  ViewController.swift
//  AssetCollectionsApp
//
//  Created by Ciao on 2023/4/4.
//

import SnapKit
import UIKit

final class AssetCollectionsViewController: UIViewController {

    private let viewModel: AssetCollectionsViewModel
    
    private lazy var flowLayout = makeCollectionViewLayout()
    private lazy var collectionView = makeCollectionView()
    private lazy var loadingIndicatorView = makeLoadingIndicatorView()
    
    init(viewModel: AssetCollectionsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension AssetCollectionsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return flowLayout.sectionInset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return flowLayout.minimumLineSpacing
    }
}

// MARK: - View makers

private extension AssetCollectionsViewController {
    
    func setupUI() {
        [collectionView, loadingIndicatorView].forEach {
            view.addSubview($0)
        }
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        loadingIndicatorView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(14)
            make.height.width.equalTo(15)
        }
    }
    
    func makeCollectionView() -> UICollectionView {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.register(AssetCollectionCell.self, forCellWithReuseIdentifier: AssetCollectionCell.className)
        return collectionView
    }
    
    func makeCollectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 14, left: 10, bottom: 14, right: 10)
        return layout
    }
    
    func makeLoadingIndicatorView() -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView(style: .medium)
        return view
    }
}
