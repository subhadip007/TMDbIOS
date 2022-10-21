//
//  TableViewTableViewCell.swift
//  TextXib
//
//  Created by Zaggle on 14/10/22.
//

import UIKit
import Alamofire
class TableViewTableViewCell: UITableViewCell{
    func didUpdateMovies() {
        //
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    @IBOutlet weak var movieRate: CirculerUIView!
    
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var moviePoster: CustomImageView!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    var rating:Float = 0.00
    var color:UIColor{
        if(rating >= 7.0){
            return UIColor.green
        }else if(rating >= 5.0){
            return UIColor.orange
        }else if(rating < 5.0){
            return UIColor.red
        }
        
        
        return UIColor.white
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        moviePoster.layer.masksToBounds = true
        moviePoster.layer.borderWidth = 1.5
        moviePoster.layer.borderColor = UIColor.white.cgColor

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
//        movieManeger.getData(completion: { data in
//            print(data)
//            
//        })
        
      
        
        movieRate.trackClr = UIColor.white
        


    }
    
    func setProperties(title:String,date:String,rating:Float,urlNew:String){
        
        
        DispatchQueue.main.async {
            
            
            self.movieTitle.text = title
            self.releaseDate.text = date
            self.rating = rating
            self.movieRating.text = "\(String(Int(rating*10)))%"
            
            if let url = URL(string: urlNew){
                self.moviePoster.lazyLoadImage(url: url)
            }
            
            self.movieRate.progressClr = self.color
            self.movieRate.setProgressWithAnimation(duration: 1.0, value: self.rating/10)
        }
    
        
    }
    
    
    
    }

