//
//  City+CoreDataProperties.swift
//  MyWeatherApp
//
//  Created by Владислав Наумов on 21.02.2024.
//
//

import Foundation
import CoreData

@objc(City)
public class City: NSManagedObject { }

extension City {
    @NSManaged public var id: UUID
    @NSManaged public var cityNamed: String?
}

extension City : Identifiable {

}
