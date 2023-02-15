//
//  StockRankViewController.swift
//  StockRank
//


import UIKit

class StockRankViewController: UIViewController {
    
    let stockList: [StockModel] = StockModel.list

    @IBOutlet weak var CollectionView: UICollectionView!
    
    // Data, Presentation, Layout
    // Data : 어떤 data 사용할것인가 -> StockModel 파일에 저장한 것들의 리스트(stockList)로 사용
    // Presentation : 셀을 어떻게 표현할 것인가
    // Layout : 셀을 어떻게 배치할것인가
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CollectionView.dataSource = self
        CollectionView.delegate = self
        
    }
}

// 셀에 대한 protocal 1
extension StockRankViewController: UICollectionViewDataSource {
    // 주식리스트 저장한 배열에서 count를 가져옴
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stockList.count
    }
    
    // 셀을 어떻게 표현하고자 할것인지에 대한 메소드
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StockRankCollectionViewCell", for: indexPath) as? StockRankCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let stock = stockList[indexPath.item]
        cell.configure(stock)
        return cell

    }
}

// 셀에 대한 protocal 2
extension StockRankViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // width = collectionView
        // height = 80정도
        
        return CGSize(width: collectionView.bounds.width, height: 80)
    }
}
