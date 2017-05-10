//
//  WeatherVC.swift
//  Weather-App
//
//  Created by Sachin on 12/14/16.
//  Copyright © 2016 Sachin. All rights reserved.
//

import UIKit
import Alamofire

class WeatherVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var currentDate: UILabel!
    @IBOutlet weak var currentTemperature: UILabel!
    @IBOutlet weak var currentPlace: UILabel!
    @IBOutlet weak var currentCOndition: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    
    @IBOutlet weak var weatherTableView: UITableView!

    var foreCast: Forecast!
    var forecasts = [Forecast]()
    
    var weatherData = WeatherData()
   // var forecast = Forecast()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherTableView.delegate = self
        weatherTableView.dataSource = self
        
        weatherData.downLoadWeatherData {
            self.downLoadForecastData {
                 self.updateUI()
            }
            
        }
    }
    
    func downLoadForecastData(completed: @escaping downloadComplete)  {
        let currentWeatherURL = URL(string: Forecast_URL)!
        Alamofire.request(currentWeatherURL).responseJSON {
            response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                    
                    for obj in list {
                        
                        let forecast = Forecast(weatherDict: obj)
                        self.forecasts.append(forecast)
                    }
                    self.forecasts.remove(at: 0)
                    self.weatherTableView.reloadData()
                }
            }
        
            completed()
    }
}
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = weatherTableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as? WeatherCell {
            
            let forecast = forecasts[indexPath.row]
            cell.configureCell(forecast: forecast)
            return cell
        }
        
        else
        
        {
            return WeatherCell()
        }
}

    func updateUI() {
        
        currentTemperature.text = "\(weatherData.currentTemp)"
        currentDate.text = weatherData.date
        currentPlace.text = weatherData.cityName
        currentCOndition.text = weatherData.weatherType
        currentWeatherImage.image = UIImage(named: weatherData.weatherType)
    }
}


