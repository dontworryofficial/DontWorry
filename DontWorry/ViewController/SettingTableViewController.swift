//
//  SettingTableViewController.swift
//  DontWorry
//
//  Created by SeongJoon Kim on 17/04/2019.
//  Copyright © 2019 SeongJoon Kim. All rights reserved.
//

import UIKit

class SettingTableViewController: UITableViewController {
    
//    @IBOutlet weak var settingTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBarItems()
        
//        settingTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: UIApplication.shared.keyWindow!.safeAreaInsets.bottom, right: 0)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    func setupNavigationBarItems() {
        let backButton = UIButton(type: UIButton.ButtonType.custom)
        backButton.setImage(#imageLiteral(resourceName: "back"), for: UIControl.State.normal)
        backButton.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        backButton.tintColor = UIColor.black
        backButton.addTarget(self, action: #selector(backButtonClicked), for: UIControl.Event.touchUpInside)
        
        let settingBarItem = UIBarButtonItem(customView: backButton)
        self.navigationItem.leftBarButtonItem = settingBarItem
        self.navigationItem.title = "설정"
    }

    
    // MARK: - Action
    @objc func backButtonClicked() {
        self.navigationController?.popViewController(animated: true)
    }
}
