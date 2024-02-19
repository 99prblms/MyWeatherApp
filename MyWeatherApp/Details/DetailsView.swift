//
//  DetailsView.swift
//  MyWeatherApp
//
//  Created by Владислав Наумов on 27.02.2024.
//

import UIKit

class DetailsView: UIView {
    
    public var cityLabelView: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 50)
        label.text = "City"
        label.textAlignment = .center
        return label
    }()
    
    public var tempLabelView: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 100)
        label.text = "Temp"
        label.textAlignment = .left
        return label
    }()
    
    public var cityNameLabelView: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .left
        label.text = "Город"
        label.textColor = .gray
        return label
    }()
    
    public var tempNameLabelView: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .left
        label.text = "Температура"
        label.textColor = .gray
        return label
    }()
    
    public var tempMinLabelView: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30)
        label.text = "Temp"
        return label
    }()
    
    public var tempMinNameLabelView: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30)
        label.text = "Мин"
        return label
    }()
    
    public var tempMaxLabelView: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30)
        label.text = "Temp"
        return label
    }()
    
    public var tempMaxNameLabelView: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 32)
        label.text = "Макс"
        return label
    }()
    
    public var feelsLikeLabelView: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Temp"
        label.textAlignment = .left
        return label
    }()
    
    public var feelsLikeNameLabelView: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "По ощущениям"
        label.textAlignment = .left
        return label
    }()
    
    public var humidityLabelView: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30)
        label.text = "Temp"
        label.textAlignment = .left
        return label
    }()
    
    public var humidityNameLabelView: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30)
        label.text = "Влажность"
        label.textAlignment = .left
        return label
    }()
    
    public var pressureLabelView: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30)
        label.text = "Temp"
