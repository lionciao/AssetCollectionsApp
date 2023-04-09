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
    
    private let viewModel: AssetDetailViewModel
    
    init(viewModel: AssetDetailViewModel) {
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
        config(with: viewModel.asset)
    }
}

// MARK: - Selectors

private extension AssetDetailViewController {
    
    @objc func permalLinkButtonPress(_ sender: UIButton) {
        viewModel.presentPermalink()
    }
}

// MARK: - Setups

private extension AssetDetailViewController {

    func config(with model: AssetCollectionsModel.AssetModel) {
        title = model.collection.name
        titleLabel.text = model.name
        contentLabel.text = model.contentDescription
        coverImageView.ew.setImage(with: model.imageURL)
        permalLinkButton.setTitle("permallink", for: .normal)
    }
}

// MARK: - View makers

private extension AssetDetailViewController {
    
    func setupUI() {
        view.backgroundColor = .white
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
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(14)
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
        button.setTitleColor(.systemBlue, for: .normal)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(permalLinkButtonPress(_:)), for: .touchUpInside)
        return button
    }
}
