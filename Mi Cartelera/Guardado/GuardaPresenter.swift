//
//  GuardaPresenter.swift
//  Mi Cartelera
//
//  Created by Erinson Andres Romero Terry on 16/12/22.
//

import Foundation

protocol GuardaPresenterProtocol {
    //mando a traer serie
    func getSerie()
    //regreso serie
    func setSerie(_ seriesGuardadas: [SeriesGuardadas])
    func removerSerie(_ serie: SeriesGuardadas)
    func showSerie(_ serie: SeriesGuardadas)
}



class GuardaPresenter {
    
    
    
    var view: GuardaViewControllerProtocol?
    var interactor: GuardaInteractorProtocol?
    var router: GuardaRouterProtocol?

    
    
    
}
    
extension GuardaPresenter: GuardaPresenterProtocol {
    func showSerie(_ serie: SeriesGuardadas) {
        router?.setSerie(serie)
    }
    
    
    func setSerie(_ seriesGuardadas: [SeriesGuardadas]) {
        view?.MandarGuardados(seriesGuardadas)
    }
    
    
    
    func getSerie() {
        interactor?.getSerie()
    }
    
    func removerSerie(_ serie: SeriesGuardadas) {
        interactor?.RemoverSerie(serie)
    }

    
}
