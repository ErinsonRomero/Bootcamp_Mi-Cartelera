//
//  InicioTopsInteractor.swift
//  Mi Cartelera
//
//  Created by Erinson Andres Romero Terry on 15/12/22.
//

import Foundation
import Foundation
protocol InicioTopsInteractorProtocol {
    func getSerie(_ tipo: String)
    func setSerie(_ resultados: [Results])
    func searchView()

}

class InicioTopsInteractor {
    var presenter: InicioTopsPresenterProtocol?
    var inicioTopsSeriesManager = InicioTopsSeries()
    var router: InicioTopsRouterProtocol?
     
    
}


extension InicioTopsInteractor: InicioTopsInteractorProtocol{
    func getSerie(_ tipo: String) {
        inicioTopsSeriesManager.delegate = self
        inicioTopsSeriesManager.Tipo(tipo: tipo)
        
    }
    
    func setSerie(_ resultados: [Results]) {
        presenter?.setSerie(resultados)
    }
    
    
}

extension InicioTopsInteractor: InicioTopsSeriesDelegate {
    func didUpdateSerie(movie: [Results]) {
        setSerie(movie)
    }
    
    func didFailWithError(error: Error) {
        
    }
    
    func searchView() {
        router?.buscarSerie()
    }
    
}
