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
    
    func getSerie(_ nombre: String, _ imagen: String?, _ trama: String, _ voto: Float, _ id: String)
    func setGuardada(_ guardada: Bool)
    func PedirEstadoGuardados(_ nombre: String)
}



class MostrandoPresenter {
    
    var nombre: String
    var poster: String?
    var id: String
    var overview: String
    var vote: Float
    
    
    var view: MostrandoViewControllerProtocol?
    var interactor: MostrandoInteractorProtocol?
    
    
    init(nombre: String, imagen: String?, vote: Float, id: String, overview: String) {
        self.nombre = nombre
        self.poster = imagen
        self.id = id
        self.overview = overview
        self.vote = vote
    }
}
    
extension MostrandoPresenter: MostrandoPresenterProtocol {
    func PedirEstadoGuardados(_ nombre: String) {
        interactor?.PedirEstadoGuardados(nombre)
    }
    
 
    func getSerie(_ nombre: String, _ imagen: String?, _ trama: String, _ voto: Float, _ id: String) {
        interactor?.saveSerie(nombre, imagen, trama, voto, id)
    }
    
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
    
    func setGuardada(_ guardada: Bool) {
        view?.EstaEnGuardados(guardada)
    }
    
    
}
