//
//  ArticleCell.swift
//  NYTimesMostPopular
//
//  Created by AmrFawaz on 5/21/20.
//  Copyright © 2020 AmrFawaz. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {
    @IBOutlet var articleImageView: UIImageView!
    @IBOutlet var labelArticleTitle: UILabel!
    @IBOutlet var labelArticleByline: UILabel!
    @IBOutlet var labelArticleType: UILabel!
    @IBOutlet var labelArticlePublishedDate: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
