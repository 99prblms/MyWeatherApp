//
//  DetailViewController.swift
//  MyWeatherApp
//
//  Created by Владислав Наумов on 27.02.2024.
//

import UIKit

class DetailsViewController: UIViewController {
    
    lazy var mainView = DetailsView(nameCity: nameCity, tempCity: tempCity, tempMin: tempMin, tempMax: tempMax, feelsLike: feelsLike, humidity: humidity, pressure: pressure)
    
    var nameCity: String?, tempCity: String?, tempMin: String?, tempMax: String?, feelsLike: String?, humidity: String?, pressure: String?
    
    // MARK: - DetailViewController Life Cycles
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Initializers

    init(nameCity: String? = nil, tempCity: String? = nil, tempMin: String? = nil, tempMax: String? = nil, feelsLike: String? = nil, humidity: String? = nil, pressure: String? = nil) {
        self.nameCity = nameCity
        self.tempCity = tempCity
        self.tempMin = tempMin
        self.tempMax = tempMax
        self.feelsLike = feelsLike
        self.humidity = humidity
        self.pressure = pressure
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

