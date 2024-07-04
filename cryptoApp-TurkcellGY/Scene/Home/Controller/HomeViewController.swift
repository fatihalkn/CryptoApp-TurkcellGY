//
//  HomeViewController.swift
//  cryptoApp-TurkcellGY
//
//  Created by Fatih on 2.07.2024.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    //MARK: - Properties
    let homeView = HomeView()
    let homeViewModel = HomeViewModel()
    var previouslySelectedIndexPath: IndexPath?
    
    //MARK: - Life Cycle Methods
    override func loadView() {
        super.loadView()
        view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
        setupRegister()
        configureNavigationBar()
        homeViewModel.requestCoin {
            DispatchQueue.main.async {
                self.homeView.cryptoListCollectionView.reloadData()
            }
        }
    }
    
    func setupRegister() {
        homeView.cryptoCategoryCollectionView.register(CryptoCategoryCollectionViewCell.self, forCellWithReuseIdentifier: CryptoCategoryCollectionViewCell.identifier)
        
        homeView.cryptoListCollectionView.register(CryptoListCollectionViewCell.self, forCellWithReuseIdentifier: CryptoListCollectionViewCell.identifier)
    }
    
    func setupDelegate() {
        homeView.cryptoCategoryCollectionView.dataSource = self
        homeView.cryptoCategoryCollectionView.delegate = self
        
        homeView.cryptoListCollectionView.dataSource = self
        homeView.cryptoListCollectionView.delegate = self
        
        homeViewModel.homeViewModelDelegate = self
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.setCenterView(title: "IIumaia Coin", image: .mainIcon)
        navigationController?.navigationBar.tintColor = .white
    }
}

//MARK: - HomeViewModelProtocol
extension HomeViewController: HomeViewModelProtocol {
    func totalMarketCup(totalMarketCup: String) {
        homeView.totalMarketCapPriceLabel.text = "$ \(totalMarketCup)"
    }
}

//MARK: - Configure CollectionView
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case homeView.cryptoCategoryCollectionView:
            return  homeViewModel.cryptoName.count
        case homeView.cryptoListCollectionView:
            return homeViewModel.filterCoinArray.count
        default:
            break
        }
      return Int()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case homeView.cryptoCategoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CryptoCategoryCollectionViewCell.identifier, for: indexPath) as! CryptoCategoryCollectionViewCell
            let data = homeViewModel.cryptoName[indexPath.item].cryptoName
            cell.cryptoCategoryLabel.text = data
            return cell
        case homeView.cryptoListCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CryptoListCollectionViewCell.identifier, for: indexPath) as! CryptoListCollectionViewCell
            let data = homeViewModel.filterCoinArray[indexPath.item]
            if let changeValue = Double(data.change) {
                if changeValue > 0 {
                    cell.coinChangeLabel.textColor = .green
                } else {
                    cell.coinChangeLabel.textColor = .red
                }
            }
            
            cell.configure(coinData:data)

            return cell
        default:
            break
        }
       return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case homeView.cryptoCategoryCollectionView:
            let cellHeight: CGFloat = collectionView.frame.height - 30
            let cellWidth: CGFloat = (collectionView.frame.width) / 3
            return.init(width: cellWidth, height: cellHeight)
        case homeView.cryptoListCollectionView:
            let cellHeight: CGFloat = collectionView.frame.height / 6
            let cellWidth: CGFloat = (collectionView.frame.width) - 30
            return.init(width: cellWidth, height: cellHeight)
        default:
            break
        }
        return CGSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        switch collectionView {
        case homeView.cryptoCategoryCollectionView:
            let cryptoType = homeViewModel.cryptoName[indexPath.item].type
            let cell = collectionView.cellForItem(at: indexPath) as! CryptoCategoryCollectionViewCell
            if let previousIndexPath = previouslySelectedIndexPath {
                let previousCell = collectionView.cellForItem(at: previousIndexPath) as! CryptoCategoryCollectionViewCell
                previousCell.cryptoCategoryUnderlineView.backgroundColor = .black
            }
            
            switch cryptoType {
            case .price:
                cell.cryptoCategoryUnderlineView.backgroundColor = .mainPurple
                homeViewModel.filterCoinArray.sort(by: {$0.price > $1.price})
            case .hVolume:
                cell.cryptoCategoryUnderlineView.backgroundColor = .mainPurple
                homeViewModel.filterCoinArray.sort(by: {$0.the24HVolume > $1.the24HVolume})
            case .marketCup:
                cell.cryptoCategoryUnderlineView.backgroundColor = .mainPurple
                homeViewModel.filterCoinArray.sort(by: {$0.marketCap > $1.marketCap})
            case .change:
                cell.cryptoCategoryUnderlineView.backgroundColor = .mainPurple
                homeViewModel.filterCoinArray.sort(by: {$0.change > $1.change})
            }
            
            homeView.cryptoListCollectionView.reloadData()
            previouslySelectedIndexPath = indexPath
            
        case homeView.cryptoListCollectionView:
            let coinListcell = collectionView.cellForItem(at: indexPath) as! CryptoListCollectionViewCell
            let vc = DetailViewController()
            vc.detailView.coinImageView.image = coinListcell.coinImageView.image
            vc.detailView.coinNameLabel.text = coinListcell.coinNameLabel.text
            vc.detailView.coinPriceLabel.text = coinListcell.coinPriceLabel.text
            vc.detailView.coinChangeLabel.text = coinListcell.coinChangeLabel.text
            vc.detailView.coinSymbolNameLabel.text = coinListcell.coinSymbolNameLabel.text
            navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
}
