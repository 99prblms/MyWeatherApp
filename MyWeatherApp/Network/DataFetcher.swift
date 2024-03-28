//
//  DataFetcher.swift
//  MyWeatherApp
//
//  Created by Владислав Наумов on 19.02.2024.
//

import Foundation
import UIKit

class DataFetcher {
    
    var apiManager = ApiManager()
    
    func fetchCity(searchCity: String, completion: @escaping (WeatherData?) -> ()) {
        apiManager.request(searchCity: searchCity) { data, error in
            if let error = error {
                print("Error received reauesting data: \(error.localizedDescription)")
                completion(nil)
            }
            let decode = self.decodeJSON(type: WeatherData.self, from: data)
            completion(decode)
        }
    }
    
    func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from else { return nil }
        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch let jsonError {
            print("Failed to decode JSON", jsonError)
            return nil
        }
    }
}
