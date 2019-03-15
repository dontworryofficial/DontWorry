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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pieChartLoad()
        
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
    
}
