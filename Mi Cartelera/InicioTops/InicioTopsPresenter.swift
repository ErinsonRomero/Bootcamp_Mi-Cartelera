//
//  InicioTopsPresenter.swift
//  Mi Cartelera
//
//  Created by Erinson Andres Romero Terry on 15/12/22.
//

import Foundation

protocol InicioTopsPresenterProtocol {
    //mando a traer serie
    func getSerie(_ tipo: String)
    //regreso serie
    func setSerie(_ resultados: [Results])
    func searchView()
}

class InicioTopsPresenter {
    
    var view: InicioTopsViewProtocol?
    var interactor: InicioTopsInteractorProtocol?
    var router: InicioTopsRouterProtocol?
}


    
extension InicioTopsPresenter: InicioTopsPresenterProtocol{
    func getSerie(_ tipo: String) {
        interactor?.getSerie(tipo)
    }
    
    func setSerie(_ resultados: [Results]) {
        view?.MostrarSerie(resultados)
    }
    
    func searchView() {
        router?.buscarSerie()
    }

}
