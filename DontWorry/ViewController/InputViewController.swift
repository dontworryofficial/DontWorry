import UIKit

class InputViewController: UIViewController {
    
    @IBOutlet weak var inputSegment: UISegmentedControl!
    @IBOutlet weak var expensesView: UIView!
    @IBOutlet weak var incomeView: UIView!
    
    override func viewDidLoad() {
        
        customNavigationItems()
        
        super.viewDidLoad()
        
    }
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        if inputSegment.selectedSegmentIndex == 0 {
            expensesView.alpha = 1
            incomeView.alpha = 0
        }else if inputSegment.selectedSegmentIndex == 1 {
            expensesView.alpha = 0
            incomeView.alpha = 1
            
        }
    }
    
    private func customNavigationItems(){
        
        let title = UILabel(frame: CGRect(x: 0, y: 0, width: 34, height: 34))
        title.text = "지출/수입"
        navigationItem.titleView = title
        
        let backBtn = UIButton(type: .custom)
        backBtn.setImage(#imageLiteral(resourceName: "back").withRenderingMode(.alwaysOriginal), for: .normal)
        backBtn.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        backBtn.addTarget(self, action: #selector(self.backAction(_:)), for: UIControl.Event.touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backBtn)
        
        
        let plusBtn = UIButton(type: .system)
        plusBtn.setImage(#imageLiteral(resourceName: "add").withRenderingMode(.alwaysOriginal), for: .normal)
        plusBtn.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: plusBtn)
        
    }
    
    
    @IBAction func backAction(_ sender: UIButton) {
        let _ = self.navigationController?.popViewController(animated: true)
    }
    
    
}
