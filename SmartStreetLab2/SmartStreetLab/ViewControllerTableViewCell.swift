//
//  ViewControllerTableViewCell.swift
//  SmartStreetLab
//
//  Created by Sneha Kasetty Sudarshan on 9/19/17.
//  Copyright © 2017 Sneha Kasetty Sudarshan. All rights reserved.
//

import UIKit

class ViewControllerTableViewCell: UITableViewCell {
    @IBOutlet weak var name1: UILabel!

    @IBOutlet weak var desc1: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet var rateButton: [UIButton]!

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
