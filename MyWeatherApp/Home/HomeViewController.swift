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
    var databs = CoreDataManager()
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
        databs.checkBD()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addCity))
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
        networkData.fetchCityAndHandleResult(cityName: cityName, cityID: cityID)
    }
    
    private func createCancelAction() -> UIAlertAction {
        return UIAlertAction(title: "Отмена", style: .default)
    }
}
//    MARK: - UICollectionViewDataSource Methods

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.citiesApiMass.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellTV = tableView.dequeueReusableCell(withIdentifier: "cellTV", for: indexPath) as! MyCustomCellTV
        cellTV.cityLabelView.text = self.citiesApiMass[indexPath.row].name
        cellTV.tempLabelView.text = String(Int(self.citiesApiMass[indexPath.row].main.temp))
        cellTV.MinlabelView.text = String(Int(self.citiesApiMass[indexPath.row].main.tempMin))
        cellTV.MaxlabelView.text = String(Int(self.citiesApiMass[indexPath.row].main.tempMax))
        return cellTV
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            CoreDataManager.shared.deleteCity(with: self.citiesApiMass[indexPath.row].name)
            self.citiesApiMass.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = DetailsViewController()
        detailsVC.nameCity = self.citiesApiMass[indexPath.row].name
        detailsVC.tempCity = String(Int(self.citiesApiMass[indexPath.row].main.temp))
        detailsVC.tempMin = String(Int(self.citiesApiMass[indexPath.row].main.tempMin))
        detailsVC.tempMax = String(Int(self.citiesApiMass[indexPath.row].main.tempMax))
        detailsVC.humidity = String(Int(self.citiesApiMass[indexPath.row].main.humidity))
        detailsVC.pressure = String(Int(self.citiesApiMass[indexPath.row].main.pressure))
        detailsVC.feelsLike = String(Int(self.citiesApiMass[indexPath.row].main.feelsLike))
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}

