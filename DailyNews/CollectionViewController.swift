//
//  CollectionViewController.swift
//  Daily News
//
//  Created by Adebayo Oriyomi on 2019-09-25.
//  Copyright © 2019 Adebayo Oriyomi. All rights reserved.
//

import UIKit
import PromiseKit
import Alamofire


class CollectionViewController: UICollectionViewController {
    
    var newsArticles: [DailyFeedModel] = [] {
           didSet {
               DispatchQueue.main.async {
                self.collectionView.reloadData()
                print(self.newsArticles.count)
               }
           }
       }
       

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        firstly {
            NewsAPI.getNewsArticles()
        }.done { result in
            self.newsArticles = result.articles
        }
    }

   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        let destination = segue.destination as! WebViewController
        let cell = sender as! CollectionViewCell
        let indexPath = self.collectionView.indexPath(for: cell)
        let url = newsArticles[indexPath!.row].url
        destination.url = url
        
    }
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return newsArticles.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reuseIdentifier", for: indexPath) as! CollectionViewCell
    
        // Configure the cell
        let articleImage = newsArticles[indexPath.row].urlToImage ?? "https://dummyimage.com/600x400/f7f7f7/000000&text=N"
        
        let img = cell.cImage as! CustomImageView
        img.loadImageUsingUrlString(articleImage)
               
        cell.cNewsHeadline.text = newsArticles[indexPath.row].title
        cell.source.text = newsArticles[indexPath.row].source?.name
        cell.cImage.layer.cornerRadius = 8
        
        let publishDate = newsArticles[indexPath.row].publishedAt ?? ""
        cell.timePosted.text = dateFormat(publishDate: publishDate)
        //cell.timePosted.text =  publishDate
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
