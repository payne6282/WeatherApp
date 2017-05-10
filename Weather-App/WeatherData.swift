//
//  WeatherData.swift
//  Weather-App
//
//  Created by Sachin on 12/29/16.
//  Copyright © 2016 Sachin. All rights reserved.
//

import Foundation
import Alamofire

class WeatherData {
    var  _cityName: String!
    var  _date: String!
    var  _currentTemp: Double!
    var _weatherType: String!
    
    var cityName: String {
        if  _cityName == nil{
            _cityName = ""
        }
        return _cityName
    }
    
    var date: String {
        if _date == nil {
             _date = ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        return _date
    }
    
    var  currentTemp: Double{
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    var weatherType : String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    func downLoadWeatherData(completed: @escaping downloadComplete) {
        
        let currentWeatherURL = URL(string: WEATHER_URL)!
        Alamofire.request(currentWeatherURL).responseJSON {
            response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                }
                
                if let main = dict["weather"] as? [Dictionary<String,  AnyObject>] {
                    if let desc = main[0]["main"] as? String {
                        self._weatherType = desc.capitalized
                }
                    
                    if let temp = dict["main"] as? Dictionary<String, AnyObject> {
                        if let conv = temp["temp"] as? Double {
                            let farenPre = (conv * (9/5) - 459.67)
                            let faren = Double(round(10 * farenPre/10))
                            self._currentTemp = faren
                        }
                    }
                
            }
        
            completed()
                
            }
    }
}
}
