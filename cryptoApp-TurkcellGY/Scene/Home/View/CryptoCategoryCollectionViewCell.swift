//
//  CryptoCategoryCollectionViewCell.swift
//  cryptoApp-TurkcellGY
//
//  Created by Fatih on 3.07.2024.
//

import UIKit

class CryptoCategoryCollectionViewCell: UICollectionViewCell {
    static let identifier = "CryptoCategoryCollectionViewCell"
    
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
    let cryptoCategoryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    let cryptoCategoryUnderlineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
}

//MARK: - SetupUI
extension CryptoCategoryCollectionViewCell {
    func setupUI() {
        addSubview(cryptoCategoryLabel)
        addSubview(cryptoCategoryUnderlineView)
        NSLayoutConstraint.activate([
            cryptoCategoryLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            cryptoCategoryLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            cryptoCategoryUnderlineView.topAnchor.constraint(equalTo: cryptoCategoryLabel.bottomAnchor),
            cryptoCategoryUnderlineView.leadingAnchor.constraint(equalTo: cryptoCategoryLabel.leadingAnchor),
            cryptoCategoryUnderlineView.trailingAnchor.constraint(equalTo: cryptoCategoryLabel.trailingAnchor),
            cryptoCategoryUnderlineView.heightAnchor.constraint(equalToConstant: 3)
            
            
        ])
    }
}
