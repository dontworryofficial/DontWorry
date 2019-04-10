
import UIKit

class ExpensesViewController: UIViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!

    override func viewDidLoad() {
        
        self.categoryCollectionView.dataSource = self
        
        super.viewDidLoad()

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
