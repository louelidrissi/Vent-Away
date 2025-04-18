//
//  WeatherKitManager.swift
//  VentAway
//
//  Created by Lou El Idrissi on 12/22/24.
//

import Foundation
import WeatherKit

@MainActor class WeatherKitManager: ObservableObject {
    @Published var weather:Weather?
    
    func getWeather(){
        async {
            do {
                weather = try await Task.detached(priority:.userInitiated){
                    return try await
                        WeatherService.shared.weather(for:.init(latitude: 42.330810546875, longitude: -83.04602813720703)) // 42.330810546875 , -83.04602813720703
                    }.value
                    
            } catch {
                fatalError("\(error)")
                
            }
            
            
        }
        
    }
    
    var symbol: String {
        weather?.currentWeather.symbolName ?? "xmark"
    }
    var temp:String {
        
        let temp = weather?.currentWeather.temperature
        let convertedTemp = temp?.converted(to: .celsius).description
        return convertedTemp ?? "Connecting to Apple Weather Servers"
    }
}
