//
//  WeatherForecastTableViewCell.swift
//  Yahoo Weather Replica
//
//  Created by VLT Labs on 7/24/15.
//  Copyright (c) 2015 JayAng. All rights reserved.
//

import UIKit

class WeatherForecastTableViewCell: UITableViewCell {

    @IBOutlet var dayLabel: UILabel!
    @IBOutlet var weatherIconImageView: UIImageView!
    @IBOutlet var highTemperatureLabel: UILabel!
    @IBOutlet var lowTemperatureLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = UIColor.clearColor()
        self.selectionStyle = UITableViewCellSelectionStyle.None
        
        dayLabel.textColor = UIColor.whiteColor()
        dayLabel.font = UIFont(name: "HelveticaNeue", size: 22)
        dayLabel.sizeToFit()
        
        highTemperatureLabel.textColor = UIColor(red: 0.93, green: 0.60, blue: 0.28, alpha: 1)
        highTemperatureLabel.font = UIFont(name: "HelveticaNeue", size: 22)
        highTemperatureLabel.sizeToFit()
        
        lowTemperatureLabel.textColor = UIColor(red: 0.24, green: 0.59, blue: 0.86, alpha: 1)
        lowTemperatureLabel.font = UIFont(name: "HelveticaNeue", size: 22)
        lowTemperatureLabel.sizeToFit()

        weatherIconImageView.contentMode = UIViewContentMode.ScaleAspectFit
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
