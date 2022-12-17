//
//  ViewController.swift
//  Mi Cartelera
//
//  Created by Erinson Andres Romero Terry on 15/12/22.
//

import UIKit


protocol InicioTopsViewProtocol {
    func MostrarSerie(_ name: [Results])
}

class InicioTopsViewController: UIViewController {
    @IBOutlet weak var InicioTopsCollection: UICollectionView!
    
    var presenter: InicioTopsPresenterProtocol?
    var inicioTopsSeriesManager = InicioTopsSeries()
    var series: [Results]?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        InicioTopsCollection.delegate = self
        InicioTopsCollection.dataSource = self
        title = "Series Populares"
//        InicioTopsConfigurator.inicioTopsConfiguratorModulo(self)
        presenter?.getSerie("tv/popular")
    }
    
    @IBAction func searchButton(_ sender: Any) {
        presenter?.searchView()
    }
    @IBAction func guardadosButton(_ sender: Any) {
        presenter?.guardadosView()
    }

}


extension InicioTopsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return series?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InicioTopsCollectionViewCell", for: indexPath) as! InicioTopsCollectionViewCell
        cell.topsSeriesLabel.text = series?[indexPath.row].name
        if let imagen = series?[indexPath.row].poster_path {
            cell.topsImageView.downloaded(from: imagen)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.ShowSerie(series![indexPath.row])
    }
    
    
}

extension InicioTopsViewController: InicioTopsViewProtocol {
    func MostrarSerie(_ name: [Results]) {
        DispatchQueue.main.async {
            self.series = name
            self.InicioTopsCollection.reloadData()
        }
    }
}


