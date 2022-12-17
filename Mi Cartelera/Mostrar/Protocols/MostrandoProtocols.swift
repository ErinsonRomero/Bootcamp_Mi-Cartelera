//
//  MostrandoProtocols.swift
//  Mi Cartelera
//
//  Created by Erinson Andres Romero Terry on 16/12/22.
//

import Foundation
protocol ItemMostrandoProtocol {
    var nombre: String {get}
    var poster: String? {get}
    var id: Int {get}
    var overview: String {get}
    var vote_average: Float {get}
}
