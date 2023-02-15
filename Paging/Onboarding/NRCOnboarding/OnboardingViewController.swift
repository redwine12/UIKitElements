//
//  OnboardingViewController.swift
//  NRCOnboarding
//
//  Created by 이재영 on 2023/01/12.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var PageControl: UIPageControl!
    
    // 저장된 메세지 가져오기
    let messages: [OnboardingMessage] = OnboardingMessage.messages
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self

        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.estimatedItemSize = .zero
        }
        
        PageControl.numberOfPages = messages.count
    }
}

extension OnboardingViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 재사용 셀 가져오기
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCell", for: indexPath) as? OnboardingCell else{
            return UICollectionViewCell()
        }
        
        let message = messages[indexPath.item]
        cell.configure(message)
        return cell
        
    }
}

// 페이지에 보여주는 셀들의 사이즈,균형 맞추기
extension OnboardingViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size // 여기에 가로 ,세로 길이 다 포함됨
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
}


// 다음 페이지로 스크롤할때마다 page control도 업데이트되는것을 구현
extension OnboardingViewController: UIScrollViewDelegate{
    //    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    //        print(Int(scrollView.contentOffset.x / self.collectionView.bounds.width))
    //    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        //print("멈추었다.")
        
        
        let index = Int(scrollView.contentOffset.x / self.collectionView.bounds.width)
        
        PageControl.currentPage = index
    }
}
