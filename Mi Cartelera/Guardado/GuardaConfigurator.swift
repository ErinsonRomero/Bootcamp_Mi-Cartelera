//
//  GuardaConfigurator.swift
//  Mi Cartelera
//
//  Created by Erinson Andres Romero Terry on 16/12/22.
//

import Foundation
import UIKit
class GuardaConfigurator {
    static func guardaConfiguratorModulo() -> UIViewController {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "GuardaViewController") as! GuardaViewController
        let presenter = GuardaPresenter()
        let interactor = GuardaInteractor()
        
        
        presenter.interactor = interactor
        
        presenter.view = view
        
        
        interactor.presenter = presenter
        
        view.presenter = presenter
        
        return view
    }
}
