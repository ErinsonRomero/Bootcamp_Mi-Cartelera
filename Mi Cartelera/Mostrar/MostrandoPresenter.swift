//
//  MostrandoPresenter.swift
//  Mi Cartelera
//
//  Created by Erinson Andres Romero Terry on 16/12/22.
//

import Foundation
protocol MostrandoPresenterProtocol {

    func getName() -> String
    func getPoster() -> String?
    func getId() -> String
    func getOverview() -> String
    func getVote() -> Float
}



class MostrandoPresenter {
    
    var nombre: String
    var poster: String?
    var id: String
    var overview: String
    var vote: Float
    
    
    var view: MostrandoViewControllerProtocol?
    
    init(nombre: String, imagen: String?, vote: Float, id: String, overview: String) {
        self.nombre = nombre
        self.poster = imagen
        self.id = id
        self.overview = overview
        self.vote = vote
    }
}
    
extension MostrandoPresenter: MostrandoPresenterProtocol {
 
    
    func getName() -> String {
        nombre
    }
    func getPoster() -> String? {
        poster
    }
    func getId() -> String {
        id
    }
    func getOverview() -> String {
        if overview == "" {
            return "No se cuenta con la trama"
        } else {
            return overview
        }
    }
    func getVote() -> Float {
        vote
    }
    
    
}
