//
//  NationalizeData.swift
//  NationalizeApp
//
//  Created by Daniel Washington Ignacio on 19/04/24.
//

import Foundation


struct NationalizeData: Codable {
    var count: Int?
    var name: String?
    var country: [Country]
}

struct Country: Codable {
    var country_id: String
    var probability: Float
}
