//
//  WeatherCell.swift
//  WeatherAPP
//
//  Created by Hardik Wason on 06/07/17.
//  Copyright © 2017 Hardik Wason. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    @IBOutlet weak var image_weather: UIImageView!
    @IBOutlet weak var weatherDay: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var highTemp: UILabel!
    @IBOutlet weak var lowTemp: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configcell(forecast: Forecast) {
        lowTemp.text = "\(forecast.lowtemp)"
        highTemp.text = "\(forecast.hightemp)"
        weatherType.text = forecast.weathertype
        image_weather.image = UIImage(named: forecast.weathertype)
        weatherDay.text = forecast.day
    }
}
