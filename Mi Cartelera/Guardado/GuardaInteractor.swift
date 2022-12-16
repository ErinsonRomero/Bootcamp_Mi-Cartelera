//
//  GuardaInteractor.swift
//  Mi Cartelera
//
//  Created by Erinson Andres Romero Terry on 16/12/22.
//

import Foundation
import CoreData
import UIKit

protocol GuardaInteractorProtocol {
    func getSerie()
    func setSerie(_ seriesGuardadas: [SeriesGuardadas])
    func RemoverSerie(_ serieRemovida: SeriesGuardadas)
}

class GuardaInteractor {
    var presenter: GuardaPresenterProtocol?
    var items: [SeriesGuardadas]?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    func saveSeriesGuardadas() {
        do {
            try self.context.save()
            
        } catch {}
    }
    
    func fetchSeriesGuardadas() {
        do {
            self.items = try context.fetch(SeriesGuardadas.fetchRequest())
            setSerie(items!)
        } catch {}
    }

}


extension GuardaInteractor: GuardaInteractorProtocol{
    
    func getSerie() {
        fetchSeriesGuardadas()
    }
    
    func setSerie(_ seriesGuardadas: [SeriesGuardadas]) {
        presenter?.setSerie(seriesGuardadas)
        
    }
    
    func RemoverSerie(_ serieRemovida: SeriesGuardadas) {
        self.context.delete(serieRemovida)
        saveSeriesGuardadas()
        fetchSeriesGuardadas()
    }
    
    
}


