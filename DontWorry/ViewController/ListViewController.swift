//
//  ListViewController.swift
//  DontWorry
//
//  Created by 박아영 on 03/04/2019.
//  Copyright © 2019 SeongJoon Kim. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.listTableView.dataSource = self
        self.listTableView.delegate = self
        
    }
    

    // MARK: - List Table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index: Int = indexPath.row
        
        if index == 0 {
            let cell: TotalCell = self.listTableView.dequeueReusableCell(withIdentifier: "TotalCell", for: indexPath) as! TotalCell
            return cell
        } else if index == 1 {
            let cell: DateCell = self.listTableView.dequeueReusableCell(withIdentifier: "DateCell", for: indexPath) as! DateCell
            return cell
        } else {
            let cell: DateDetailCell = self.listTableView.dequeueReusableCell(withIdentifier: "DateDetailCell", for: indexPath) as! DateDetailCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
}
