//
//  ApiManager.swift
//  MyWeatherApp
//
//  Created by Владислав Наумов on 19.02.2024.
//

import Foundation

class ApiManager {
    
    static let shared = ApiManager()
    
    func request(searchCity: String, completion: @escaping (Data?, Error?) -> Void) {
        let parametrs = self.parametrs(searchCity: searchCity)
        let url = self.url(params: parametrs)
        var request = URLRequest(url: url)
        request.httpMethod = "get"
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }
    
    private func apiKey() -> [String:String]? {
        var apiKey = [String:String]()
        apiKey["appid"] = "fc7ce11a14f7530bcde78f6f770cfad1"
        return apiKey
    }
    
    private func parametrs(searchCity: String?) -> [String: String] {
        var parametrs = [String: String]()
        parametrs["q"] = searchCity
        parametrs["units"] = "metric"
        parametrs["appid"] = "fc7ce11a14f7530bcde78f6f770cfad1"
        return parametrs
    }
    
    private func url(params: [String: String]) -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.openweathermap.org"
        components.path = "/data/2.5/weather"
        components.queryItems = params.map{URLQueryItem(name: $0, value: $1)}
        return components.url!
    }
    
    private func createDataTask (from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                completion(data, error)
//                print(String(data: data!, encoding: String.Encoding(rawValue: NSUTF8StringEncoding)) as Any)
            }
        }
    }
}
