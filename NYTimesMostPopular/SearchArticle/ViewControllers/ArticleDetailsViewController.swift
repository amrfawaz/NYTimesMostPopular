//
//  ArticleDetailsViewController.swift
//  NYTimesMostPopular
//
//  Created by AmrFawaz on 5/22/20.
//  Copyright © 2020 AmrFawaz. All rights reserved.
//

import UIKit

class ArticleDetailsViewController: UIViewController {
    @IBOutlet var articleImageView: UIImageView!
    @IBOutlet var labelImageCaption: UILabel!
    @IBOutlet var labelArticleAbstract: UILabel!

    var article: Article?
    override func viewDidLoad() {
        super.viewDidLoad()
//        articleImageView.addGradiantLayer()
        setArticleData()
    }

    func setArticleData() {
        title = article?.title
        labelArticleAbstract.text = article?.abstract
        if let media = article?.media, !media.isEmpty {
            if let metadata = media.first?.metadata, !metadata.isEmpty {
                articleImageView.af_setImage(withURL: URL(string: metadata[1].url ?? "")!, placeholderImage: UIImage(named: "placeholder"))
            }
            labelImageCaption.text = media.first?.caption
        }
    }

    @IBAction func buttonDidPressReadFullArticle(_: Any) {
        let fullArticleViewController = Router.getDestinationViewController(storyboard: StoryboardMapper.Search.fullArticle) as? FullArticleViewController
        fullArticleViewController?.url = article!.url!

        let navigationController = UINavigationController(rootViewController: fullArticleViewController!)
        Router.navigate(destination: navigationController, presentationType: .modal)
    }
}
