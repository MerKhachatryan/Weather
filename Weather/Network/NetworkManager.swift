//
//  NetworkManager.swift
//  Weather
//
//  Created by Meri Khachatryan on 19.05.25.
//

import Foundation

class NetworkManager {
    
    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func getData<T: Decodable>(from url: URL) async throws -> T {
        let (data, response) = try await session.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.invalidStatusCode
        }
        
        do {
            let decoded = try JSONDecoder().decode(T.self, from: data)
            return decoded
        } catch {
            throw NetworkError.unableToDecode
        }
    }
}
