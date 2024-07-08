//
//  SearchPageView.swift
//  cryptoApp-TurkcellGY
//
//  Created by Fatih on 8.07.2024.
//

import Foundation
import UIKit

class SearchPageView: UIView {
    
    //MARK: - Properties
    
    //MARK: - İnit Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    //MARK: - UI Elements
    let searchBar: UISearchController = {
        let serchBar = UISearchController(searchResultsController: nil)
        serchBar.obscuresBackgroundDuringPresentation = false
        serchBar.hidesNavigationBarDuringPresentation = true
        serchBar.searchBar.barTintColor = .clear
        serchBar.searchBar.backgroundColor = .black
        serchBar.searchBar.backgroundImage = UIImage()
        serchBar.searchBar.placeholder = "Search Cryptos"
        serchBar.searchBar.barStyle = .black
        return serchBar
    }()
    
    let searchCryptoListCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: .zero,collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
}

//MARK: - SetupUI
extension SearchPageView {
    func setupUI() {
        addSubview(searchCryptoListCollectionView)
        backgroundColor = .black
        
        NSLayoutConstraint.activate([            
            searchCryptoListCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            searchCryptoListCollectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            searchCryptoListCollectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            searchCryptoListCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
