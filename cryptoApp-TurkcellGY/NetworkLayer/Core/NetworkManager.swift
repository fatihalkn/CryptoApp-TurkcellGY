//
//  NetworkManager.swift
//  cryptoApp-TurkcellGY
//
//  Created by Fatih on 2.07.2024.
//

import Foundation
import Alamofire

final class NetworkManager {
    static let shared = NetworkManager()
}

//MARK: - Request Method
extension NetworkManager {
    func request<T: Codable>(url: String, method: HTTPMethod, complation:@escaping(Result<T,Error>) -> Void) {
        AF.request(URL(string: url)!, method: method).validate().responseDecodable(of: T.self) { response in
            let result = response.result
            switch result {
            case .success(let success):
                complation(.success(success))
            case .failure(let failure):
                complation(.failure(failure))
            }
        }
    }
}
