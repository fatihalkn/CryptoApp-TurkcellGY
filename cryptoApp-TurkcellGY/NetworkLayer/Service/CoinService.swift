//
//  CoinService.swift
//  cryptoApp-TurkcellGY
//
//  Created by Fatih on 2.07.2024.
//

import Foundation

protocol CoinService {
    func getCoinInfo(complation:@escaping(Result<CryptoResponse,Error>) -> Void)
}

extension NetworkService: CoinService {
    func getCoinInfo(complation: @escaping (Result<CryptoResponse, Error>) -> Void) {
        NetworkManager.shared.request(url: NetworkConstants.coinBaseURL, method: .get, complation: complation)
    }
    
}
