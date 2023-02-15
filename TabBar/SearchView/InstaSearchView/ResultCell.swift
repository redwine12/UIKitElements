//
//  ResultCell.swift
//  InstaSearchView
//
//  Created by 이재영 on 2023/01/09.
//

import UIKit

class ResultCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    // cell 이 재사용되기전 준비함
    override func prepareForReuse() {
        super.prepareForReuse()
        
        // 재사용될때 이미지 리셋
        thumbnailImageView.image = nil
    }
    
    func configure(_ imageName: String){
        thumbnailImageView.image = UIImage(named: imageName)
    }
}
