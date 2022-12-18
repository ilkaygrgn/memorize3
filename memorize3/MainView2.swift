//
//  MainView2.swift
//  memorize3
//
//  Created by ilkay girgin on 11.12.2022.
//

import SwiftUI

struct MainView2: View {
    
    var wordGetter = WordScraper()
    
    var body: some View {
        ZStack{
            BackgroundView()
            VStack{
                HStack(spacing:0) {
                    Text("Memorize")
                        .font(Font.custom("Montserrat-SemiBold", size: 20))
                        .foregroundColor(Color.blue)
                    Text("3")
                        .font(Font.custom("Kristi-Regular", size: 80))
                        .padding(.top,15)
                        .padding(.leading, -10)
                        .frame(height: 50)
                        .foregroundColor(Color.blue)
                    Spacer()
                }
                .padding(.horizontal, 30)
                .foregroundColor(.white)
                
                ZStack{
                    
                    HStack{
                        Text("Current Word")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                            .frame(height: 70)
                        
                        Spacer()
                        
                        Text("Easy")
                            .foregroundColor(.white)
                            
                    }
                    
                    .padding(.horizontal)
                }
                .background(RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.blue))
                .padding(.horizontal)
                WordPod2()
                WordPod2()
                WordPod2()
                
                Spacer()
            }
        }
        .onAppear(
            perform: wordGetter.getWord
        )
    }
}

struct WordPod2: View {
    @State var isVisible = false
    @State var pad = 70.0
    var body: some View {
        ZStack{
            HStack{
                Text("Headline")
                    .fixedSize()
                    .frame(width: 20)
                    .rotationEffect(Angle(degrees: -90))
                    .onTapGesture {
                        withAnimation {
                            isVisible.toggle()
                            pad = 70.0
                        }
                    }
                
                ZStack{
                    HStack{
                        Spacer()
                        //if !isVisible {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.red)
                                .frame(width: 150, height: 150)
                                .overlay(alignment: .trailing, content: {
                                    Text("Reveal")
                                        .foregroundColor(.white)
                                        .padding(.trailing, 10)
                                }
                                )
                                .onTapGesture {
                                    withAnimation {
                                        isVisible.toggle()
                                        pad = 0.0
                                    }
                                }
                       // }
                    }
                    
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.blue)
                        .frame(height: 150)
                        .padding(.trailing, pad)
                        .overlay(alignment: .leading) {
                            if isVisible{
                                Text("This is translated word into local language, This is translated word into local language,This is translated word into local language,This is translated word into local language,This is translated word into local language,This is translated word into local language")
                                    .foregroundColor(.white)
                                    .frame(height: 150)
                                    .padding()
                            }
                        }
                }
            }
        }
        .padding(.horizontal)
    }
}


struct MainView2_Previews: PreviewProvider {
    static var previews: some View {
        MainView2()
    }
}


