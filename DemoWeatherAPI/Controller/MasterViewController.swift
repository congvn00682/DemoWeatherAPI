//
//  MasterViewController.swift
//  DemoWeatherAPI
//
//  Created by Vu Ngoc Cong on 5/19/18.
//  Copyright © 2018 Vu Ngoc Cong. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {
    
    
    var weatherForecastday: [Forecastday] = []
    
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Weather7DaysDataServices.shared.getWeatherAPI {[unowned self] weather in
            if weather.name == "Hanoi" {
                self.cityName.text = "Hà Nội"
            }
            self.temperatureLabel.text = String(weather.temp_c)
            self.statusLabel.text = weather.condition.text
            self.weatherForecastday = weather.forecastday
            self.tableView.reloadData()
        }
        
    }
    
    func getCurrentDateTime(convert date: TimeInterval) -> String{
        let formater = DateFormatter()
        formater.dateFormat = "EEEE"
        let getDate = formater.string(from: Date(timeIntervalSinceReferenceDate: date))
        return getDate
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension MasterViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherForecastday.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WeatherTableViewCell
        let weather = weatherForecastday[indexPath.row]
        cell.imageIcon.download(from: weather.condition.icon)
        cell.maxtempLabel.text = String(weather.maxtemp_c)
        cell.mintempLabel.text = String(weather.mintemp_c)
        cell.thuLabel.text = getCurrentDateTime(convert: weather.date_epoch)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return collectionView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    
}

extension MasterViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collection", for: indexPath)
        
        // Configure the cell
        
        return cell
    }
}
