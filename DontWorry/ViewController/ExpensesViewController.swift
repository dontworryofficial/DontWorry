
import UIKit

class ExpensesViewController: UIViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var paymentBtn: UIButton!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var moneyTextField: UITextField!
    @IBOutlet weak var memoTextView: UITextView!
    
    var datePickerClass = DatePicker()
    
    private var datePicker = UIDatePicker()
    let date = Date()
    let dateformatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.categoryCollectionView.dataSource = self
        self.dateformatter.dateFormat = "yyyy년 MM월 dd일 a H:mm"
        
        let stringDate = dateformatter.string(from: date)
        dateTextField.text = stringDate
        
        moneyTextField.borderStyle = .none
        dateTextField.borderStyle = .none
        dateTextField.tintColor = UIColor.clear
    
        //dateSet()
    }
    
    
    
    
    @objc func keyboardWillShow(_ sender: Notification){
    
    }
    
    @IBAction func dateFieldClicked() {
        
        datePickerClass.dateSet(dateTextField)
    }
    
    
//    func dateSet(){
//        
//        let toolbar = UIToolbar().ToolbarPicker(mySelect: #selector(ExpensesViewController.dateDone))
//        dateTextField.inputAccessoryView = toolbar
//
//        datePicker = UIDatePicker()
//        datePicker.datePickerMode = .dateAndTime
//        
//        dateTextField.inputView = datePicker
//        dateTextField.text = dateformatter.string(from: datePicker.date)
//        
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ExpensesViewController.viewtapped))
//        view.addGestureRecognizer(tapGesture)
//        
//        
//    }
//    
    @objc func dateDone(){
        dateTextField.text = dateformatter.string(from: datePicker.date)
        view.endEditing(true)
    }
    
    @objc func viewtapped(gesture: UITapGestureRecognizer) {
        view.endEditing(true)
    }

    @IBAction func moneyDidBegin(_ sender: Any) {
        moneyTextField.text = ""
    }
    
    
    @IBAction func moneyChanged(_ sender: Any) {
        
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


//카테고리 컬렉션뷰
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

//완료버튼 toolbar
extension UIToolbar {
    func ToolbarPicker(mySelect : Selector) -> UIToolbar {
        let toolbar = UIToolbar()
        
        toolbar.barStyle = UIBarStyle.default
        toolbar.isTranslucent = true
        toolbar.tintColor = UIColor.black
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(title: "완료", style: UIBarButtonItem.Style.plain, target: self, action: mySelect)
        let spaceBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        toolbar.setItems([spaceBtn,doneBtn], animated: false)
        toolbar.isUserInteractionEnabled = true
        
        return toolbar
    }
}
