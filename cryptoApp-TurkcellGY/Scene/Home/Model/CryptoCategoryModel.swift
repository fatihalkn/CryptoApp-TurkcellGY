//
//  CryptoCategoryModel.swift
//  cryptoApp-TurkcellGY
//
//  Created by Fatih on 3.07.2024.
//

import Foundation

struct CryptoCategoryModel {
    let cryptoName: String
    let type: CryptoNameType
}



enum CryptoNameType: String {
    case price
    case hVolume
    case marketCup
    case change
}


