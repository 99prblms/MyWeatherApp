//
//  HomeViewController.swift
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
    let id = UUID()
    
    // MARK: - HomeViewController Life Cycles
    
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
    
    // MARK: - Public Methods
    
    @objc func addCity() {
        let addAlert = createAddAlertController()
        present(addAlert, animated: true)
    }
    
    // MARK: - Private Methods
    
    private func createAddAlertController() -> UIAlertController {
        let addAlert = UIAlertController(title: "Введите название города", message: "", preferredStyle: .alert)
        addAlert.addTextField()
        let saveButton = createSaveAction(for: addAlert)
        let cancelButton = createCancelAction()
        addAlert.addAction(saveButton)
        addAlert.addAction(cancelButton)
        return addAlert
    }
    
    private func createSaveAction(for alertController: UIAlertController) -> UIAlertAction {
        return UIAlertAction(title: "Добавить", style: .default) { [weak self] _ in
            self?.handleSaveAction(for: alertController)
        }
    }
    
    private func handleSaveAction(for alertController: UIAlertController) {
        guard let cityName = alertController.textFields?.last?.text else { return }
        let cityID = self.id
        fetchCityAndHandleResult(cityName: cityName, cityID: cityID)
    }
    
    private func fetchCityAndHandleResult(cityName: String, cityID: UUID) {
        networkData.fetchCity(searchCity: cityName) { [weak self] cityResults in
            if let city = cityResults {
                self?.handleCityFound(cityID: cityID, cityName: cityName, city: city)
            } else {
                self?.handleCityNotFound()
            }
        }
    }
    
    private func handleCityFound(cityID: UUID, cityName: String, city: WeatherData) {
        CoreDataManager.shared.createCity(cityID, cityName.capitalized)
        self.citiesApiMass.append(city)
        self.mainView.tableView.reloadData()
    }
    
    private func handleCityNotFound() {
        let errorAlert = UIAlertController(title: "Ошибка", message: "Город не найден", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        errorAlert.addAction(okButton)
        self.present(errorAlert, animated: true, completion: nil)
    }
    
    private func createCancelAction() -> UIAlertAction {
        return UIAlertAction(title: "Отмена", style: .default)
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

