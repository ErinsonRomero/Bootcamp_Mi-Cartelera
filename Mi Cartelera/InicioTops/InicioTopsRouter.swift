//
//  InicioTopsRoueter.swift
//  Mi Cartelera
//
//  Created by Erinson Andres Romero Terry on 16/12/22.
//

import Foundation
import UIKit

import UIKit

protocol InicioTopsRouterProtocol {
    func buscarSerie()
}

class InicioTopsRouter {
    var view: UIViewController?
    
}

extension InicioTopsRouter: InicioTopsRouterProtocol {
    func buscarSerie() {
        let viewcontroller = BusquedaConfigurator.busquedaConfiguratorModulo()
        view?.navigationController?.pushViewController(viewcontroller, animated: true)
    }
}
