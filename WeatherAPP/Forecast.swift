//
//  Forecast.swift
//  WeatherAPP
//
//  Created by Hardik Wason on 06/07/17.
//  Copyright © 2017 Hardik Wason. All rights reserved.
//

import UIKit
import Alamofire

class Forecast {
    var _day : String!
    var _weathertype : String!
    var _Hightemp : String!
    var _Lowtemp : String!
    
    var day : String {
        if _day == nil {
            _day = ""
        }
        return _day
    }
    var weathertype : String {
        if _weathertype == nil {
            _weathertype = ""
        }
        return _weathertype
    }

    var hightemp : String {
        if _Hightemp == nil {
            _Hightemp = ""
        }
        return _Hightemp
    }
    
    var lowtemp : String {
        if _Lowtemp == nil {
            _Lowtemp = ""
        }
        return _Lowtemp
    }
    
    init(weatherDict: Dictionary<String, AnyObject>) {
        if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject> {
            if let min = temp["min"] as? Double {
                let kelvintoCelsius = min - 273.15
                let kelvintocelsiusact = Double(round(kelvintoCelsius))
                self._Lowtemp = "\(kelvintocelsiusact)"
            }
            if let max = temp["max"] as? Double {
                let kelvintoCelsius = max - 273.15
                let kelvintocelsiusact = Double(round(kelvintoCelsius))
                self._Hightemp = "\(kelvintocelsiusact)"
            }
        }
        
        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>] {
            if let main = weather[0]["main"] as? String
            {
                self._weathertype = main
            }
        }
        if let date = weatherDict["dt"] as? Double {
            
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self._day = unixConvertedDate.dayOfTheWeek()
        }

        
    }
}
    extension Date {
    func dayOfTheWeek() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEEE"
    return dateFormatter.string(from: self)
    }
}
