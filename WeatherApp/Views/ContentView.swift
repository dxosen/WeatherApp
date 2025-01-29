//
//  ContentView.swift
//  WeatherApp
//
//  Created by Gabriel Dario on 1/29/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    
    
    var body: some View {
        VStack {
            
            if let location = locationManager.location {
                Text("Your coordinates are: \(location.longitude), \(location.latitude)")
                
            }else{
                
                if locationManager.isLoading {
                    ProgressView()
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
