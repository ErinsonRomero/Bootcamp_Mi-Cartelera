//
//  MostrandoViewController.swift
//  Mi Cartelera
//
//  Created by Erinson Andres Romero Terry on 16/12/22.
//

import Foundation
import UIKit
protocol MostrandoViewControllerProtocol {
    func EstaEnGuardados(_ esta: Bool)
}

class MostrandoViewController: UIViewController {
    
    var presenter: MostrandoPresenterProtocol?
    
    @IBOutlet weak var BotonGuardar: UIBarButtonItem!
    @IBOutlet weak var peliculaPortadaImageView: UIImageView!
    @IBOutlet weak var peliculaTituloLabel: UILabel!
    @IBOutlet weak var puntajeLabel: UILabel!
    @IBOutlet weak var serieTramaLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        peliculaTituloLabel.text = presenter?.getName()
        if let posterUnpackage = presenter?.getPoster() {
            peliculaPortadaImageView.downloaded(from: posterUnpackage)
        }
        serieTramaLabel.text = presenter?.getOverview()
        puntajeLabel.text = "\(presenter!.getVote())/10"
        presenter?.PedirEstadoGuardados(presenter!.getId())

    }
    @IBAction func addSerie(_ sender: UIBarButtonItem) {
        presenter?.getSerie(presenter!.getName(), presenter?.getPoster(), presenter!.getOverview(), presenter!.getVote(), presenter!.getId())
        sender.isHidden = true
    }
}

extension MostrandoViewController: MostrandoViewControllerProtocol {
    func EstaEnGuardados(_ esta: Bool) {
        BotonGuardar.isHidden = esta
    }
    
       
}
