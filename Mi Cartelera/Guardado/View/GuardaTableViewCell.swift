//
//  GuardaTableViewCell.swift
//  Mi Cartelera
//
//  Created by Erinson Andres Romero Terry on 16/12/22.
//

import Foundation
import UIKit
class GuardaTableViewCell: UITableViewCell {

    @IBOutlet weak var guardaSerieImageView: UIImageView!
    @IBOutlet weak var guartaTituloLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
