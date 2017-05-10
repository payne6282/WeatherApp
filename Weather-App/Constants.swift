//
//  Constants.swift
//  Weather-App
//
//  Created by Sachin on 12/29/16.
//  Copyright © 2016 Sachin. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATTITUDE_URL = "lat="
let LONGITUDE_URL = "&lon="
let APPID = "&appid="
let APPID_VALUE = "d2253b2a315c05feffd62ff3b89aa134"
let FORECAST_BASE_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?"
let CNT = "&cnt=10"

typealias downloadComplete = () -> ()

let WEATHER_URL = "\(BASE_URL)\(LATTITUDE_URL)40.614735\(LONGITUDE_URL)-111.892684\(APPID)\(APPID_VALUE)"

let Forecast_URL = "\(FORECAST_BASE_URL)\(LATTITUDE_URL)40.614735\(LONGITUDE_URL)-111.892684\(CNT)\(APPID)\(APPID_VALUE)"

//http://api.openweathermap.org/data/2.5/weather?lat=-35&lon=132&appid=d2253b2a315c05feffd62ff3b89aa134

//http://api.openweathermap.org/data/2.5/forecast/daily?lat=35&lon=139&cnt=10&appid=d2253b2a315c05feffd62ff3b89aa134
