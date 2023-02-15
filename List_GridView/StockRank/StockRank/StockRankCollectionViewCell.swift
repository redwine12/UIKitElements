//
//  StockRankCollectionViewCell.swift
//  StockRank
//
//  Created by 이재영 on 2023/01/06.
//

import UIKit

class StockRankCollectionViewCell: UICollectionViewCell {
    // UI Components 연결
    // UI Components 에 데이터를 업데이트 하는 코드 작성
    
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var companyIconImageView: UIImageView!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var companyPriceLabel: UILabel!
    @IBOutlet weak var diffLabel: UILabel!
    
    func configure(_ stock: StockModel){
        rankLabel.text = "\(stock.rank)"
        companyIconImageView.image = UIImage(named: stock.imageName)
        companyName.text = stock.name
        companyPriceLabel.text = "\(convertToCurrencyFormat(price: stock.price)) 원"
        if stock.diff > 0 {
            diffLabel.textColor = UIColor.systemRed
        }
        else{
            diffLabel.textColor = UIColor.systemBlue
        }
        diffLabel.text = "\(stock.diff)%"

    }
    
    func convertToCurrencyFormat(price: Int) -> String{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        let result = numberFormatter.string(from: NSNumber(value: price))!
        return result
    }
    
}
