

import UIKit

class QuickFocusHeaderView: UICollectionReusableView {
        
    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(_ title: String){
        titleLabel.text = title
    }
}
