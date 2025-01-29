//
//  ModelData.swift
//  WeatherApp
//
//  Created by Gabriel Dario on 1/29/25.
//

import Foundation

var previewWeather: ResponseBody = load("weatherData.json")


func load<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        
        let data = try Data(contentsOf: file)
        
        
        let decoder = JSONDecoder()
        let decodedData = try decoder.decode(T.self, from: data)
        return decodedData
    } catch {
        
        fatalError("Couldn't load or parse \(filename) as \(T.self):\n\(error)")
    }
}
