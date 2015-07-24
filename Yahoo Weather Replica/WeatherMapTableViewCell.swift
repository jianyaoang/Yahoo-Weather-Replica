//
//  WeatherMapTableViewCell.swift
//  Yahoo Weather Replica
//
//  Created by VLT Labs on 7/24/15.
//  Copyright (c) 2015 JayAng. All rights reserved.
//

import UIKit
import MapKit

class WeatherMapTableViewCell: UITableViewCell {

    @IBOutlet var cityMap: MKMapView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cityMap.frame = CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height)
        cityMap.mapType = MKMapType.Standard
        
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
