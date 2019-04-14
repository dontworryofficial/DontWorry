//
//  IncomeViewController.swift
//  DontWorry
//
//  Created by 박아영 on 14/04/2019.
//  Copyright © 2019 SeongJoon Kim. All rights reserved.
//

import UIKit

class IncomeViewController: UIViewController {
    
   
    @IBOutlet weak var IncomeCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {

        self.IncomeCollectionView.dataSource = self
        
        super.viewDidLoad()
    }
}

extension IncomeViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : IncomeCategoryCollectionViewCell = self.IncomeCollectionView.dequeueReusableCell(withReuseIdentifier: "IncomeCategoryCollectionViewCell", for: indexPath) as! IncomeCategoryCollectionViewCell
        
        cell.categoryLabel.text = "Category"
        
        return cell
    }
    
        

}
