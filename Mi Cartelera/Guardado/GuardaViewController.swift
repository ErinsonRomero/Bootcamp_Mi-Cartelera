//
//  GuardaViewController.swift
//  Mi Cartelera
//
//  Created by Erinson Andres Romero Terry on 16/12/22.
//

import Foundation
import UIKit

class GuardaViewController: UIViewController {
    //
    //  GuardadoViewController.swift
    //  MiCartelera
    //
    //  Created by Erinson Andres Romero Terry on 28/11/22.
        
//    var presenter: GuardaPresenterProtocol?

    @IBOutlet weak var guardaTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        guardaTableView.delegate = self
        guardaTableView.dataSource = self
        title = "Para ver mas tarde"
        
    }
    
}

extension GuardaViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = guardaTableView.dequeueReusableCell(withIdentifier: "GuardadoTableViewCell", for: indexPath) as! GuardaTableViewCell
        return cell
    }
      
}
