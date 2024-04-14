//
//  HomeModel.swift
//  MyWeatherApp
//
//  Created by Владислав Наумов on 19.02.2024.
//

import Foundation

class HomeModel {
    
    var networkData = DataFetcher()
    var citiesApiMass = [WeatherData]()
    var myVC = HomeViewController()
    
    public func fetchCityAndHandleResult(cityName: String, cityID: UUID) {
        networkData.fetchCity(searchCity: cityName) { [weak self] cityResults in
            if let city = cityResults {
                self?.handleCityFound(cityID: cityID, cityName: cityName, city: city)
            } else {
                self?.myVC.handleCityNotFound()
            }
        }
    }
    
    public func handleCityFound(cityID: UUID, cityName: String, city: WeatherData) {
        CoreDataManager.shared.createCity(cityID, cityName.capitalized)
        self.citiesApiMass.append(city)
//        self.mainView.tableView.reloadData()
    }
    
}
