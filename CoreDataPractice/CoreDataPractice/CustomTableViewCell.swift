//
//  CustomTableViewCell.swift
//  CoreDataPractice
//
//  Created by Wajeeh Anwar on 11/6/16.
//  Copyright © 2016 Wajeeh Anwar. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    // Add Custom Cell Image and Labels
    @IBOutlet weak var fluidIcon: UIImageView!
    @IBOutlet weak var fluidType: UILabel!
    @IBOutlet weak var fluidAmount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
