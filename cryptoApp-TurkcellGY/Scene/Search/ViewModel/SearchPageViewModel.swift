//
//  SearchPageViewModel.swift
//  cryptoApp-TurkcellGY
//
//  Created by Fatih on 8.07.2024.
//

import Foundation
import UIKit

class SearchPageViewModel {
    let coinService: CoinService = NetworkService()

    var searchCoinArray = [Coin]()
    var filterCoinsArray = [Coin]()
    
    func requestCoin(completion: @escaping (() -> Void)) {
        coinService.getCoinInfo { result in
            switch result {
            case .success(let coin):
                self.searchCoinArray = coin.data.coins
                self.filterCoinsArray = coin.data.coins // Başlangıçta filtrelenmemiş coin array'i
                completion()
            case .failure(let failure):
                completion()
                print("Error \(failure.localizedDescription)")
            }
        }
    }
}

//MARK: - Search Functions
extension SearchPageViewModel {
    public func inSearchMode(_ searchController: UISearchController) -> Bool {
        let isActive = searchController.isActive
        let searchText = searchController.searchBar.text ?? ""
        return isActive && !searchText.isEmpty
    }
    
    public func updataeSearchController(searchBarText: String?) {
        guard let searchText = searchBarText?.lowercased(), !searchText.isEmpty else {
            self.filterCoinsArray = self.searchCoinArray // Eğer arama metni boşsa, filtrelenmemiş coin array'ini göster
            return
        }
        
        self.filterCoinsArray = self.searchCoinArray.filter { $0.name.lowercased().contains(searchText) }
    }
}
