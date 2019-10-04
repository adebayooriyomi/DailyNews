//
//  CustomImageView.swift
//  Daily News
//
//  Created by Adebayo Oriyomi on 2019-10-03.
//  Copyright © 2019 Adebayo Oriyomi. All rights reserved.
//

import Foundation
import UIKit

let imageCache = NSCache<NSString, UIImage>()

class CustomImageView: UIImageView {
    
    
    var imageUrlString: String?
    
    func loadImageUsingUrlString(_ urlString: String) {
        
       // print(urlString)
        imageUrlString = urlString
        
        guard let url = URL(string: urlString) else { return }
        
        image = nil
        
        if let imageFromCache = imageCache.object(forKey: urlString as NSString) {
            self.image = imageFromCache
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, respones, error) in
            
            if error != nil {
                print(error!)
                return
            }
            
            DispatchQueue.main.async(execute: {
                
                guard let imageToCache = UIImage(data: data!) else { return }
                
                if self.imageUrlString == urlString {
                    self.image = imageToCache
                }
                
                imageCache.setObject(imageToCache, forKey: urlString as NSString )
            })
            
        }).resume()
    }
    
}



