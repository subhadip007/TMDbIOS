//
//  DetailsViewController.swift
//  TextXib
//
//  Created by Zaggle on 18/10/22.
//

import UIKit

class DetailsViewController: UIViewController {

    
  

    
    @IBOutlet weak var movieTitle: UILabel!
    
    
    @IBOutlet weak var moviePoster: CustomImageView!
    @IBOutlet weak var releaseDate: UILabel!
    
    
    @IBOutlet weak var movieOverview: UITextView!
    
    
    var coverTitle:String =  ""
    var release:String = ""
    var overview:String = ""
    var imgUrl:URL = URL(string: "https://image.tmdb.org/t/p/original/pHkKbIRoCe7zIFvqan9LFSaQAde.jpg")!
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.movieTitle.text = self.coverTitle
            self.releaseDate.text = self.release
            self.movieOverview.text = self.overview
            self.moviePoster.lazyLoadImage(url: self.imgUrl)
        }
        
    }

    
    

    

}
