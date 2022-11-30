//
//  HomeViewController.swift
//  Weather
//
//  Created by Wellington on 15/11/22.

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tempetureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    private let weatherManager = WeatherManager ()  // colocando a classe dentro da variavel
    
    var long: Double = 0.0
    var lat: Double = 0.0
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupObserver()
        
        let cityData = CityData(name: "Rio de Janeiro", lat: -22.9110137, lon: -43.2093727, country: "BR", state: "Rio de Janeiro")
        self.fetchDetailsWeather(place: cityData)
        


    }
    
    private func fetchDetailsWeather(place: CityData) {
        self.weatherManager.fetchWeatherWithCompletion (lat: place.lat ?? 0, long: place.lon ?? 0) { detailsWeather in
            DispatchQueue.main.async {
                self.cityLabel.text = place.name
                
                let weatherModel = WeatherModel(conditionId: detailsWeather?.weather?.first?.id ?? 0, temperature: detailsWeather?.main?.temp ?? 0)
                self.conditionImageView.image = UIImage(systemName: weatherModel.conditionName)
                self.tempetureLabel.text = weatherModel.temperatureString
            }
        }
    }
    
    
    @IBAction func searchButton(_ sender: Any) {
        let telaDois = WeatherOptionsViewController()
        let text = searchTextField.text
        telaDois.cityName = text ?? ""
        if text == "" {
            // create the alert
                   let alert = UIAlertController(title: "Error", message: "Enter a local", preferredStyle: UIAlertController.Style.alert)

                   // add an action (button)
                   alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))

                   // show the alert
                   self.present(alert, animated: true, completion: nil)
               }
        self.navigationController?.pushViewController(telaDois, animated: true)
        self.navigationController?.navigationBar.tintColor = .black

    }
    
    private func setupObserver() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.updatePlace),
                                               name: Notification.Name("send"),
                                               object: nil)
    }
    
    
    @objc private func updatePlace (with notification: Notification) {
        guard let place = notification.object as? CityData else { return }
        
        self.fetchDetailsWeather(place: place)
    }
}




