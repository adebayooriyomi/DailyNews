//
//  CollectionViewCell.swift
//  Daily News
//
//  Created by Adebayo Oriyomi on 2019-09-25.
//  Copyright © 2019 Adebayo Oriyomi. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    //@IBOutlet weak var cImage: UIImageView!
    //@IBOutlet weak var cNewsHeadline: UILabel!
    //@IBOutlet weak var timePosted: UILabel!
    //@IBOutlet weak var source: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let image: CustomImageView = {
        let imageView = CustomImageView()
        imageView.image = UIImage(named: "tea")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let source: UILabel = {
        let label = UILabel()
        label.text = "Today"
        label.textColor = UIColor.gray
        label.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 17)
        label.numberOfLines = 1

        return label
    }()
    
    let title: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.numberOfLines = 3
        label.text = ""
        return label
    }()
    
    let publishedAt: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = UIColor.gray
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.numberOfLines = 1

        return label
    }()
    
    fileprivate func setupViews() {
        contentView.addSubview(image)
        image.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: 180)
        contentView.addSubview(source)
        source.frame = CGRect(x: 0, y: 190, width: self.frame.size.width, height: 20)
        contentView.addSubview(title)
        title.frame = CGRect(x: 0, y: 210, width: self.frame.size.width, height: 70)
        contentView.addSubview(publishedAt)
        publishedAt.frame = CGRect(x: 0, y: 285, width: self.frame.size.width, height: 16)
    }
    
}
