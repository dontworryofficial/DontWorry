
import UIKit

class ExpensesViewController: UIViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var paymentBtn: UIButton!
    

    override func viewDidLoad() {
        
        self.categoryCollectionView.dataSource = self
        super.viewDidLoad()

    }

    @IBAction func paymentChanged(_ sender: UIButton) {
        
        var alert = UIAlertController(title: "결제방식", message: nil, preferredStyle: .actionSheet)
        let creditCard = UIAlertAction(title: "신용카드", style: .default) { (UIAlertAction) in
            self.paymentBtn.titleLabel?.text = "신용카드"
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(creditCard)
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
