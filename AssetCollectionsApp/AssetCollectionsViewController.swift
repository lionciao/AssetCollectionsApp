//
//  ViewController.swift
//  AssetCollectionsApp
//
//  Created by Ciao on 2023/4/4.
//

import UIKit

final class AssetCollectionsViewController: UIViewController {

    private let viewModel: AssetCollectionsViewModel
    
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
    }
}
