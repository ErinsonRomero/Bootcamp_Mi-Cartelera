//
//  MostrandoConfigurator.swift
//  Mi Cartelera
//
//  Created by Erinson Andres Romero Terry on 16/12/22.
//

import Foundation
import UIKit

class MostrandoConfigurator {
    static func mostrandoConfiguratorModulo (_ modelo: ItemMostrandoProtocol) -> UIViewController {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "MostrandoViewController") as! MostrandoViewController
        
        let presenter = MostrandoPresenter(nombre: modelo.nombre, imagen: modelo.poster, vote: modelo.vote_average, id: String(modelo.id), overview: modelo.overview)
        let interactor = MostrandoInteractor()
        
        
        presenter.interactor = interactor
        
        presenter.view = view
        
        
        interactor.presenter = presenter
        
        view.presenter = presenter
        
        return view
    }
}

