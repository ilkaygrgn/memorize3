//
//  HomeView.swift
//  memorize3
//
//  Created by ilkay girgin on 18.12.2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            BackgroundView2()
            
            VStack {
                Spacer ()
                HStack(spacing:0) {
                    Text("Memorize")
                        .font(Font.custom("Montserrat-SemiBold", size: 30))
                    Text("3")
                        .font(Font.custom("Kristi-Regular", size: 110))
                        .padding(.top,15)
                        .padding(.leading, -10)
                        .frame(height: 50)
                }
                .foregroundColor(.white)
                .shadow(radius: 10, x: 10.0, y:10.0)
                .padding(.bottom, 50)
                
                HStack{
                    HomeItem(imageName: "figure.walk", title: "Word\nWorkout", textColor: "BlueDark", cardColor: "BlueLight")
                    
                    HomeItem(imageName: "list.bullet", title: "List\nWords", textColor: "PurpleDark", cardColor: "PurpleLight")
                }
                //.padding()
                
                HStack{
                    HomeItem(imageName: "clock.arrow.circlepath", title: "History\n", textColor: "OrangeDark", cardColor: "OrangeLight")
                    
                    HomeItem(imageName: "magnifyingglass", title: "Search\n& Add", textColor: "BlueDark", cardColor: "BlueLight")
                }
                
                //.padding()
                
                Spacer()
            }
            .padding()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct HomeItem: View {
    var imageName: String
    var title: String
    var textColor: String
    var cardColor: String
    
    
    var body: some View {
        VStack{
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .padding()
            
            Text(title)
                .bold()
                .multilineTextAlignment(.leading)
            
        }
        .frame(maxWidth: .infinity, minHeight: 120)
        .foregroundColor(Color(textColor))
        .padding()
        .background(RoundedRectangle(cornerRadius: 15)
            .foregroundColor(Color(cardColor))
            .shadow(radius: 10, x: 10.0, y:10.0)
        )
        .padding()
        .font(Font.custom("Montserrat-SemiBold", size: 18))
    }
}
