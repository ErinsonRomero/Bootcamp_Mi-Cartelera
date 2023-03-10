//
//  BusquedaPresenter.swift
//  Mi Cartelera
//
//  Created by Erinson Andres Romero Terry on 16/12/22.
//

import Foundation

protocol BusquedaPresenterProtocol {
    func getSerie(_ nombreSerie: String)
    func setSerie(_ name: [Results])
    func showSerie(_ name: Results)
}



class BusquedaPresenter {

    var view: BusquedaViewControllerProtocol?
    var interactor: BusquedaInteractorProtocol?
    var router: BusquedaRouterProtocol?
}

extension BusquedaPresenter: BusquedaPresenterProtocol {
    
    func setSerie(_ name: [Results]) {
        view?.MostrarSerie(name)
    }
    
    func getSerie(_ nombreSerie: String) {
        interactor?.getSerie(nombreSerie)
    }
    
    func showSerie(_ name: Results) {
        router?.showSerie(name)
    }
}
