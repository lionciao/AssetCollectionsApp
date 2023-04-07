//
//  AssetDetailViewController.swift
//  AssetCollectionsApp
//
//  Created by Ciao on 2023/4/7.
//

import SnapKit
import UIKit

final class AssetDetailViewController: UIViewController {
    
    private lazy var coverImageView = makeCoverImageView()
    private lazy var titleLabel = makeTitleLabel()
    private lazy var contentLabel = makeContentLabel()
    private lazy var permalLinkButton = makePermalLinkButton()
    
    init() {
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

// MARK: - External setups

extension AssetDetailViewController {

    func config(with model: AssetCollectionsModel.AssetModel) {
        navigationController?.title = model.collection.name
        titleLabel.text = model.name
        contentLabel.text = model.contentDescription
        coverImageView.ew.setImage(with: model.imageURL)
    }
}

// MARK: - View makers

private extension AssetDetailViewController {
    
    func setupUI() {
        [coverImageView, titleLabel, contentLabel, permalLinkButton].forEach {
            view.addSubview($0)
        }
        coverImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(14)
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalTo(250)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(coverImageView.snp.bottom).offset(10)
            make.leading.trailing.equalTo(coverImageView)
        }
        
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.trailing.equalTo(coverImageView)
        }
        
        permalLinkButton.snp.makeConstraints { make in
            make.top.equalTo(contentLabel.snp.bottom).offset(10)
            make.leading.trailing.equalTo(coverImageView)
            make.bottom.equalTo(-14)
        }
    }
    
    func makeCoverImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }
    
    func makeTitleLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .darkGray
        label.numberOfLines = 2
        return label
    }
    
    func makeContentLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12)
        label.textColor = .lightGray
        label.numberOfLines = 0
        return label
    }
    
    func makePermalLinkButton() -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
}
