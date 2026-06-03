//
//  ExploreViewController.swift
//  NewInstaStory
//
//  Created by Baziq Hameed on 04/02/2026.
//

import UIKit

class ExploreViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    var imageData = ["me", "me", "me","me", "me 2", "me","me 2", "me", "me 2","me", "me", "me", "me 2"]
    var filteredData: [String] = []
    
    @IBOutlet var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        let nib = UINib(nibName: "ExploreCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "ExploreCollectionViewCell")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nibTable = UINib(nibName: "ExploreTableViewCell", bundle: nil)
        tableView.register(nibTable, forCellReuseIdentifier: "ExploreTableViewCell")

        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        let textField = searchBar.searchTextField
        textField.layer.cornerRadius = 20
        textField.clipsToBounds = true
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageData.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        let spacing: CGFloat = 1
        let width = (collectionView.frame.width) / 3
    
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExploreCollectionViewCell", for: indexPath) as! ExploreCollectionViewCell
        
        cell.configure(with: imageData[indexPath.row])
        return cell
    }
}

extension ExploreViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExploreTableViewCell", for: indexPath) as! ExploreTableViewCell
        
        cell.configure(withimage: filteredData[indexPath.row], andlabel: filteredData[indexPath.row])
        
        return cell
    }
    
}

extension ExploreViewController {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        let isEmpty = searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty

            if isEmpty {
                filteredData.removeAll()
                tableView.isHidden = true
                collectionView.isHidden = false
            } else {
                filteredData = imageData.filter {
                    $0.localizedCaseInsensitiveContains(searchText)
                }
                tableView.isHidden = false
                collectionView.isHidden = true
            }

            tableView.reloadData()
        }

        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            searchBar.text = ""
            searchBar.resignFirstResponder()
            filteredData.removeAll()
            tableView.isHidden = true
            collectionView.isHidden = false
            tableView.reloadData()
        }
}
