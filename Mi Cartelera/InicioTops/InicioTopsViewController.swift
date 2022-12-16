//
//  ViewController.swift
//  Mi Cartelera
//
//  Created by Erinson Andres Romero Terry on 15/12/22.
//

import UIKit

class InicioTopsViewController: UIViewController {
    @IBOutlet weak var InicioTopsCollection: UICollectionView!
    
    var inicioTopsSeriesManager = InicioTopsSeries()
    var series: [Results]?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        InicioTopsCollection.delegate = self
        InicioTopsCollection.dataSource = self
        title = "Series Populares"
        inicioTopsSeriesManager.delegate = self
        inicioTopsSeriesManager.Tipo(tipo: "tv/popular")
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
    
    
}

extension InicioTopsViewController: InicioTopsSeriesDelegate {
    func didUpdateSerie(movie: [Results]) {
        DispatchQueue.main.async {
            self.series = movie
            self.InicioTopsCollection.reloadData()
        }
    
        
    }
    
    func didFailWithError(error: Error) {
        
    }
    
    
}

