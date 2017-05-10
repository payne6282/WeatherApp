//
//  WeatherCell.swift
//  Weather-App
//
//  Created by Sachin on 3/13/17.
//  Copyright © 2017 Sachin. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    
    @IBOutlet weak var weatherImage: UIImageView!

    @IBOutlet weak var weatherDayName: UILabel!
    
    @IBOutlet weak var weatherType: UILabel!
    
    @IBOutlet weak var weatherMaxTemp: UILabel!
    
    @IBOutlet weak var weatherMinTemp: UILabel!
    
   
    func configureCell(forecast: Forecast) {
        
        self.weatherMinTemp.text = "\(forecast.minTemp)"
        self.weatherMaxTemp.text = "\(forecast.maxTemp)"
        self.weatherType.text = forecast.weatherType
        self.weatherDayName.text = forecast.date
        self.weatherImage.image = UIImage(named: forecast.weatherType)
    }

}
