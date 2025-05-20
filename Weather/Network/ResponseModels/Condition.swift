//
//  Condition.swift
//  Weather
//
//  Created by Meri Khachatryan on 20.05.25.
//

import Foundation

struct Condition: Decodable {
    let text: String
    let icon: String
    
    var iconURL: URL? {
        URL(string: "https:\(icon)")
    }
    
    enum CodingKeys: CodingKey {
        case text
        case icon
    }
}
