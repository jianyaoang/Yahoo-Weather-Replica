//
//  ViewController.swift
//  Yahoo Weather Replica
//
//  Created by VLT Labs on 7/24/15.
//  Copyright (c) 2015 JayAng. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController {

    @IBOutlet var weatherHeader: UIView!
    @IBOutlet var weatherTableView: UITableView!
    var backgroundImageView: UIImageView!
    var blurredBackgroundImageView: UIImageView!
    
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var lowTemperatureLabel: UILabel!
    @IBOutlet var highTemperatureLabel: UILabel!
    @IBOutlet var weatherStatus: UILabel!
    @IBOutlet var cityNameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureWeatherTableView()
        configureBackgroundImageView()
    
    }
    
    func configureWeatherTableView() {
        
        weatherTableView.backgroundColor = UIColor.clearColor()
        weatherTableView.tableHeaderView?.backgroundColor = UIColor.clearColor()
        
        weatherHeader = self.weatherTableView.tableHeaderView
        var rect: CGRect = weatherHeader.frame
        rect.size.height = self.view.frame.size.height
        weatherTableView.tableHeaderView?.frame = rect
        weatherTableView.tableHeaderView = nil
        weatherTableView.tableHeaderView = weatherHeader

        temperatureLabel.textColor = UIColor.whiteColor()
        temperatureLabel.font = UIFont(name: "HelveticaNeue", size: 80)
        temperatureLabel.text = "27 C"
        temperatureLabel.sizeToFit()
        
        lowTemperatureLabel.textColor = UIColor.whiteColor()
        lowTemperatureLabel.font = UIFont(name: "HelveticaNeue", size: 20)
        lowTemperatureLabel.text = "Lo: 22 C"
        lowTemperatureLabel.sizeToFit()
        
        highTemperatureLabel.textColor = UIColor.whiteColor()
        highTemperatureLabel.font = UIFont(name: "HelveticaNeue", size: 20)
        highTemperatureLabel.text = "Hi: 35 C"
        highTemperatureLabel.sizeToFit()
        
        weatherStatus.textColor = UIColor.whiteColor()
        weatherStatus.font = UIFont(name: "HelveticaNeue", size: 30)
        weatherStatus.text = "Sunny"
        
        cityNameLabel.text = "San Francisco"
        cityNameLabel.font = UIFont(name: "HelveticaNeue", size: 30)
        cityNameLabel.textColor = UIColor.whiteColor()
        
        weatherTableView.tableHeaderView?.addSubview(weatherStatus)
        weatherTableView.tableHeaderView?.addSubview(lowTemperatureLabel)
        weatherTableView.tableHeaderView?.addSubview(highTemperatureLabel)
        weatherTableView.tableHeaderView?.addSubview(temperatureLabel)
    }
    
    func configureBackgroundImageView() {
        
        backgroundImageView = UIImageView()
        backgroundImageView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
        backgroundImageView.image = UIImage(named: "sf")
        
        blurredBackgroundImageView = UIImageView()
        blurredBackgroundImageView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
        blurredBackgroundImageView.image = UIImage(named: "sf")
        blurredBackgroundImageView.alpha = 0
        
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = CGRectMake(0, 0, blurredBackgroundImageView.frame.size.width, blurredBackgroundImageView.frame.size.height)
        blurredBackgroundImageView.addSubview(blurEffectView)
        
        self.view.addSubview(backgroundImageView)
        self.view.addSubview(blurredBackgroundImageView)
        
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("WeatherCellID") as! WeatherForecastTableViewCell
    
        if indexPath.section == 0 {
            switch indexPath.row {
                
            case 0:
                cell.dayLabel.text = "Monday"
                cell.highTemperatureLabel.text = "30"
                cell.lowTemperatureLabel.text = "20"
                break
            case 1:
                cell.dayLabel.text = "Tuesday"
                cell.highTemperatureLabel.text = "25"
                cell.lowTemperatureLabel.text = "22"
                break
            case 2:
                cell.dayLabel.text = "Wednesday"
                cell.highTemperatureLabel.text = "27"
                cell.lowTemperatureLabel.text = "16"
                break
            case 3:
                cell.dayLabel.text = "Thursday"
                cell.highTemperatureLabel.text = "30"
                cell.lowTemperatureLabel.text = "18"
                break
            case 4:
                cell.dayLabel.text = "Friday"
                cell.highTemperatureLabel.text = "28"
                cell.lowTemperatureLabel.text = "24"
                break
            case 5:
                cell.dayLabel.text = "Saturday"
                cell.highTemperatureLabel.text = "29"
                cell.lowTemperatureLabel.text = "21"
                break
            case 6:
                cell.dayLabel.text = "Sunday"
                cell.highTemperatureLabel.text = "24"
                cell.lowTemperatureLabel.text = "18"
                break
            case 7:
                cell.dayLabel.text = "Monday"
                cell.highTemperatureLabel.text = "30"
                cell.lowTemperatureLabel.text = "20"
                break
            case 8:
                cell.dayLabel.text = "Tuesday"
                cell.highTemperatureLabel.text = "25"
                cell.lowTemperatureLabel.text = "22"
                break
            case 9:
                cell.dayLabel.text = "Wednesday"
                cell.highTemperatureLabel.text = "27"
                cell.lowTemperatureLabel.text = "16"
                break
            default:
                break
            }
        } else {
            
            let mapCell = tableView.dequeueReusableCellWithIdentifier("WeatherMapCellID") as! WeatherMapTableViewCell
            
            let sanFranciscoLocation = CLLocationCoordinate2D(latitude: 37.7833, longitude: -122.4167)
            let weatherMapRegion = MKCoordinateRegionMakeWithDistance(sanFranciscoLocation, 1500, 1500)
            mapCell.cityMap.setRegion(weatherMapRegion, animated: true)
            
            let sanFranciscoPointAnnotation = MKPointAnnotation()
            sanFranciscoPointAnnotation.coordinate = sanFranciscoLocation
            [mapCell.cityMap.addAnnotation(sanFranciscoPointAnnotation)]
            
            return mapCell
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            
            return 10
            
        } else {
            
            return 1
        }
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    
        if indexPath.section == 0 {
            
            return 60
            
        } else {
            
            return 150
        }
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clearColor()
        
        return headerView
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
     
        if section == 1 {
            
            return 30
            
        }
        return 0
    }
}

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
    
        let heightOfScreen = scrollView.bounds.size.height
        let positionOfScrollView = max(0, scrollView.contentOffset.y)
        let percent = min(1.0, positionOfScrollView / heightOfScreen)
        blurredBackgroundImageView.alpha = percent
    
    }
}
