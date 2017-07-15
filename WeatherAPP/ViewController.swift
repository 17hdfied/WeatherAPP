//
//  ViewController.swift
//  WeatherAPP
//
//  Created by Hardik Wason on 04/07/17.
//  Copyright © 2017 Hardik Wason. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {
    @IBOutlet weak var date_lbl: UILabel!
    @IBOutlet weak var temp_lbl: UILabel!
    @IBOutlet weak var location_lbl: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var WeatherType_lbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
     var currentweather: CurrentWeather!
    var forecast: Forecast!
    var forecasts = [Forecast]()
    let locationManager = CLLocationManager()
    var currentLocation : CLLocation!
        override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()
            
              }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationAuthStatus()
    }
    
    func locationAuthStatus() {
    if CLLocationManager.authorizationStatus() == .authorizedWhenInUse
    {
        currentLocation = locationManager.location
        Location.sharedInstance.latitude = currentLocation.coordinate.latitude
        Location.sharedInstance.longitude = currentLocation.coordinate.longitude
        currentweather = CurrentWeather()
        currentweather.downloadweatherdetails
            {  self.downloadforecast {
                
                self.UpdateUI()
                }
        }


    } else {
          locationManager.requestWhenInUseAuthorization()
          locationAuthStatus()
        }
    }
   
   
    
    
    func downloadforecast(completed:  @escaping DownloadComplete)
    {
        Alamofire.request(FORECAST_URL).responseJSON {
            response in
            let result = response.result
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                    for obj in list {
                        let forecast = Forecast(weatherDict: obj)
                        self.forecasts.append(forecast)
                        print(obj)
                    }
                    self.forecasts.remove(at: 0)
                    self.tableView.reloadData()
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
        
       if let cell = tableView.dequeueReusableCell(withIdentifier: "weathercell", for: indexPath) as? WeatherCell
        {
            let forecast = forecasts[indexPath.row]
            cell.configcell(forecast: forecast)
            return cell
        }
       else {
        return WeatherCell()
        }
    }
    
    func UpdateUI()  {
        date_lbl.text = currentweather.date
        temp_lbl.text = "\(currentweather.currenttemp)"
        location_lbl.text = currentweather._cityname
        WeatherType_lbl.text = currentweather.weathertype
        imageView.image = UIImage(named: currentweather.weathertype)
    }
    

}

