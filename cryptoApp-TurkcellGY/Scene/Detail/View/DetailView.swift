//
//  DetailView.swift
//  cryptoApp-TurkcellGY
//
//  Created by Fatih on 4.07.2024.
//

import Foundation
import UIKit
import DGCharts

class DetailView: UIView {
    
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
        coinContentView.layer.cornerRadius = 12
    }
    
    //MARK: - UI Elements
    
    let coinContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let pieChard: PieChartView = {
        let barChart = PieChartView()
        barChart.translatesAutoresizingMaskIntoConstraints = false
        return barChart
    }()
    
    let coinImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
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
    
    let graphicContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
}

//MARK: - SetupUI
extension DetailView {
    func setupUI() {
        backgroundColor = .black
        addSubview(coinContentView)
        addSubview(graphicContentView)
        graphicContentView.addSubview(pieChard)
        coinContentView.addSubview(coinImageView)
        coinContentView.addSubview(coinSymbolNameLabel)
        coinContentView.addSubview(coinNameLabel)
        coinContentView.addSubview(coinPriceLabel)
        coinContentView.addSubview(coinChangeLabel)
        
        NSLayoutConstraint.activate([
            graphicContentView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            graphicContentView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            graphicContentView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            graphicContentView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.7),
            
            pieChard.topAnchor.constraint(equalTo: graphicContentView.topAnchor),
            pieChard.bottomAnchor.constraint(equalTo: graphicContentView.bottomAnchor),
            pieChard.leadingAnchor.constraint(equalTo: graphicContentView.leadingAnchor),
            pieChard.trailingAnchor.constraint(equalTo: graphicContentView.trailingAnchor),
            
            coinContentView.topAnchor.constraint(equalTo: graphicContentView.bottomAnchor,constant: 30),
            coinContentView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 20),
            coinContentView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            coinContentView.heightAnchor.constraint(equalToConstant: 120),
            
            coinImageView.topAnchor.constraint(equalTo: coinContentView.topAnchor,constant: 5),
            coinImageView.bottomAnchor.constraint(equalTo: coinContentView.bottomAnchor,constant: -5),
            coinImageView.leadingAnchor.constraint(equalTo: coinContentView.leadingAnchor),
            coinImageView.widthAnchor.constraint(equalTo: coinContentView.widthAnchor, multiplier: 0.3),
            
            coinSymbolNameLabel.centerYAnchor.constraint(equalTo: coinImageView.centerYAnchor,constant: -30),
            coinSymbolNameLabel.leadingAnchor.constraint(equalTo: coinImageView.trailingAnchor, constant: 10),
            
            
            coinNameLabel.centerYAnchor.constraint(equalTo: coinImageView.centerYAnchor,constant: -10),
            coinNameLabel.leadingAnchor.constraint(equalTo: coinImageView.trailingAnchor, constant: 10),
            coinNameLabel.bottomAnchor.constraint(lessThanOrEqualTo: coinContentView.bottomAnchor, constant: 20),
            
            coinPriceLabel.trailingAnchor.constraint(equalTo: coinContentView.trailingAnchor,constant: -10),
            coinPriceLabel.topAnchor.constraint(equalTo: coinSymbolNameLabel.topAnchor),
            coinPriceLabel.leadingAnchor.constraint(greaterThanOrEqualTo: coinSymbolNameLabel.trailingAnchor, constant: 20),
            
            coinChangeLabel.topAnchor.constraint(equalTo: coinNameLabel.topAnchor),
            coinChangeLabel.trailingAnchor.constraint(equalTo: coinContentView.trailingAnchor,constant: -10),
            coinChangeLabel.leadingAnchor.constraint(greaterThanOrEqualTo: coinNameLabel.trailingAnchor, constant: 20),
            coinChangeLabel.bottomAnchor.constraint(lessThanOrEqualTo: coinContentView.bottomAnchor, constant: 20),


            

            

            
            
            
        ])
    }
}
