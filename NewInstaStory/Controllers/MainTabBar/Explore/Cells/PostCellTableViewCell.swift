//
//  PostCellTableViewCell.swift
//  NewInstaStory
//
//  Created by Baziq Hameed on 05/02/2026.
//

import UIKit

class PostCellTableViewCell: UITableViewCell {
    
    @IBOutlet var userImage: UIImageView!
    @IBOutlet var userName: UILabel!
    
    @IBOutlet var imagePost: UIImageView!
    @IBOutlet var label: UILabel!
    @IBOutlet var commentlabel: UILabel!
    
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var commentButton: UIButton!
    @IBOutlet var shareButton: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let minSide = min(userImage.frame.width, userImage.frame.height)
        userImage.layer.cornerRadius = minSide / 2
        userImage.clipsToBounds = true
    }
    
    @IBAction func likePressed(){
        
        print("like pressed")
        
    }

    @IBAction func commentPressed(){
        
        print("comment pressed")
        
    }
    @IBAction func sharePressed(){
        
        print("share pressed")
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
