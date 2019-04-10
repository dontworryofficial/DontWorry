//
//  HomeViewController.swift
//  DontWorry
//
//  Created by 박아영 on 03/04/2019.
//  Copyright © 2019 SeongJoon Kim. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var incomeView: UIView!
    @IBOutlet weak var expenseView: UIView!
    @IBOutlet weak var targetSpendSetBtn: UIButton!
    @IBOutlet weak var targetSpendLabel: UILabel!
    @IBOutlet weak var targetSpendStackView: UIStackView!
    
    let numberFormatter = NumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        incomeView.layer.cornerRadius = 10
        incomeView.layer.borderColor = UIColor.lightGray.cgColor
        incomeView.layer.borderWidth = 1
        
        expenseView.layer.cornerRadius = 10
        expenseView.layer.borderColor = UIColor.lightGray.cgColor
        expenseView.layer.borderWidth = 1
    }
    

    @IBAction func targetSpendSetting(_ sender: UIButton) {
        
        let inputAlert = UIAlertController(title: "목표 지출 금액", message: nil, preferredStyle:.alert)
        
        let ok = UIAlertAction(title: "확인", style:.default) { (ok) in
            //self.budgetLabel.text = inputAlert.textFields?[0].text
            var resultBudget : String = (inputAlert.textFields?[0].text)!
            
            self.numberFormatter.numberStyle = .decimal
            self.numberFormatter.maximumFractionDigits = 0 //소수점 몇자리까지 허용하는지
            
            resultBudget = resultBudget.replacingOccurrences(of: ",", with: "", options: .literal, range: nil)
            
            resultBudget = self.numberFormatter.string(from: NSNumber(value: Double(resultBudget)!))!
            
            
            self.targetSpendSetBtn.isHidden = true
            self.targetSpendStackView.isHidden = false
            self.targetSpendLabel.text = resultBudget
            
            print(self.targetSpendLabel.text!)
        }
        
        let cancle = UIAlertAction(title: "취소", style: .destructive, handler: nil)
        
        inputAlert.addAction(cancle)
        inputAlert.addAction(ok)
        
        inputAlert.addTextField { (textField) in
            textField.keyboardType = UIKeyboardType.numberPad
        }
        
        present(inputAlert,animated: false,completion: nil)
    }
    

}
