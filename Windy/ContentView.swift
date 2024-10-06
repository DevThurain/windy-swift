//
//  ContentView.swift
//  Windy
//
//  Created by Thurain on 10/5/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundGradientView(topColor: isNight ? .black: .blue,
                                   bottomColor: isNight ? .gray: Color("lightBlue"))
            
            VStack(spacing: 20){

                TodayStatusView(locationName: "Yangon, MM",
                                imageName: "cloud.sun.fill",
                                temperature: "37")
                .padding(.bottom, 20)
                
                HStack(spacing: 20){
                    
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "cloud.sun.fill",
                                   temperature: 77)
                    
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "sun.max.fill",
                                   
                                   temperature: 77)
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "wind.snow",
                                   temperature: 77)
                    
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "cloud.rain.fill",
                                   temperature: 77)
                    
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "cloud.snow.fill",
                                   temperature: 77)
                    
                }
                Spacer()
                Button{
                    isNight.toggle()
                } label: {
                    WeatherButton(text: "Change Day Time")
                }
               Spacer()

            }
            }
        }
    }


#Preview {
    ContentView()
}

struct BackgroundGradientView: View {
    
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(
            colors: [topColor, bottomColor],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        ).ignoresSafeArea()
    }
}

struct WeatherDayView: View{
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View{
        VStack(spacing: 8){
            Text(dayOfWeek)
                .font(.system(size: 16,weight: .medium))
                .foregroundColor(.white)
            
            VStack(spacing: 8){
                Image(systemName: imageName)
                    .symbolRenderingMode(.multicolor)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                
                Text("\(temperature)°")
                    .font(.system(size: 24,weight: .bold))
                    .foregroundColor(.white)
            }
        }
    }
}


struct TodayStatusView: View {
    
    var locationName: String
    var imageName: String
    var temperature: String
    
    var body: some View {
        VStack{
            Text(locationName)
                .font(.system(size: 32,weight: .medium))
                .foregroundColor(.white)
                .padding(.vertical, 16)
            
            VStack(spacing: 16){
                Image(systemName: imageName)
                    .symbolRenderingMode(.multicolor)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                
                Text("\(temperature)°")
                    .font(.system(size: 70,weight: .medium))
                    .foregroundColor(.white)
            }
        }
    }
}

struct WeatherButton: View {
    var text: String
    var body: some View {
        Text(text)
            .frame(width: 280,height: 50)
            .background(.white)
            .font(.system(size: 18, weight: .bold))
            .cornerRadius(10)
    }
}
