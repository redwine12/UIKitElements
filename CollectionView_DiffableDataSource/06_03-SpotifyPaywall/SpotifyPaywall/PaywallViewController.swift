

import UIKit

// https://developer.spotify.com/documentation/general/design-and-branding/#using-our-logo
// https://developer.apple.com/documentation/uikit/nscollectionlayoutsectionvisibleitemsinvalidationhandler


class PaywallViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    // 배너 정보
    let bannerInfos : [BannerInfo] = BannerInfo.list
    // 배너 배경색상
    let colors : [UIColor] = [.systemPurple, .systemOrange, .systemPink, .systemRed]
    
    typealias Item = BannerInfo
    enum Section {
        case main
    }
    
    var datasource: UICollectionViewDiffableDataSource<Section, Item>!
    
    override func viewDidLoad() {
        
        // Presentation - diffable datasource
        datasource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, Item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as? BannerCell else {
                return nil
            }
            cell.configure(Item)
            cell.backgroundColor = self.colors[indexPath.item]
            return cell
        })
        
        // data - snapshot
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(bannerInfos, toSection: .main)
        datasource.apply(snapshot)
        
        // Layout - compositional layout
        collectionView.collectionViewLayout = layout()
        collectionView.alwaysBounceVertical = false
        
        pageControl.numberOfPages = bannerInfos.count
    }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .absolute(200))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.interGroupSpacing = 20
        
        section .visibleItemsInvalidationHandler = { (item, offset, env) in
            let index = Int((offset.x / env.container.contentSize.width).rounded(.up))
            print(" >>> index : \(index)")
            self.pageControl.currentPage = index
        }
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
        
    }
   
}
