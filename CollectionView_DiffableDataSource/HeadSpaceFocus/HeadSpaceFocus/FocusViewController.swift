//
//  FocusViewController.swift
//  HeadSpaceFocus
//
//  Created by 이재영 on 2023/01/14.
//

import UIKit

class FocusViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var refreshButton: UIButton!
    
    var curated: Bool = false
    
    var items: [Focus] = Focus.list
    
    typealias Item = Focus
    enum Section {
        case main
    }
    
    var datasource: UICollectionViewDiffableDataSource<Section, Item>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshButton.layer.cornerRadius = 10

       // presentation
        datasource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FocusCell", for: indexPath) as? FocusCell else {
                return nil
            }
            cell.configure(item)
            return cell
        })
        
        // data
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(items, toSection: .main)
        datasource.apply(snapshot)
        
        // layout
        collectionView.collectionViewLayout = layout()
        
        updateButtonTitle()
        
    }
    // layout
    private func layout() -> UICollectionViewCompositionalLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        // 패딩 및 그룹 간 spacing 설정
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        section.interGroupSpacing = 10
        //
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
    
    // 버튼 눌렀을때 문구 달라지게 하는 메소드
    func updateButtonTitle() {
        let title = curated ? "See All" : "See Recommendation"
        refreshButton.setTitle(title, for: .normal)
    }
    
    // 버튼 액션 메소드
    @IBAction func refreshButtonTapped(_ sender: Any) {
        
        curated.toggle() //누르면 flag = !flag 변함
        
        self.items = curated ? Focus.recommendations : Focus.list
        
        // 변경사항을 collectionView에 적용하기
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(items, toSection: .main)
        
        datasource.apply(snapshot)
        
        updateButtonTitle()
    }
    
    
}
