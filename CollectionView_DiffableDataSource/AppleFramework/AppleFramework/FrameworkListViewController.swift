

import UIKit

class FrameworkListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let list: [AppleFramework] = AppleFramework.list
    
//  var dataSource: UICollectionViewDiffableDataSource<Section, AppleFramework>!
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    // AppleFramework라는 데이터를 사용할것이라고 명시하는 역할
    typealias Item = AppleFramework
    enum Section {
        case main
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        
        navigationController?.navigationBar.topItem?.title = "☀️ Apple Frameworks"
        
        /*
         diffable datasource - Presentation
         snapshot - Data
         compositional layout - Layout
        */

        // diffable datasource - Presentation
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FrameworkCell", for: indexPath) as? FrameworkCell else{
                return nil
            }
            cell.configure(item)
            return cell
        })
        
        // snapshot - Data
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(list, toSection: .main)
        dataSource.apply(snapshot)
            
        // compositional layout - Layout
        collectionView.collectionViewLayout = layout()
        
        
    }
    
    // layout 메소드
    private func layout() -> UICollectionViewCompositionalLayout {
        
        // Item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.5))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 16, bottom: 0, trailing: 16)
        
        // Layout
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
}


extension FrameworkListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let framework = list[indexPath.item]
        print(">>> selected: \(framework.name)")
    }
}
