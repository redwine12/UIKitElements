//
//  OnboardingCell.swift
//  NRCOnboarding
//
//  Created by 이재영 on 2023/01/12.
//

import UIKit

class OnboardingCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var discriptionLabel: UILabel!
    
    func configure(_ message: OnboardingMessage){
        thumbnailImageView.image = UIImage(named: message.imageName)
        titleLable.text = message.title
        discriptionLabel.text = message.description
    }
}
