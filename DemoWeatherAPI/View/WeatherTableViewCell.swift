//
//  WeatherTableViewCell.swift
//  DemoWeatherAPI
//
//  Created by Vu Ngoc Cong on 5/21/18.
//  Copyright © 2018 Vu Ngoc Cong. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    
    @IBOutlet weak var thuLabel: UILabel!
    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var maxtempLabel: UILabel!
    @IBOutlet weak var mintempLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
