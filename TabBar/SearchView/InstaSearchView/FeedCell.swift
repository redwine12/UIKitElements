//
//  FeedCell.swift
//  InstaSearchView
//
//  Created by 이재영 on 2023/01/11.
//

import UIKit

class FeedCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    // 셀 재사용을위해 이미지 초기화
    override func prepareForReuse() {
        super.prepareForReuse()
        thumbnailImageView.image = nil
    }
    
    
    func configure(_ imageName : String){
        thumbnailImageView.image = UIImage(named: imageName)
    }
}
