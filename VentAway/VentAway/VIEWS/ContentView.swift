//
//  ContentView.swift
//  VentAway
//
//  Created by Lou El Idrissi on 12/13/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var weatherKitManager = WeatherKitManager()
    
    var body: some View {
        HStack {
            Label(weatherKitManager.temp, systemImage: weatherKitManager.symbol)
        }
        .padding()
        .task{
            await
                weatherKitManager.getWeather()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View{
        ContentView()
    }
}


