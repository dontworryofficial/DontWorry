//
//  CompareViewController.swift
//  DontWorry
//
//  Created by 박아영 on 03/04/2019.
//  Copyright © 2019 SeongJoon Kim. All rights reserved.
//

import UIKit
import Charts

class CompareViewController: UIViewController {
    
    @IBOutlet weak var barChartView: BarChartView!
    var months: [String]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
        setChart(dataPoint: months, values: unitsSold)
        

        // Do any additional setup after loading the view.
    }
    
    func setChart(dataPoint: [String], values: [Double]){
        barChartView.noDataText = "You need to provide data for the chart."
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
