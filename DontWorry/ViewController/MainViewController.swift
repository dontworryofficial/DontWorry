//
//  MainViewController.swift
//  DontWorry
//
//  Created by SeongJoon Kim on 15/03/2019.
//  Copyright © 2019 SeongJoon Kim. All rights reserved.
//

import UIKit
import Charts

class MainViewController: UIViewController {

    @IBOutlet weak var pieChartView: PieChartView!
    
    @IBOutlet weak var inMyPocketView: UIView!
    @IBOutlet weak var inMyPocket: UILabel!
    
    @IBOutlet weak var spendingLimitView: UIView!
    @IBOutlet weak var spendingLimit: UIButton!
    
    let numberFormatter = NumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("test11111")

        pieChartLoad()
        
        spendingLimit.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        spendingLimit.titleLabel?.textAlignment = NSTextAlignment.center
        spendingLimit.setTitle("터치하여 \n목표지출 금액을 \n설정하세요", for: .normal)
    }
    
    func pieChartLoad() {
        // 사이즈
        pieChartView.holeRadiusPercent = 0.6
        pieChartView.rotationEnabled = false
        pieChartView.animate(xAxisDuration: 1, yAxisDuration: 1)
        // 차트 클릭 확대
        pieChartView.highlightPerTapEnabled = true
        pieChartView.legend.enabled = false
        
        let meal = PieChartDataEntry(value: 40)
        let coffee = PieChartDataEntry(value: 20)
        let hobby = PieChartDataEntry(value: 10)
        let etc = PieChartDataEntry(value: 30)
        
        var chart = [PieChartDataEntry]()
        chart = [meal, coffee, hobby, etc]
        
        let chartDataSet = PieChartDataSet(values: chart, label: nil)
//        chartDataSet.selectionShift = 10.0
        chartDataSet.sliceSpace = 0
        // 차트 숫자라벨 없애기
        chartDataSet.drawValuesEnabled = false
        
        let chartData = PieChartData(dataSet: chartDataSet)
        let colors = [UIColor.red, UIColor.purple, UIColor.yellow, UIColor.green]
        chartDataSet.colors = colors
        
        pieChartView.data = chartData
    }
    
    
    
    // MARK: - Action
    @IBAction func settingGoal(_ sender: UIButton) {
        let inputAlert = UIAlertController(title: "목표지출 금액을 입력하세요.", message: nil, preferredStyle:.alert)
        
        let ok = UIAlertAction(title: "확인", style:.default) { (ok) in
            //self.budgetLabel.text = inputAlert.textFields?[0].text
            var resultBudget : String = (inputAlert.textFields?[0].text)!
            
            self.numberFormatter.numberStyle = .decimal
            self.numberFormatter.maximumFractionDigits = 0 //소수점 몇자리까지 허용하는지
            
            resultBudget = resultBudget.replacingOccurrences(of: ",", with: "", options: .literal, range: nil)
            
            resultBudget = self.numberFormatter.string(from: NSNumber(value: Double(resultBudget)!))!
            
            self.inMyPocket.text = resultBudget
            self.spendingLimitView.isHidden = true
            self.inMyPocketView.isHidden = false
            // self.goalSpend.setTitle("\(resultBudget)", for: .normal)
            
        }
        
        let cancle = UIAlertAction(title: "취소", style: .destructive, handler: nil)
        
        inputAlert.addAction(cancle)
        inputAlert.addAction(ok)
        
        inputAlert.addTextField { (textField) in
            var replace = self.inMyPocket.text
            print(replace!)
            replace = replace?.replacingOccurrences(of: ",", with: "", options: .literal, range: nil)
            print(replace!)
            textField.text = replace
            textField.placeholder = "0원"
            textField.keyboardType = UIKeyboardType.numberPad
        }
        
        self.present(inputAlert,animated: false,completion: nil)
    }
    
}
