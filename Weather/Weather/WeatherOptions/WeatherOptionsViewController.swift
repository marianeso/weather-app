//
//  WetherOptionsViewController.swift
//  Weather
//
//  Created by Wellington on 23/11/22.
//

import UIKit

class WeatherOptionsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var localsTable: UITableView!
    
    private let cityManager = CityManager ()
    
    var cityName: String = ""
    private var cities: [CityData] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        self.localsTable.dataSource = self
        self.localsTable.delegate = self

        self.fetchCityWeather()
    }
    
    private func fetchCityWeather() {
        self.activityIndicator.startAnimating()

        self.cityManager.fetchCityWithCompletion(city: self.cityName) { citiesData in
            self.cities = citiesData ?? []
            DispatchQueue.main.async {
                self.localsTable.reloadData()
                self.activityIndicator.stopAnimating()
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cities.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = .clear
        cell.textLabel?.font = .boldSystemFont(ofSize: 20)
        let city = cities[indexPath.row].name ?? ""
        let state = cities[indexPath.row].state ?? ""
        let country = cities[indexPath.row].country ?? ""
        cell.textLabel?.text = city + " - " + state + " - " + country
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let notification = Notification(name: Notification.Name("send"),
                                        object: cities[indexPath.row],
                                        userInfo: nil)
        NotificationCenter.default.post(notification)
        
        self.navigationController?.popViewController(animated: true)
    }
}
