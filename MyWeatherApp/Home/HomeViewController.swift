//
//  ViewController.swift
//  MyWeatherApp
//
//  Created by Владислав Наумов on 19.02.2024.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var mainView = HomeView()
    lazy var mainModel = HomeModel()
    lazy var mainApi = ApiManager()
    var networkData = DataFetcher()
    var citiesApiMass = [WeatherData]()
    var idMass = [UUID]()
    let id = UUID()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
        mainView.tableView.register(MyCustomCellTV.self, forCellReuseIdentifier: "cellTV")
        checkBD()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addCity))
    }
    
    
    @objc func addCity() {
        let addAlert = UIAlertController(title: "Введите название города", message: "", preferredStyle: .alert)
        addAlert.addTextField()
        let saveButton = UIAlertAction(title: "Добавить", style: .default) { [weak self] _ in
            if let textName = addAlert.textFields?.last?.text {
                let cityID = self?.id ?? UUID()
                self?.networkData.fetchCity(searchCity: textName) { cityResults in
                    if let city = cityResults {
                        CoreDataManager.shared.createCity(cityID, textName.capitalized)
                        self?.citiesApiMass.append(city)
                        self?.mainView.tableView.reloadData()
                    } else {
                        let errorAlert = UIAlertController(title: "Ошибка", message: "Город не найден", preferredStyle: .alert)
                        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
                        errorAlert.addAction(okButton)
                        self?.present(errorAlert, animated: true, completion: nil)
                    }
                }
            }
        }
        
        addAlert.addAction(saveButton)
        let cancelButton = UIAlertAction(title: "Отмена", style: .default)
        addAlert.addAction(cancelButton)
        present(addAlert, animated: true)
    }
    
    public func checkBD() {
        let mass = CoreDataManager.shared.fetchCitysBD()
        if !mass.isEmpty {
            for str in mass {
                guard let cityNamed = str.cityNamed else {
                    continue
                }
                self.networkData.fetchCity(searchCity: cityNamed) { cityResults in
                    if let city = cityResults {
                        self.citiesApiMass.append(city)
                        self.mainView.tableView.reloadData()
                    } else {
                    }
                }
            }
        }
    }
}
//    MARK: - UICollectionViewDataSource Methods

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesApiMass.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellTV = tableView.dequeueReusableCell(withIdentifier: "cellTV", for: indexPath) as! MyCustomCellTV
        cellTV.cityLabelView.text = citiesApiMass[indexPath.row].name
        cellTV.tempLabelView.text = String(Int(citiesApiMass[indexPath.row].main.temp))
        cellTV.MinlabelView.text = String(Int(citiesApiMass[indexPath.row].main.tempMin))
        cellTV.MaxlabelView.text = String(Int(citiesApiMass[indexPath.row].main.tempMax))
        return cellTV
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            CoreDataManager.shared.deleteCity(with: citiesApiMass[indexPath.row].name)
            citiesApiMass.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = DetailsViewController()
        detailsVC.nameCity = citiesApiMass[indexPath.row].name
        detailsVC.tempCity = String(Int(citiesApiMass[indexPath.row].main.temp))
        detailsVC.tempMin = String(Int(citiesApiMass[indexPath.row].main.tempMin))
        detailsVC.tempMax = String(Int(citiesApiMass[indexPath.row].main.tempMax))
        detailsVC.humidity = String(Int(citiesApiMass[indexPath.row].main.humidity))
        detailsVC.pressure = String(Int(citiesApiMass[indexPath.row].main.pressure))
        detailsVC.feelsLike = String(Int(citiesApiMass[indexPath.row].main.feelsLike))
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}
