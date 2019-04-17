
import UIKit

class ExpensesViewController: UIViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var paymentBtn: UIButton!
    @IBOutlet weak var dateTextField: UITextField!
    
    private var datePicker : UIDatePicker?
    let date = Date()
    let dateformatter = DateFormatter()
    
    override func viewDidLoad() {
        
        self.categoryCollectionView.dataSource = self
        super.viewDidLoad()
        
        self.dateformatter.dateFormat = "yyyy년 MM월 dd일 a H:mm"
        let stringDate = dateformatter.string(from: date)
        dateTextField.text = stringDate
        
        dateSet()
        
        
    }
    
    func dateSet(){
        
        dateTextField.borderStyle = .none
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .dateAndTime

        view.endEditing(true)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ExpensesViewController.viewtapped))
        
        view.addGestureRecognizer(tapGesture)
        
        dateTextField.inputView = datePicker
        
        dateTextField.text = dateformatter.string(from: datePicker!.date)
    }
    
    @objc func viewtapped(gesture: UITapGestureRecognizer) {
        view.endEditing(true)
    }


    @IBAction func paymentChanged(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "결제방식", message: nil, preferredStyle: .actionSheet)
        
        let creditCard = UIAlertAction(title: "신용카드", style: .default) { (UIAlertAction) in
            self.paymentBtn.setTitle("신용카드", for: UIControl.State.normal)
        }
        
        let checkCard = UIAlertAction(title: "체크카드", style: .default) { (UIAlertAction) in
            self.paymentBtn.setTitle("체크카드", for: UIControl.State.normal)
        }
        
        let cash = UIAlertAction(title: "현금", style: .default) { (UIAlertAction) in
            self.paymentBtn.setTitle("현금", for: UIControl.State.normal)
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(creditCard)
        alert.addAction(checkCard)
        alert.addAction(cash)
        alert.addAction(cancel)
        
        present(alert, animated: false, completion: nil)
        
    }
    
    

}


extension ExpensesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CategoryCollectionViewCell = self.categoryCollectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        cell.categoryLabel.text = "category"
        return cell
    }
    
    
}
