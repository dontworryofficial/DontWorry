//
//  DatePicker.swift
//  DontWorry
//
//  Created by 박아영 on 01/05/2019.
//  Copyright © 2019 SeongJoon Kim. All rights reserved.
//

import Foundation
import UIKit

class DatePicker: NSObject {
    
    func dateSet(_ dateTextField: UITextField){
        
        let dateformatter = DateFormatter()
        
        let toolbar = UIToolbar().ToolbarPicker(mySelect: #selector(ExpensesViewController.dateDone))
        dateTextField.inputAccessoryView = toolbar
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .dateAndTime
        
        dateTextField.inputView = datePicker
        dateTextField.text = dateformatter.string(from: datePicker.date)
    
    }
    
}
