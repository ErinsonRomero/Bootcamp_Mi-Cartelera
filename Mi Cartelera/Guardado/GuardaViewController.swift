//
//  GuardaViewController.swift
//  Mi Cartelera
//
//  Created by Erinson Andres Romero Terry on 16/12/22.
//

import Foundation
import UIKit

protocol GuardaViewControllerProtocol {
    func MandarGuardados(_ seriesGuardadas: [SeriesGuardadas])
}

class GuardaViewController: UIViewController {
    //
    //  GuardadoViewController.swift
    //  MiCartelera
    //
    //  Created by Erinson Andres Romero Terry on 28/11/22.
        
//    var presenter: GuardaPresenterProtocol?

    @IBOutlet weak var guardaTableView: UITableView!
    
    var listaSeries = [SeriesGuardadas]()
    var presenter: GuardaPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        guardaTableView.delegate = self
        guardaTableView.dataSource = self
        title = "Para ver mas tarde"
        presenter?.getSerie()
        
    }
    
}

extension GuardaViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listaSeries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = guardaTableView.dequeueReusableCell(withIdentifier: "GuardadoTableViewCell", for: indexPath) as! GuardaTableViewCell
        cell.guartaTituloLabel.text = listaSeries[indexPath.row].nombreSerie
        if let image = listaSeries[indexPath.row].imagenUrl {
            cell.guardaSerieImageView.downloaded(from: image)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let borrar = UIContextualAction(style: .destructive, title: "Borrar") {(action, view, completionHandler) in
            let serieRemovida = self.listaSeries[indexPath.row]
            self.presenter?.removerSerie(serieRemovida)
        }
        return UISwipeActionsConfiguration(actions: [borrar])
    }
      
}

extension GuardaViewController: GuardaViewControllerProtocol {
    func MandarGuardados(_ seriesGuardadas: [SeriesGuardadas]) {
        self.listaSeries = seriesGuardadas
        guardaTableView.reloadData()
    }
}
