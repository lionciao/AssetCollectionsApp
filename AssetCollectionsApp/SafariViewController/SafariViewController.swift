//
//  WebViewController.swift
//  AssetCollectionsApp
//
//  Created by Ciao on 2023/4/7.
//

import SafariServices
import UIKit

final class SafariViewController: SFSafariViewController {
    
    init(url: URL) {
        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = false
        super.init(url: url, configuration: config)
        delegate = self
    }
}

// MARK: - SFSafariViewControllerDelegate

extension SafariViewController: SFSafariViewControllerDelegate {
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        dismiss(animated: true)
    }
}
