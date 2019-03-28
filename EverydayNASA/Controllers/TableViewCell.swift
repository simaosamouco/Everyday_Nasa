//
//  TableViewCell.swift
//  NASADaily
//
//  Created by Simão Samouco on 27/03/2019.
//  Copyright © 2019 Simão Samouco. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var orbiting_bodyLabel: UILabel!
    @IBOutlet weak var km_secLabel: UILabel!
    @IBOutlet weak var absolute_MagnitudeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
