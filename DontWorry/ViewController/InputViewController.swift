import UIKit

class InputViewController: UIViewController {
    
    @IBOutlet weak var inputSegment: UISegmentedControl!
    @IBOutlet weak var expensesView: UIView!
    @IBOutlet weak var incomeView: UIView!
    
    override func viewDidLoad() {
        
        customNavigationItems()
        
        super.viewDidLoad()
        
    }
    
    //지출/수입 전환 세그먼트
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        if inputSegment.selectedSegmentIndex == 0 {
            expensesView.alpha = 1
            incomeView.alpha = 0
        }else if inputSegment.selectedSegmentIndex == 1 {
            expensesView.alpha = 0
            incomeView.alpha = 1
            
        }
    }
    
    //네비게이션 커스텀
    private func customNavigationItems(){
        
        let title = UILabel(frame: CGRect(x: 0, y: 0, width: 34, height: 34))
        title.text = "지출/수입"
        navigationItem.titleView = title
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(self.backAction(_:)))
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: nil)
        
    }
    
    
    @IBAction func backAction(_ sender: UIButton) {
        let _ = self.navigationController?.popViewController(animated: true)
    }
    
    
}
