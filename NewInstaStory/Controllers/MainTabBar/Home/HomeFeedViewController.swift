//
//  HomeFeedViewController.swift
//  NewInstaStory
//
//  Created by Baziq Hameed on 04/02/2026.
//

import UIKit

class HomeFeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var tableView: UITableView!
    var myData = ["Looking Good", "Sunflower", "Instgram Testing"]
    var myProfile = ["Baziq", "Umer", "Developer"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "PostCellTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "PostCellTableViewCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCellTableViewCell", for: indexPath) as! PostCellTableViewCell
        
        cell.userImage.image = UIImage(named: "me")
        cell.userName.text = myProfile[indexPath.row]
        
        cell.imagePost.image = UIImage(named: "me")
//        cell.imagePost.backgroundColor = .black
        cell.label.text = myProfile[indexPath.row]
        cell.commentlabel.text = myData[indexPath.row]
        
        
        return cell
    }
    
        

}
