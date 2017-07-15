//
//  Constants.swift
//  WeatherAPP
//
//  Created by Hardik Wason on 04/07/17.
//  Copyright © 2017 Hardik Wason. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "lon="
let APP_ID = "&appid="
let API_KEY = "ad3f2d8639284d83f2e47a6464e67ec7"
typealias DownloadComplete = () -> ()
let CURRENT_WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&appid=ad3f2d8639284d83f2e47a6464e67ec7"
let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&cnt=10&mode=json&appid=ad3f2d8639284d83f2e47a6464e67ec7"





