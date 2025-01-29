//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Gabriel Dario on 1/29/25.
//

import SwiftUI

struct WeatherView: View {
    
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading){
            VStack{
                VStack(alignment: .leading, spacing: 5){
                    Text(weather.name)
                        .bold().font(.title)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))" )
                        .fontWeight(.light)
                }
                .frame (maxWidth: .infinity, alignment: .leading)
                Spacer()
                
                VStack{
                    HStack{
                        
                        VStack(spacing: 20){
                            
                            //change later to display the correct icon for the weather
                            
                            Image(systemName: "cloud.fill")
                                .font(.system(size: 40))
                            
                            Text(weather.weather[0].main)
                            
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size: 90))
                            .fontWeight(.bold)
                            .padding()
                    }
                    
                    Spacer()
                        .frame(height: 80)
                    
                    AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                case .success(let image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 350)
                                    
                                    
                                case .failure:
                                    ProgressView()
                                    
                                @unknown default:
                                    EmptyView()
                                }
                        Spacer()
                        
                            }
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame (maxWidth: .infinity, alignment: .leading)
            
            
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 20){
                    Text("Weather now")
                        .bold().padding(.bottom)
                    
                    HStack{
                        WeatherRow(logo: "thermometer.low", name: "Min Temp", value: (weather.main.tempMin.roundDouble() + "°"))
                            
                        Spacer()
                        
                        WeatherRow(logo: "thermometer.high", name: "Max Temp", value: (weather.main.tempMax.roundDouble() + "°"))
                        
                    }
                    HStack{
                        WeatherRow(logo: "wind", name: "Wind Speed", value: (weather.wind.speed.roundDouble() + "m/s"))
                            
                        Spacer()
                        
                        WeatherRow(logo: "humidity.fill", name: "Humidity", value: (weather.main.humidity.roundDouble() + "%"))
                        
                    }
                    
                }
                .foregroundColor(Color.black)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
            
        }
            .edgesIgnoringSafeArea(.bottom)
            .background(Color.black)
            .preferredColorScheme(.dark)
            
    }
}

#Preview {
    WeatherView(weather: previewWeather)
}
    
