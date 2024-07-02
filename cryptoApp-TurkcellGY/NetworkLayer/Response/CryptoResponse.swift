// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let cryptoResponse = try? JSONDecoder().decode(CryptoResponse.self, from: jsonData)

import Foundation

// MARK: - CryptoResponse
struct CryptoResponse: Codable {
    let status: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let stats: Stats
    let coins: [Coin]
}

// MARK: - Coin
struct Coin: Codable {
    let uuid, symbol, name: String
    let color: String?
    let iconURL: String
    let marketCap, price: String
    let listedAt, tier: Int
    let change: String
    let rank: Int
    let sparkline: [String]
    let lowVolume: Bool
    let coinrankingURL: String
    let the24HVolume, btcPrice: String

    enum CodingKeys: String, CodingKey {
        case uuid, symbol, name, color
        case iconURL = "iconUrl"
        case marketCap, price, listedAt, tier, change, rank, sparkline, lowVolume
        case coinrankingURL = "coinrankingUrl"
        case the24HVolume = "24hVolume"
        case btcPrice
    }
}

// MARK: - Stats
struct Stats: Codable {
    let total, totalCoins, totalMarkets, totalExchanges: Int
    let totalMarketCap, total24HVolume: String

    enum CodingKeys: String, CodingKey {
        case total, totalCoins, totalMarkets, totalExchanges, totalMarketCap
        case total24HVolume = "total24hVolume"
    }
}
