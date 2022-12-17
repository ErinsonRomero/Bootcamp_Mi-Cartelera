//
//  BusquedaViewController.swift
//  Mi Cartelera
//
//  Created by Erinson Andres Romero Terry on 16/12/22.
//

import UIKit

protocol BusquedaViewControllerProtocol {
    func MostrarSerie(_ name: [Results])
    func showSerie(_ serie: Results)
}

class BusquedaViewController: UIViewController {
    
    @IBOutlet weak var busquedaTableview: UITableView!
    
    var presenter: BusquedaPresenterProtocol?
    var busquedaSeries = [Results]()
    let  searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        busquedaTableview.delegate = self
        busquedaTableview.dataSource = self
        title = "Busqueda"
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension BusquedaViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return busquedaSeries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = busquedaTableview.dequeueReusableCell(withIdentifier: "BusquedaTableViewCell", for: indexPath) as! BusquedaTableViewCell
        cell.busquedaTituloLabel.text = busquedaSeries[indexPath.row].name
        if let imagen = busquedaSeries[indexPath.row].poster_path {
            cell.busquedaImagenImageView.downloaded(from: imagen)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.showSerie(busquedaSeries[indexPath.row])
    }

    
    
}

extension BusquedaViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text {
            self.presenter?.getSerie(text)
        }
    }
}


extension BusquedaViewController: BusquedaViewControllerProtocol {

    
    func MostrarSerie(_ name: [Results]) {
        DispatchQueue.main.async {
            self.busquedaSeries = name
            self.busquedaTableview.reloadData()
        }
        
    }
    
    func showSerie(_ serie: Results) {
        presenter?.showSerie(serie)
    }
}
