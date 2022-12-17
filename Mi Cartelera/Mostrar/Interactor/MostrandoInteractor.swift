//
//  MostrandoInteractor.swift
//  Mi Cartelera
//
//  Created by Erinson Andres Romero Terry on 16/12/22.
//

import Foundation
import CoreData
import UIKit

protocol MostrandoInteractorProtocol {
    func saveSerie(_ nombre: String, _ imagen: String?, _ trama: String, _ voto: Float, _ id: String)
    func setGuardada(_ guardada: Bool)
    func PedirEstadoGuardados(_ nombre: String)
}

class MostrandoInteractor {
    var presenter: MostrandoPresenterProtocol?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var items: [SeriesGuardadas]?
    
    func saveSeriesGuardadas(_ serie: SeriesGuardadas) {
        do {
            try self.context.save()
            
        } catch {}
    }
    
    func fetchSeriesGuardadas() {
        do {
            self.items = try context.fetch(SeriesGuardadas.fetchRequest())
            
        } catch {}
    }
    

}

extension MostrandoInteractor: MostrandoInteractorProtocol{
    func saveSerie(_ nombre: String, _ imagen: String?, _ trama: String, _ voto: Float, _ id: String) {
        let newSerie = SeriesGuardadas(context: self.context)
        newSerie.nombreSerie = nombre
        newSerie.imagenUrl = imagen
        newSerie.overViewSerie = trama
        newSerie.voteSerie = voto
        newSerie.idSerie = id
        saveSeriesGuardadas(newSerie)

    }
    
    func setGuardada(_ guardada: Bool) {
        presenter?.setGuardada(guardada)
    }
    
    func PedirEstadoGuardados(_ nombre: String) {
        fetchSeriesGuardadas()
        if let item = items {
            for i in item {
                if i.idSerie == nombre {
                    self.setGuardada(true)
                }
            }
        }
    }
    
}
