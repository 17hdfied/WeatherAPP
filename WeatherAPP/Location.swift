//
//  Location.swift
//  WeatherAPP
//
//  Created by Hardik Wason on 06/07/17.
//  Copyright © 2017 Hardik Wason. All rights reserved.
//

import CoreLocation

class Location {
    static var sharedInstance = Location()
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
}

