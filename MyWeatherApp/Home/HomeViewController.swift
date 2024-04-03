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
        mainModel.checkBD()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addCity))
    }
    
    // MARK: - Public Methods
    
    @objc func addCity() {
        let addAlert = createAddAlertController()
        present(addAlert, animated: true)
    }
    
    func handleCityNotFound() {
        let errorAlert = UIAlertController(title: "Ошибка", message: "Город не найден", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        errorAlert.addAction(okButton)
        self.present(errorAlert, animated: true, completion: nil)
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
        mainModel.fetchCityAndHandleResult(cityName: cityName, cityID: cityID)
    }
    
    private func createCancelAction() -> UIAlertAction {
        return UIAlertAction(title: "Отмена", style: .default)
    }
}

//    MARK: - UICollectionViewDataSource Methods

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainModel.citiesApiMass.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellTV = tableView.dequeueReusableCell(withIdentifier: "cellTV", for: indexPath) as! MyCustomCellTV
        cellTV.cityLabelView.text = mainModel.citiesApiMass[indexPath.row].name
        cellTV.tempLabelView.text = String(Int(mainModel.citiesApiMass[indexPath.row].main.temp))
        cellTV.MinlabelView.text = String(Int(mainModel.citiesApiMass[indexPath.row].main.tempMin))
        cellTV.MaxlabelView.text = String(Int(mainModel.citiesApiMass[indexPath.row].main.tempMax))
        return cellTV
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            CoreDataManager.shared.deleteCity(with: mainModel.citiesApiMass[indexPath.row].name)
            mainModel.citiesApiMass.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = DetailsViewController()
        detailsVC.nameCity = mainModel.citiesApiMass[indexPath.row].name
        detailsVC.tempCity = String(Int(mainModel.citiesApiMass[indexPath.row].main.temp))
        detailsVC.tempMin = String(Int(mainModel.citiesApiMass[indexPath.row].main.tempMin))
        detailsVC.tempMax = String(Int(mainModel.citiesApiMass[indexPath.row].main.tempMax))
        detailsVC.humidity = String(Int(mainModel.citiesApiMass[indexPath.row].main.humidity))
        detailsVC.pressure = String(Int(mainModel.citiesApiMass[indexPath.row].main.pressure))
        detailsVC.feelsLike = String(Int(mainModel.citiesApiMass[indexPath.row].main.feelsLike))
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}

