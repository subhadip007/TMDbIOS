//
//  CollectionViewCell.swift
//  TextXib
//
//  Created by Zaggle on 14/10/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: CustomImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageView.image = UIImage(systemName: "film.circle")
    }

    
    func setProperties(url:String){
        DispatchQueue.main.async {
            if let url = URL(string: url){
                self.imageView.lazyLoadImage(url: url)
            }
        }
        
    }
}
