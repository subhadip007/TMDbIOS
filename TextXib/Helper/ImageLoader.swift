//
//  ImageLoader.swift
//  TextXib
//
//  Created by Zaggle on 18/10/22.
//

import Foundation
import UIKit
import Alamofire
import Kingfisher


class CustomImageView:UIImageView{
    
//    var task:DataRequest!
    //    var imageCache = NSCache<AnyObject,AnyObject>()
    func lazyLoadImage(url:URL){
//        image = nil
//        if let task = task{
//            task.cancel()
//        }
        
        
        self.kf.setImage(with: url)
        
        
        //        task = AF.request(url).response{ response  in
        //            guard let newImage = UIImage(data: response.data ?? Data()) else{
        //                print("error loading Image")
        //                return
        //            }
        //            self.imageCache.setObject(newImage, forKey: url.absoluteString as AnyObject)
        //
        //            DispatchQueue.main.async {
        //                self.image = newImage
        //            }
        //
        //        }
        //
        //        task.resume()
        //
        //    }
    }
}