//        label.textAlignment = .center
        return label
    }()
    
    public var pressureNameLabelView: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30)
        label.text = "Давление"
        return label
    }()
    
    func setupTempMinNameLabelView() {
        tempMinNameLabelView.translatesAutoresizingMaskIntoConstraints = false
        tempMinNameLabelView.layer.masksToBounds = true
        NSLayoutConstraint.activate([
            tempMinNameLabelView.topAnchor.constraint(equalTo: cityLabelView.topAnchor, constant: 250),
            tempMinNameLabelView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 220),
            tempMinNameLabelView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            tempMinNameLabelView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        ])
    }
    
    func setupTempMinLabelView() {
        tempMinLabelView.translatesAutoresizingMaskIntoConstraints = false
        tempMinLabelView.layer.masksToBounds = true
        NSLayoutConstraint.activate([
            tempMinLabelView.topAnchor.constraint(equalTo: tempMinNameLabelView.topAnchor, constant: 0),
            tempMinLabelView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 300),
            tempMinLabelView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            tempMinLabelView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        ])
    }
    
    func setupTempMaxNameLabelView() {
        tempMaxNameLabelView.translatesAutoresizingMaskIntoConstraints = false
        tempMaxNameLabelView.layer.masksToBounds = true
        NSLayoutConstraint.activate([
            tempMaxNameLabelView.topAnchor.constraint(equalTo: cityLabelView.topAnchor, constant: 150),
            tempMaxNameLabelView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 220),
            tempMaxNameLabelView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            tempMaxNameLabelView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        ])
    }
    
    func setupTempMaxLabelView() {
        tempMaxLabelView.translatesAutoresizingMaskIntoConstraints = false
        tempMaxLabelView.layer.masksToBounds = true
        NSLayoutConstraint.activate([
            tempMaxLabelView.topAnchor.constraint(equalTo: tempMaxNameLabelView.topAnchor, constant: 0),
            tempMaxLabelView.leadingAnchor.constraint(equalTo: leadingAnchor, constant:  300),
            tempMaxLabelView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            tempMaxLabelView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        ])
    }
    
    func setupFeelsLikeNameLabelView() {
        feelsLikeNameLabelView.translatesAutoresizingMaskIntoConstraints = false
        feelsLikeNameLabelView.layer.masksToBounds = true
        NSLayoutConstraint.activate([
            feelsLikeNameLabelView.topAnchor.constraint(equalTo: tempLabelView.topAnchor, constant: 150),
            feelsLikeNameLabelView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            feelsLikeNameLabelView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            feelsLikeNameLabelView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        ])
    }
    
    func setupFeelsLikeLabelView() {
        feelsLikeLabelView.translatesAutoresizingMaskIntoConstraints = false
        feelsLikeLabelView.layer.masksToBounds = true
        NSLayoutConstraint.activate([
            feelsLikeLabelView.topAnchor.constraint(equalTo: feelsLikeNameLabelView.topAnchor, constant: 0),
            feelsLikeLabelView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 170),
            feelsLikeLabelView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            feelsLikeLabelView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        ])
    }
    
    func setupHumidityNameLabelView() {
        humidityNameLabelView.translatesAutoresizingMaskIntoConstraints = false
        humidityNameLabelView.layer.masksToBounds = true
        NSLayoutConstraint.activate([
            humidityNameLabelView.topAnchor.constraint(equalTo: feelsLikeLabelView.topAnchor, constant: 100),
            humidityNameLabelView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            humidityNameLabelView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            humidityNameLabelView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        ])
    }
    
    func setupHumidityLabelView() {
        humidityLabelView.translatesAutoresizingMaskIntoConstraints = false
        humidityLabelView.layer.masksToBounds = true
        NSLayoutConstraint.activate([
            humidityLabelView.topAnchor.constraint(equalTo: humidityNameLabelView.topAnchor, constant: 80),
            humidityLabelView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            humidityLabelView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            humidityLabelView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        ])
    }
    
    func setupPressureNameLabelView() {
        pressureNameLabelView.translatesAutoresizingMaskIntoConstraints = false
        pressureNameLabelView.layer.masksToBounds = true
        NSLayoutConstraint.activate([
            pressureNameLabelView.topAnchor.constraint(equalTo: humidityLabelView.topAnchor, constant: -80),
            pressureNameLabelView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 220),
            pressureNameLabelView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            pressureNameLabelView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        ])
    }
    
    func setupPressureLabelView() {
        pressureLabelView.translatesAutoresizingMaskIntoConstraints = false
        pressureLabelView.layer.masksToBounds = true
        NSLayoutConstraint.activate([
            pressureLabelView.topAnchor.constraint(equalTo: pressureNameLabelView.topAnchor, constant: 80),
            pressureLabelView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 220),
            pressureLabelView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            pressureLabelView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        ])
    }
    
    func setupCityLabelView() {
        cityLabelView.translatesAutoresizingMaskIntoConstraints = false
        cityLabelView.layer.masksToBounds = true
        NSLayoutConstraint.activate([
            cityLabelView.topAnchor.constraint(equalTo: topAnchor, constant: -500),
            cityLabelView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            cityLabelView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            cityLabelView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        ])
    }
    
    func setupTempLabelView() {
        tempLabelView.translatesAutoresizingMaskIntoConstraints = false
        tempLabelView.layer.masksToBounds = true
        NSLayoutConstraint.activate([
            tempLabelView.topAnchor.constraint(equalTo: cityLabelView.topAnchor ,constant: 200),
            tempLabelView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            tempLabelView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            tempLabelView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        ])
    }
    
    func setupNameCityLabelView() {
        cityNameLabelView.translatesAutoresizingMaskIntoConstraints = false
        cityNameLabelView.layer.masksToBounds = true
        NSLayoutConstraint.activate([
            cityNameLabelView.topAnchor.constraint(equalTo: topAnchor,constant: -500),
            cityNameLabelView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            cityNameLabelView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            cityNameLabelView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        ])
    }
    
    func setupNameTempLabelView() {
        tempNameLabelView.translatesAutoresizingMaskIntoConstraints = false
        tempNameLabelView.layer.masksToBounds = true
        NSLayoutConstraint.activate([
            tempNameLabelView.topAnchor.constraint(equalTo: cityLabelView.topAnchor ,constant: 200),
            tempNameLabelView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            tempNameLabelView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            tempNameLabelView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        ])
    }
    
    init(nameCity: String?, tempCity: String?, tempMin: String?, tempMax: String?, feelsLike: String?, humidity: String?, pressure: String?) {
        super.init(frame: .zero)
        self.backgroundColor = .systemBackground
        addSubviews()
        setupCityLabelView()
        setupTempLabelView()
        setupTempMinLabelView()
        setupTempMinNameLabelView()
        setupTempMaxLabelView()
        setupTempMaxNameLabelView()
        setupHumidityLabelView()
        setupHumidityNameLabelView()
        setupPressureLabelView()
        setupPressureNameLabelView()
        setupFeelsLikeLabelView()
        setupFeelsLikeNameLabelView()
        
        cityLabelView.text = nameCity
        tempLabelView.text = tempCity
        tempMinLabelView.text = tempMin
        tempMaxLabelView.text = tempMax
        humidityLabelView.text = humidity
        feelsLikeLabelView.text = feelsLike
        pressureLabelView.text = pressure
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        addSubview(cityLabelView)
        addSubview(tempLabelView)
        addSubview(tempMinLabelView)
        addSubview(tempMinNameLabelView)
        addSubview(tempMaxLabelView)
        addSubview(tempMaxNameLabelView)
        addSubview(humidityLabelView)
        addSubview(humidityNameLabelView)
        addSubview(pressureLabelView)
        addSubview(pressureNameLabelView)
        addSubview(feelsLikeLabelView)
        addSubview(feelsLikeNameLabelView)
    }
}

