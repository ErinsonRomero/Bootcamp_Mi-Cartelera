//
//  BusquedaTableViewCell.swift
//  Mi Cartelera
//
//  Created by Erinson Andres Romero Terry on 16/12/22.
//

import UIKit

class BusquedaTableViewCell: UITableViewCell {


    @IBOutlet weak var busquedaTituloLabel: UILabel!
    
    @IBOutlet weak var busquedaImagenImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        busquedaImagenImageView.image = UIImage(named: "SinImagen")
    }

}

