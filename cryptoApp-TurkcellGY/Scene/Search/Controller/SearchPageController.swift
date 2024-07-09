//
//  SearchPageController.swift
//  cryptoApp-TurkcellGY
//
//  Created by Fatih on 8.07.2024.
//

import Foundation
import UIKit

class SearchPageController: UIViewController {
    
    //MARK: - Properties
    let searchPageView = SearchPageView()
    let searchPageViewModel = SearchPageViewModel()
    
    //MARK: - Life Cycle Methods
    override func loadView() {
        super.loadView()
        view = searchPageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchListRequest()
        setupSearchController()
        setupDelegate()
        setupRegister()
    }
    
    func searchListRequest() {
        searchPageViewModel.requestCoin {
            DispatchQueue.main.async {
                self.searchPageView.searchCryptoListCollectionView.reloadData()
            }
        }
    }
    
    func setupDelegate() {
        searchPageView.searchCryptoListCollectionView.dataSource = self
        searchPageView.searchCryptoListCollectionView.delegate = self
    }
    
    func setupRegister() {
        searchPageView.searchCryptoListCollectionView.register(SearchCryptoListCollectionViewCell.self, forCellWithReuseIdentifier: SearchCryptoListCollectionViewCell.identifier)
    }
}

//MARK: - Configure CollectionView
extension SearchPageController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let inSearchMode = self.searchPageViewModel.inSearchMode(searchPageView.searchBar)
        return inSearchMode ? self.searchPageViewModel.filterCoinsArray.count : self.searchPageViewModel.searchCoinArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCryptoListCollectionViewCell.identifier, for: indexPath) as! SearchCryptoListCollectionViewCell
        let inSearchMode = self.searchPageViewModel.inSearchMode(searchPageView.searchBar)
        let data = inSearchMode ? self.searchPageViewModel.filterCoinsArray[indexPath.item] : self.searchPageViewModel.searchCoinArray[indexPath.item]
        if let changeValue = Double(data.change) {
            if changeValue > 0 {
                cell.coinChangeLabel.textColor = .green
            } else {
                cell.coinChangeLabel.textColor = .red
            }
        }
        cell.configure(coinData: data)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellHeight: CGFloat = collectionView.frame.height / 6
        let cellWidth: CGFloat = (collectionView.frame.width) - 30
        return.init(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let coinListcell = collectionView.cellForItem(at: indexPath) as! SearchCryptoListCollectionViewCell
        let vc = DetailViewController()
        vc.detailView.coinImageView.image = coinListcell.coinImageView.image
        vc.detailView.coinNameLabel.text = coinListcell.coinNameLabel.text
        vc.detailView.coinPriceLabel.text = coinListcell.coinPriceLabel.text
        vc.detailView.coinChangeLabel.text = coinListcell.coinChangeLabel.text
        vc.detailView.coinSymbolNameLabel.text = coinListcell.coinSymbolNameLabel.text
        vc.navigationItem.title = coinListcell.coinNameLabel.text
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: -  SearchBar Configure
extension SearchPageController: UISearchResultsUpdating  {
    func setupSearchController() {
        self.searchPageView.searchBar.searchResultsUpdater = self
        self.navigationItem.searchController = searchPageView.searchBar
        self.definesPresentationContext = true
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        self.searchPageViewModel.updataeSearchController(searchBarText: searchController.searchBar.text)
        self.searchPageView.searchCryptoListCollectionView.reloadData()
    }
}
