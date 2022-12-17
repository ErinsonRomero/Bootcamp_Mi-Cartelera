//
//  InicioTopsConfigurator.swift
//  Mi Cartelera
//
//  Created by Erinson Andres Romero Terry on 15/12/22.
//

import Foundation
import UIKit
class InicioTopsConfigurator {
    static func busquedaConfiguratorModulo() -> UIViewController {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "InicioTopsViewController") as! InicioTopsViewController
        let presenter = InicioTopsPresenter()
        let interactor = InicioTopsInteractor()
        let router = InicioTopsRouter()
        router.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        presenter.view = view
        
        
        interactor.presenter = presenter
        
        view.presenter = presenter
        return view
    }
}
