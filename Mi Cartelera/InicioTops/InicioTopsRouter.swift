//
//  InicioTopsRoueter.swift
//  Mi Cartelera
//
//  Created by Erinson Andres Romero Terry on 16/12/22.
//

import Foundation
import UIKit


protocol InicioTopsRouterProtocol {
    func showSerie(_ name: Results)
    func buscarSerie()
    func guardadosView()
}

class InicioTopsRouter {
    var view: UIViewController?
    
}

extension InicioTopsRouter: InicioTopsRouterProtocol {
    func showSerie(_ name: Results) {
        let modelo = InicioTopsModelo(nombre: name.name, poster: name.poster_path, id: name.id, overview: name.overview, vote_average: name.vote_average)
        let viewcontroller = MostrandoConfigurator.mostrandoConfiguratorModulo(modelo)
        view?.navigationController?.pushViewController(viewcontroller, animated: true)
    }
    
    func buscarSerie() {
        let viewcontroller = BusquedaConfigurator.busquedaConfiguratorModulo()
        view?.navigationController?.pushViewController(viewcontroller, animated: true)
    }
    
    func guardadosView() {
        let viewcontroller = GuardaConfigurator.guardaConfiguratorModulo()
        view?.navigationController?.pushViewController(viewcontroller, animated: true)
    }


}
