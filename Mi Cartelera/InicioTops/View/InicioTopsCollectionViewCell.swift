//
//  InicioTopsCollectionViewCell.swift
//  Mi Cartelera
//
//  Created by Erinson Andres Romero Terry on 15/12/22.
//

import UIKit

class InicioTopsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var topsImageView: UIImageView!
    @IBOutlet weak var topsSeriesLabel: UILabel!
    
    override func prepareForReuse() {
        topsImageView.image = UIImage(named: "SinImagen")
    }
}
