//
//  FrameworkCell.swift
//  AppleFramework
//
//  Created by 이재영 on 2023/01/09.
//

import UIKit

class FrameworkCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameLabel.numberOfLines = 1
        // cell 에 따라서 폰트를 조정시키는 것
        nameLabel.adjustsFontSizeToFitWidth = true
    }
    
    // framework 데이터를 받아서 cell을 업데이트
    func configure(_ framework: AppleFramework){
        thumbnailImageView.image = UIImage(named: framework.imageName)
        nameLabel.text = framework.name
    }
}
