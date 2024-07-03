//
//  HomeViewModel.swift
//  cryptoApp-TurkcellGY
//
//  Created by Fatih on 3.07.2024.
//

import Foundation

protocol HomeViewModelProtocol {
    func totalMarketCup(totalMarketCup: String)
}

class HomeViewModel {
    var homeViewModelDelegate: HomeViewModelProtocol?
    let coinService: CoinService = NetworkService()
    var coinArray = [Coin]()
    
    var cryptoName: [CryptoCategoryModel] = [.init(cryptoName: "Price", type: .price),
                                             .init(cryptoName: "24h Volume", type: .hVolume),
                                             .init(cryptoName: "Market Cup", type: .marketCup),
                                             .init(cryptoName: "Change", type: .change)]
    
    func requestCoin(completion: @escaping (() -> Void)) {
        coinService.getCoinInfo { result in
            switch result {
            case .success(let coin):
                self.coinArray = coin.data.coins
                let totalMarketCup = coin.data.stats.totalMarketCap
                self.homeViewModelDelegate?.totalMarketCup(totalMarketCup: totalMarketCup)
                completion()
                print(coin.data.coins)
            case .failure(let failure):
                completion()
                print("Error \(failure.localizedDescription)")
            }
        }
    }
}

