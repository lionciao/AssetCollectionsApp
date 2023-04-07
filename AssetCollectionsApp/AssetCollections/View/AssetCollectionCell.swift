//
//  AssetCollectionCell.swift
//  AssetCollectionsApp
//
//  Created by Ciao on 2023/4/7.
//

import SnapKit
import UIKit

public final class AssetCollectionCell: UICollectionViewCell {
    
    private lazy var coverImageView = makeCoverImageView()
    private lazy var titleLabel = makeTitleLabel()

    public override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - External setups

extension AssetCollectionCell {

    func config(with model: AssetCollectionsModel.AssetModel) {
        titleLabel.text = model.name
        coverImageView.ew.setImage(with: model.imageURL)
    }
}

// MARK: - View makers

private extension AssetCollectionCell {
    
    func setupUI() {
        [coverImageView, titleLabel].forEach {
            contentView.addSubview($0)
        }
        coverImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(10)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(coverImageView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(10)
            make.bottom.equalTo(-14)
        }
    }
    
    func makeCoverImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
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
}
