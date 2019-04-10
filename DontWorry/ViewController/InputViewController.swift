import UIKit

class InputViewController: UIViewController {
    @IBOutlet weak var inputSegment: UISegmentedControl!
    @IBOutlet weak var expensesView: UIView!
    @IBOutlet weak var incomeView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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
    
    
}
