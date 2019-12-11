//
//  SelectedPublisherCollectionViewController.swift
//  DailyNews
//
//  Created by Adebayo Oriyomi on 2019-10-30.
//  Copyright © 2019 Adebayo Oriyomi. All rights reserved.
//

import UIKit

class SelectedPublisherCollectionViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    var newsId: String?
    var newsArticles: [DailyFeedModel] = [] {
        didSet {
            self.collectionView.reloadData()
            print(self.newsArticles.count)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.frame = CGRect(x: 0, y:0, width: view.frame.size.width, height: view.frame.size.height)
        
        NewsAPI.getNewsArticles(newsId: newsId!, completionHandler: { (Articles) in
             self.newsArticles = Articles.articles
        })
    }
    
    fileprivate let collectionView:UICollectionView = {
           let layout = UICollectionViewFlowLayout()
           layout.scrollDirection = .vertical
           let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
           cv.translatesAutoresizingMaskIntoConstraints = false
           cv.register(SelectPublisherCell.self, forCellWithReuseIdentifier: "reuseIdentifier")
           return cv
    }()


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return newsArticles.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reuseIdentifier", for: indexPath) as! SelectPublisherCell
    
       // Configure the cell
        let articleImage = newsArticles[indexPath.row].urlToImage ?? "https://dummyimage.com/600x400/f7f7f7/000000&text=N"
        
        let img = cell.image as CustomImageView
        img.loadImageUsingUrlString(articleImage)
        cell.title.text = newsArticles[indexPath.row].title
        cell.source.text = newsArticles[indexPath.row].source?.name
        let publishDate = newsArticles[indexPath.row].publishedAt ?? ""
        cell.publishedAt.text = dateFormat(publishDate: publishDate)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/2 - 20, height: 290)
    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let WebView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "webView") as! WebViewController
        let articlesToDisplay = newsArticles[indexPath.item]
        let url = articlesToDisplay.url
        WebView.url = url
        self.navigationController?.pushViewController(WebView, animated: true)
      }
}
