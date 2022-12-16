//
//  BusquedaRouter.swift
//  Mi Cartelera
//
//  Created by Erinson Andres Romero Terry on 16/12/22.
//

import Foundation
import UIKit

protocol BusquedaRouterProtocol {
    func showSerie(_ name: Results)
}

class BusquedaRouter {
    var view: UIViewController?
    
}

extension BusquedaRouter: BusquedaRouterProtocol {
    func showSerie(_ name: Results) {
        let modelo = BusquedaModelo(nombre: name.name, poster: name.poster_path, id: name.id, overview: name.overview, vote_average: name.vote_average)
        let viewcontroller = MostrandoConfigurator.mostrandoConfiguratorModulo(modelo)
        view?.navigationController?.pushViewController(viewcontroller, animated: true)
    }
    
    
}
