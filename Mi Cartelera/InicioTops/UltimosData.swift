//
//  UltimosData.swift
//  Mi Cartelera
//
//  Created by Erinson Andres Romero Terry on 15/12/22.
//

import Foundation
struct UltimosData: Decodable {
    let results: [Results]
}

struct Results: Decodable {
    let poster_path: String?
    let id: Int
    let name: String
    let overview: String
    let vote_average: Float
    
}
