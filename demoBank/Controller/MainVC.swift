//
//  MainVC.swift
//  demoBank
//
//  Created by Abcom on 08/08/24.
//

import UIKit

class MainVC: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!

    var istyping = false
    
    var filteredData: [String] = []
    var imagesarr: [UIImage] = [
        UIImage(named: "1")!,
        UIImage(named: "2")!,
        UIImage(named: "3")!,
        UIImage(named: "4")!,
        UIImage(named: "5")!,
        UIImage(named: "6")!,
        UIImage(named: "7")!,
        UIImage(named: "8")!,
        UIImage(named: "9")!,
        UIImage(named: "10")!,
        UIImage(named: "1")!,
        UIImage(named: "2")!,
        UIImage(named: "3")!,
        UIImage(named: "4")!,
        UIImage(named: "5")!
    ]
    var nameArr: [String] = ["sunset beach",
                             "mountain hike",
                             "city skyline",
                             "forest trail",
                             "desert dunes",
                             "ocean waves",
                             "snowy mountains",
                             "countryside path",
                             "autumn leaves",
                             "city park","sunset beach",
                             "mountain hike",
                             "city skyline",
                             "forest trail",
                             "desert dunes"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filteredData = nameArr
    }
    
}
extension MainVC : UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesarr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imgCollCell", for: indexPath) as! imgCollCell
        cell.imgView.image = imagesarr[indexPath.row]
        return cell
    }
}

extension MainVC : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    // UITableView DataSource and Delegate Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 || section == 1 {
            return 1
        } else {
            return filteredData.isEmpty ? nameArr.count : filteredData.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath) as! dataCell
            cell.collectionView.delegate = self
            cell.collectionView.dataSource = self
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "searchfieldCell", for: indexPath) as! searchfieldCell
            cell.searchBar.delegate = self
            cell.searchBar.placeholder = "Search"
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "filtercell", for: indexPath) as! filtercell
            cell.lblTextData.text = filteredData[indexPath.row]
            cell.imgblank.image = imagesarr[indexPath.row]
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            if istyping == false {
                return 200
            } else {
                return 0
            }
        } else if indexPath.section == 1 {
            return 50
        } else {
            return UITableView.automaticDimension
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Search text: \(searchText)")
        if searchText.isEmpty {
            istyping = false
            filteredData = nameArr
            tableView.reloadData()
        } else {
            istyping = true
            filteredData = nameArr.filter { $0.lowercased().hasPrefix(searchText.lowercased()) }
        }
        print("Filtered Data: \(filteredData)")
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        istyping = true
        return true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        tableView.reloadData()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("\(scrollView.contentOffset.y)")
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let contentOffsetY = scrollView.contentOffset.y
        
        if contentOffsetY > 250 {
            istyping = true
        } else {
            istyping = false
        }
        tableView.reloadData()
    }
    
}

