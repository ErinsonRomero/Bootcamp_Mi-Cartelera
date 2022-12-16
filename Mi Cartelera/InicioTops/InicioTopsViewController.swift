//
//  ViewController.swift
//  Mi Cartelera
//
//  Created by Erinson Andres Romero Terry on 15/12/22.
//

import UIKit

class InicioTopsViewController: UIViewController {
    @IBOutlet weak var InicioTopsCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        InicioTopsCollection.delegate = self
        InicioTopsCollection.dataSource = self
        title = "Series Populares"
    }


}


extension InicioTopsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InicioTopsCollectionViewCell", for: indexPath) as! InicioTopsCollectionViewCell
        return cell
    }
    
    
}

