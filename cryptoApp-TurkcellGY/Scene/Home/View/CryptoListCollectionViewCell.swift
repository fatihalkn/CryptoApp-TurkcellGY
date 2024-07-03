//
//  CryptoListCollectionViewCell.swift
//  cryptoApp-TurkcellGY
//
//  Created by Fatih on 3.07.2024.
//

import UIKit
import Kingfisher
import SVGKit

class CryptoListCollectionViewCell: UICollectionViewCell {
    static let identifier = "CryptoListCollectionViewCell"
    
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
    
    let coinImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let coinSymbolNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let coinNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let coinPriceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let coinChangeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .semibold)
        label.textColor = .red
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func configure(coinData: Coin) {
        
        guard let url = URL(string: coinData.iconURL) else {
            print("Geçersiz URL: \(coinData.iconURL)")
            return
        }

        coinImageView.kf.setImage(with: url,placeholder: nil,options: [.transition(.fade(0.2))], progressBlock: nil) { result in
            switch result {
                
            case .success(let value):
                print("Resim başarıyla yüklendi: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print("Resim yüklenirken hata oluştu: \(error.localizedDescription)")
            }
        }
        
        if let price = Double(coinData.price) {
            let formattedPrice = String(format: "%.2f", price)
            coinPriceLabel.text = "$\(formattedPrice)"
        } else {
            coinPriceLabel.text = coinData.price
        }
        
        coinSymbolNameLabel.text = coinData.symbol
        coinNameLabel.text = coinData.name
        coinChangeLabel.text = coinData.change
    }
}

//MARK: - SetupUI
extension CryptoListCollectionViewCell {
    func setupUI() {
        addSubview(coinImageView)
        addSubview(coinSymbolNameLabel)
        addSubview(coinNameLabel)
        addSubview(coinPriceLabel)
        addSubview(coinChangeLabel)
        backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            coinImageView.topAnchor.constraint(equalTo: self.topAnchor),
            coinImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            coinImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 15),
            coinImageView.heightAnchor.constraint(equalToConstant: 80),
            coinImageView.widthAnchor.constraint(equalToConstant: 90),
            
            coinSymbolNameLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
            coinSymbolNameLabel.leadingAnchor.constraint(equalTo: coinImageView.trailingAnchor, constant: 10),
             
            coinNameLabel.topAnchor.constraint(equalTo: coinSymbolNameLabel.bottomAnchor, constant: 10),
            coinNameLabel.leadingAnchor.constraint(equalTo: coinImageView.trailingAnchor,constant: 10),
            
            coinPriceLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            coinPriceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            coinPriceLabel.leadingAnchor.constraint(greaterThanOrEqualTo:coinSymbolNameLabel.trailingAnchor,constant: 5),
            
            coinChangeLabel.topAnchor.constraint(equalTo: coinPriceLabel.bottomAnchor, constant: 5),
            coinChangeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -5),
            coinChangeLabel.leadingAnchor.constraint(greaterThanOrEqualTo: coinSymbolNameLabel.trailingAnchor,constant: 5),
            coinChangeLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            
        ])
    }
}
