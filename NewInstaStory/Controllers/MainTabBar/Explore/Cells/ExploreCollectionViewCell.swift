//
//  ExploreCollectionViewCell.swift
//  NewInstaStory
//
//  Created by Baziq Hameed on 05/02/2026.
//

import UIKit

class ExploreCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var exploreImage: UIImageView!
    
    var image = UIImage()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with image: String){
        
        if let loadedImage = UIImage(named: image) {
            self.image = loadedImage
        } else {
            print("Image \(image) not found!")
        }

        exploreImage.image = self.image
        
        let displayedSize = exploreImage.frame.size
        print("Image view size: \(displayedSize)")
        
    }

}
