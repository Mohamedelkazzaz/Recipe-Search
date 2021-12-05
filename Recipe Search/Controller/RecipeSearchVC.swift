//
//  RecipeSearchVC.swift
//  Recipe Search
//
//  Created by Mohamed Elkazzaz on 28/11/2021.
//

import UIKit

class RecipeSearchVC: UIViewController {

    @IBOutlet weak var filterCollectionView: UICollectionView!
    @IBOutlet weak var search: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    let titlesArr = ["ALL","Low Sugar","Keto","Vegan"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib.init(nibName: "RecipeCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "RecipeCell")

        filterCollectionView.delegate = self
        filterCollectionView.dataSource = self
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    

    

}

extension RecipeSearchVC: UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titlesArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilterCell", for: indexPath) as! FilterCell
        cell.setup(text: titlesArr[indexPath.row])
        return cell
    }
    
    
    
}

extension RecipeSearchVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath) as! RecipeCell
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let VC = storyboard?.instantiateViewController(withIdentifier: "RecipeDetailsVC") as! RecipeDetailsVC
            
            self.navigationController?.pushViewController(VC , animated: true)
    }
    
    
}
