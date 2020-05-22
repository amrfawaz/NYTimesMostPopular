//
//  SearchArticleViewController.swift
//  NYTimesMostPopular
//
//  Created by AmrFawaz on 5/21/20.
//  Copyright © 2020 AmrFawaz. All rights reserved.
//

import AlamofireImage
import UIKit

class SearchArticleViewController: BaseViewController {
    @IBOutlet var tableView: UITableView!

    let viewModel = SearchViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Most Viewed Articles"
        registerCells()
        getMostViewedArticles()
    }

    func registerCells() {
        tableView.register(UINib(nibName: viewModel.articleCellIdentifire, bundle: nil), forCellReuseIdentifier: viewModel.articleCellIdentifire)
    }

    func getMostViewedArticles() {
        viewModel.getMostViewedArticles { [weak self] error in
            guard let strongSelf = self else { return }
            if let error = error {
                strongSelf.showCustomAlert(title: error.title ?? "", message: error.message ?? "", doneButtonTitle: "Ok")
            } else {
                strongSelf.tableView.reloadData()
            }
        }
    }
}

extension SearchArticleViewController: UITableViewDataSource {
    func numberOfSections(in _: UITableView) -> Int {
        return 1
    }

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return viewModel.articles?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let article = viewModel.articles?[indexPath.row]

        let articleCell = tableView.dequeueReusableCell(withIdentifier: viewModel.articleCellIdentifire) as? ArticleCell

        if let media = article?.media, !media.isEmpty {
            if let metadata = media.first?.metadata, !metadata.isEmpty {
                articleCell?.articleImageView.af_setImage(withURL: URL(string: metadata.first?.url ?? "")!, placeholderImage: UIImage(named: "placeholder"))
            }
        }

        articleCell?.labelArticleTitle.text = article?.title
        articleCell?.labelArticleType.text = article?.type
        articleCell?.labelArticleByline.text = article?.byline
        articleCell?.labelArticlePublishedDate.text = article?.publishedDate
        return articleCell!
    }
}

extension SearchArticleViewController: UITableViewDelegate {
    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        let articleDetailsViewController = Router.getDestinationViewController(storyboard: StoryboardMapper.Search.articleDetails) as? ArticleDetailsViewController
        articleDetailsViewController?.article = viewModel.articles?[indexPath.row]
        Router.navigate(destination: articleDetailsViewController!, presentationType: .push)
    }
}
