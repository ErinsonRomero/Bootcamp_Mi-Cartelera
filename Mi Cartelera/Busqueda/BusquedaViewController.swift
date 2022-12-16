//
//  BusquedaViewController.swift
//  Mi Cartelera
//
//  Created by Erinson Andres Romero Terry on 16/12/22.
//

import UIKit

protocol BusquedaViewControllerProtocol {

}

class BusquedaViewController: UIViewController {
    
    
    @IBOutlet weak var busquedaTableview: UITableView!
    
    var presenter: BusquedaPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        busquedaTableview.delegate = self
        busquedaTableview.dataSource = self
        title = "Busqueda"
        
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
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = busquedaTableview.dequeueReusableCell(withIdentifier: "BusquedaTableViewCell", for: indexPath) as! BusquedaTableViewCell
        
        return cell
    }
    
    
}

extension BusquedaViewController: BusquedaViewControllerProtocol {
    
}
