//
//  ExploreTableViewCell.swift
//  NewInstaStory
//
//  Created by Baziq Hameed on 10/02/2026.
//

import UIKit

class ExploreTableViewCell: UITableViewCell {
    
    @IBOutlet var uiimage: UIImageView!
    @IBOutlet var label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        uiimage.layoutIfNeeded()
        
        let minSize = min(uiimage.bounds.width, uiimage.bounds.height)
        let radius = minSize / 2

        if uiimage.layer.cornerRadius != radius {
            uiimage.layer.cornerRadius = radius
            uiimage.clipsToBounds = true
        }
        
    }

    
    func configure(withimage image: String, andlabel label: String){
        
        print(image)
        
        if let searchImage = UIImage(named: image) {
            uiimage.image = searchImage
        }
        else {
            uiimage.image = UIImage(named: "me")
        }
        
        self.label.text = label
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
