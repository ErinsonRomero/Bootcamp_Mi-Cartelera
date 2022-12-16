//
//  InicioTopsConfigurator.swift
//  Mi Cartelera
//
//  Created by Erinson Andres Romero Terry on 15/12/22.
//

import Foundation
class InicioTopsConfigurator {
    static func inicioTopsConfiguratorModulo (_ view: InicioTopsViewController) {
        let presenter = InicioTopsPresenter()
        let interactor = InicioTopsInteractor()

        presenter.interactor = interactor
        
        presenter.view = view
        
        
        interactor.presenter = presenter
        
        view.presenter = presenter
    }
}
