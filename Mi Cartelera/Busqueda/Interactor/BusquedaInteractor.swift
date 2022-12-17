//
//  BusquedaInteractor.swift
//  Mi Cartelera
//
//  Created by Erinson Andres Romero Terry on 16/12/22.
//

import Foundation
protocol BusquedaInteractorProtocol {
    func getSerie(_ nombreSerie: String)
    func setSerie(_ nameSerie: [Results])

}


class BusquedaInteractor {
    var presenter: BusquedaPresenterProtocol?
    var busquedaSeriesManager = BusquedaSeries()
    
}

extension BusquedaInteractor: BusquedaInteractorProtocol{
    func getSerie(_ nombreSerie: String) {
        if nombreSerie == "" {
            self.setSerie(
            [])
        } else {
            var text = nombreSerie
            text = text.replacingOccurrences(of: " ", with: "%20")
            text = text.replacingOccurrences(of: "¿", with: "%C2%BF")
            text = text.replacingOccurrences(of: ",", with: "%2C")
            text = text.replacingOccurrences(of: "?", with: "%3F")
            text = text.replacingOccurrences(of: "!", with: "%21")
            print("pidio \(nombreSerie)")
            busquedaSeriesManager.delegate = self
            self.busquedaSeriesManager.Tipo(tipo: text)
        }
        
    }
    
    func setSerie(_ nameSerie: [Results]) {
        presenter?.setSerie(nameSerie)
    }

}

extension BusquedaInteractor: BusquedaDelegate {
    func didUpdateBusqueda(_ movie: [Results]) {
        self.setSerie(movie)
    }
    
    func didFailWithErrorBusqueda(error: Error) {
        
    }
    
    
}

