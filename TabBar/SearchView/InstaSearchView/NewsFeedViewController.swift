//
//  NewsFeedViewController.swift
//  InstaSearchView
//
//  Created by 이재영 on 2023/01/11.
//

import UIKit

class NewsFeedViewController: UIViewController, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // 직접 size를 정해줄거기 때문에 시스템이 알아서 추정하지 말라는 메소드
        if let flowlayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout{
            flowlayout.estimatedItemSize = .zero
        }
    }
}

extension NewsFeedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier : "FeedCell", for: indexPath) as? FeedCell else {
            return UICollectionViewCell()
        }

        let imageName = "animal\(indexPath.item + 1)"
        cell.configure(imageName)
        return cell
    }
}

extension NewsFeedViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 4:3 비율로
        let width = collectionView.bounds.width
        let height = width * 3/4
        return CGSize(width: width, height: height)
    }
}
