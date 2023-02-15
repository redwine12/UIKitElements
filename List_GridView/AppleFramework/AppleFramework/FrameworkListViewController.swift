//
//  FrameworkListViewController.swift
//  AppleFramework
//
//  Created by 이재영 on 2023/01/09.
//

import UIKit

class FrameworkListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // 데이터 가져오기
    let list: [AppleFramework] = AppleFramework.list
    
    // collectionView 표현하기 위해 정의해야 하는 것들
    // 1.Data 2.Presentation 3.Layout
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // cell의 estimated size를 코드로 설정
        if let flowlayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout{
            flowlayout.estimatedItemSize = .zero
        }
        
        // 왼쪽 오른쪽 여백 두기 - inset
        collectionView.contentInset = UIEdgeInsets(top: 20, left: 16, bottom: 0, right: 16)
    }
}

extension FrameworkListViewController: UICollectionViewDataSource{
    // 몇개의 셀을 보여줄것인지
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    // 어떻게 셀을 표현할것인지
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FrameworkCell", for: indexPath) as? FrameworkCell else {
            return UICollectionViewCell()
        }
        
        // 아이템 가져오기 (main point)
        let framework = list[indexPath.item]
        cell.configure(framework)
        return cell
    }
}

extension FrameworkListViewController: UICollectionViewDelegateFlowLayout{
    // 사이즈 정하기
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let interItemSpacing: CGFloat = 10
        
        // inset 설정으로 인한 padding 설정
        let padding: CGFloat = 16
        
        let width = (collectionView.bounds.width - interItemSpacing*3 - padding*2) / 4
        let height = width * 1.5
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

// 앱 아이콘 눌렀을때 반응하기
extension FrameworkListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let framework = list[indexPath.item]
        print(">>> selected: \(framework.name)")
    }
}
