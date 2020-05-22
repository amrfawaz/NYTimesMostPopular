//
//  FullArticleViewController.swift
//  NYTimesMostPopular
//
//  Created by AmrFawaz on 5/22/20.
//  Copyright © 2020 AmrFawaz. All rights reserved.
//

import UIKit
import WebKit
class FullArticleViewController: BaseViewController {
    @IBOutlet var webView: WKWebView!

    var url: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        addCloseButton(color: .black)
        if url != nil {
            webView.load(URLRequest(url: URL(string: url!)!))
        }
    }
}
