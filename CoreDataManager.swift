//
//  CoreDataManager.swift
//  MyWeatherApp
//
//  Created by Владислав Наумов on 19.02.2024.
//

import UIKit
import CoreData

//MARK: - CRUD CoreData

public final class CoreDataManager: NSObject {
    public static let shared = CoreDataManager()
    private override init() {}
    private var appDelegate: AppDelegate {
        UIApplication.shared.delegate as! AppDelegate
    }
    private var context: NSManagedObjectContext {
        appDelegate.persistentContaner.viewContext
    }
    
    //MARK: - Create
    public func createCity (_ id: UUID, _ cityNamed: String) {
        guard let cityEntityDescription = NSEntityDescription.entity(forEntityName: "City", in: context) else {
            return
        }
        let city = City(entity: cityEntityDescription, insertInto: context)
        city.id = id
        city.cityNamed = cityNamed
        
        appDelegate.saveContext()
    }
    
    //MARK: - Read
    public func fetchCityBD(with cityNamed: String) -> City? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "City")
        fetchRequest.predicate = NSPredicate(format: "cityNamed == %@", cityNamed)
        do {
            let citys = try? context.fetch(fetchRequest) as? [City]
            return citys?.first
        }
    }
    
    public func fetchCitysBD() -> [City] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "City")
        do {
            return (try? context.fetch(fetchRequest) as? [City]) ?? []
        }
    }
    
    //MARK: - Update
    func updateCity(with id: UUID, cityNamed: String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "City")
        fetchRequest.predicate = NSPredicate(format: "id == %@", "id", id as CVarArg)
        do {
            guard let citys = try? context.fetch(fetchRequest) as? [City],
                  let city = citys.first else { return }
            city.cityNamed = cityNamed
        }
        appDelegate.saveContext()
    }
    
    //MARK: - Delete
    public func deleteAllCity() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "City")
        do {
            let citys = try? context.fetch(fetchRequest) as? [City]
            citys?.forEach { context.delete($0) }
        }
        appDelegate.saveContext()
    }
    
    public func deleteCity(with cityNamed: String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "City")
        do {
            guard let citys = try? context.fetch(fetchRequest) as? [City],
                  let city = citys.first(where: {$0.cityNamed == cityNamed}) else { return }
            context.delete(city)
        }
        appDelegate.saveContext()
    }
}
