//
//  HomeView.swift
//  cryptoApp-TurkcellGY
//
//  Created by Fatih on 2.07.2024.
//

import Foundation
import UIKit

class HomeView: UIView {
    
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
    let totalMarketCapLabel: UILabel = {
        let label = UILabel()
        label.text = "Total Market Cap"
        label.textColor = .white
        label.font = .systemFont(ofSize: 30, weight: .black)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    let totalMarketCapPriceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    let cryptoCategoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: .zero,collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    let cryptoListCollectionView: UICollectionView = {
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
extension HomeView {
    func setupUI() {
        backgroundColor = .black
        addSubview(totalMarketCapLabel)
        addSubview(totalMarketCapPriceLabel)
        addSubview(cryptoCategoryCollectionView)
        addSubview(cryptoListCollectionView)
        
        NSLayoutConstraint.activate([
            totalMarketCapLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 30),
            totalMarketCapLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 15),
            totalMarketCapLabel.trailingAnchor.constraint(lessThanOrEqualTo:safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            totalMarketCapPriceLabel.topAnchor.constraint(equalTo: totalMarketCapLabel.bottomAnchor, constant: 15),
            totalMarketCapPriceLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 15),
            totalMarketCapPriceLabel.trailingAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            cryptoCategoryCollectionView.topAnchor.constraint(equalTo: totalMarketCapPriceLabel.bottomAnchor, constant: 15),
            cryptoCategoryCollectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 15),
            cryptoCategoryCollectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,constant: -15),
            cryptoCategoryCollectionView.heightAnchor.constraint(equalToConstant: 70),
            
            cryptoListCollectionView.topAnchor.constraint(equalTo: cryptoCategoryCollectionView.bottomAnchor, constant: 10),
            cryptoListCollectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            cryptoListCollectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            cryptoListCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
            
            
            
        ])
        
        
    }
}
