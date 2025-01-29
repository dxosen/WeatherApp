//
//  ContentView.swift
//  WeatherApp
//
//  Created by Gabriel Dario on 1/29/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    
    var body: some View {
        VStack {
            
            if let location = locationManager.location {
                
                
                if let weather = weather {
                    WeatherView(weather: weather)
                }else{
                    LoadingView()
                        .task{
                            do {
                               weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                                
                            }catch{
                                
                                print("erroer fetching weather data: \(error)")
                            }
                        }
                }
                
                
                
            }else{
                
                if locationManager.isLoading {
                    LoadingView()
                }else{
                    WelcomeView().environmentObject(locationManager)
                }
            }
        }
        .background(Color.black)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
