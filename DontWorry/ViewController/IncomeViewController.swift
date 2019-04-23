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
    @IBOutlet weak var dateTextField: UITextField!
    
    private var datePicker = UIDatePicker()
    let date = Date()
    let dateformatter = DateFormatter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.IncomeCollectionView.dataSource = self
        
        self.dateformatter.dateFormat = "yyyy년 MM월 dd일 a HH:mm"
        dateTextField.borderStyle = .none
        dateTextField.tintColor = UIColor.clear
        dateTextField.text = dateformatter.string(from: date)
        
    }
    
//    func dateSet() {
//
//    }
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

extension UIToolbar {
    func ToolbarPicker(mySelct : Selector) -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.barStyle = UIBarStyle.default
        toolbar.isTranslucent = true
        toolbar.tintColor = UIColor.black
        toolbar.sizeToFit()
        
        
        return toolbar
    }
}
