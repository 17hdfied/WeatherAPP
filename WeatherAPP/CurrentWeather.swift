//
//  CurrentWeather.swift
//  WeatherAPP
//
//  Created by Hardik Wason on 04/07/17.
//  Copyright © 2017 Hardik Wason. All rights reserved.
//

import Foundation
import Alamofire

class CurrentWeather {
    var _cityname : String!
    var _weatherType : String!
    var _date : String!
    var _currentTemp : Double!
    
    var cityname :String {
        if _cityname == nil {
            _cityname = ""
        }
        return _cityname
    }
    
        var weathertype :String {
            if _weatherType == nil {
                _weatherType = ""
            }
            return _weatherType
    }
    
    
    var currenttemp : Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    var date : String {
        if _date == nil
        {
            _date = ""
        }
        let date = DateFormatter()
        date.dateStyle = .long
        date.timeStyle = .none
        let currentdate = date.string(from: Date())
        _date = "Today, \(currentdate)"
        return _date
    }

    func downloadweatherdetails(completed: @escaping DownloadComplete)
    {
        Alamofire.request(CURRENT_WEATHER_URL).responseJSON { response in
            let result = response.result
            print(response)
            if let dict = result.value as? Dictionary<String, AnyObject>{
                if let name = dict["name"] as? String{
                    self._cityname = name.capitalized
                    print(self._cityname)
                }
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                        print(self._weatherType)
                    }
                }
                if let main = dict["main"] as? Dictionary<String, AnyObject>{
                    if let currentTemperature = main["temp"] as? Double
                    {
                        let kelvintoCelsius = currentTemperature - 273.15
                        let kelvintocelsiusact = Double(round(kelvintoCelsius))
                        self._currentTemp = kelvintocelsiusact
                        print(self._currentTemp)
                    }
                }
            }
             completed()
        }
       
    }
    
    }
    
