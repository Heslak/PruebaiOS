//
//  BuildingTableViewCell.swift
//  PruebaiOS
//
//  Created by Sergio Acosta on 9/3/18.
//  Copyright © 2018 Sergio Acosta. All rights reserved.
//

import UIKit

class BuildingTableViewCell: UITableViewCell {

    @IBOutlet weak var projectImage: UIImageView!
    
    @IBOutlet weak var projectBuilding: UILabel!
    @IBOutlet weak var projectYear: UILabel!
    @IBOutlet weak var projectArea: UILabel!
    @IBOutlet weak var projectPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
