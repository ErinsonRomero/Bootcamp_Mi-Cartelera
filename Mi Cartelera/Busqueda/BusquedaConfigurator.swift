//
//  BusquedaConfigurator.swift
//  Mi Cartelera
//
//  Created by Erinson Andres Romero Terry on 16/12/22.
//

import Foundation
import UIKit

import UIKit

class BusquedaConfigurator {
    static func busquedaConfiguratorModulo() -> UIViewController {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "BusquedaViewController") as! BusquedaViewController
        let presenter = BusquedaPresenter()
        let interactor = BusquedaInteractor()
        let router = BusquedaRouter()
        router.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        presenter.view = view
        
        
        interactor.presenter = presenter
        
        view.presenter = presenter
        return view
    }
}
