

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var homeView: UIView!
    @IBOutlet weak var listView: UIView!
    @IBOutlet weak var statsView: UIView!
    @IBOutlet weak var compareView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeSelected()
        setupNavigationBarItems()
    }
    
    func setupNavigationBarItems() {
        let settingButton = UIButton(type: UIButton.ButtonType.custom)
        settingButton.setImage(#imageLiteral(resourceName: "setting"), for: UIControl.State.normal)
        settingButton.tintColor = UIColor.black
        settingButton.frame = CGRect(x: 0, y: 0, width: 1, height: 1)
       
        
        let helpButton = UIButton(type: UIButton.ButtonType.custom)
        helpButton.setImage(#imageLiteral(resourceName: "help"), for: UIControl.State.normal)
        helpButton.tintColor = UIColor.black
        helpButton.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        
        let settingMenuBarItem = UIBarButtonItem(customView: settingButton)
        let helpMenuBarItem = UIBarButtonItem(customView: helpButton)
        self.navigationItem.rightBarButtonItems = [settingMenuBarItem, helpMenuBarItem]
    }
    
    @IBAction func homeSelected() {
        self.homeView.alpha = 1
        self.listView.alpha = 0
        self.statsView.alpha = 0
        self.compareView.alpha = 0
    }
    
    @IBAction func listSelected() {
        self.homeView.alpha = 0
        self.listView.alpha = 1
        self.statsView.alpha = 0
        self.compareView.alpha = 0
    }

    @IBAction func statsSelected() {
        self.homeView.alpha = 0
        self.listView.alpha = 0
        self.statsView.alpha = 1
        self.compareView.alpha = 0
    }
    
    @IBAction func compareSelected() {
        self.homeView.alpha = 0
        self.listView.alpha = 0
        self.statsView.alpha = 0
        self.compareView.alpha = 1
    }
}
