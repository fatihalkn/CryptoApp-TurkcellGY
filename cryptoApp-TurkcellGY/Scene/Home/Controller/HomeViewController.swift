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
            return homeViewModel.coinArray.count
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
            let data = homeViewModel.coinArray[indexPath.item]
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
            case .hVolume:
                cell.cryptoCategoryUnderlineView.backgroundColor = .mainPurple
            case .marketCup:
                cell.cryptoCategoryUnderlineView.backgroundColor = .mainPurple
            case .change:
                cell.cryptoCategoryUnderlineView.backgroundColor = .mainPurple
            }
            
            previouslySelectedIndexPath = indexPath
            
        case homeView.cryptoListCollectionView:
            break
            
        default:
            break
        }
        
    }
    
}
