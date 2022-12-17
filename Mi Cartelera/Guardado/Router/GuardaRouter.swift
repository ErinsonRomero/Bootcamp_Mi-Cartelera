//
//  GuardaRouter.swift
//  Mi Cartelera
//
//  Created by Erinson Andres Romero Terry on 16/12/22.
//

import Foundation
import UIKit
protocol GuardaRouterProtocol {
    func setSerie(_ serie: SeriesGuardadas)

}

class GuardaRouter {
    var view: UIViewController?
}


extension GuardaRouter: GuardaRouterProtocol {
    func setSerie(_ serie: SeriesGuardadas) {
        let modelo = GuardaModelo(nombre: serie.nombreSerie!, poster: serie.imagenUrl, id: Int(serie.idSerie!)!, overview: serie.overViewSerie!, vote_average: serie.voteSerie)
        let viewcontroller = MostrandoConfigurator.mostrandoConfiguratorModulo(modelo)
        view?.navigationController?.pushViewController(viewcontroller, animated: true)
    }
    
}
