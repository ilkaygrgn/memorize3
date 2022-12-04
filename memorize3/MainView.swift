//
//  MainView.swift
//  memorize3
//
//  Created by ilkay girgin on 1.12.2022.
//

import SwiftUI

struct MainView: View {
    let colors = [Color("Color1"), Color("Color2"), Color("Color3")]
    let centerLocation = UnitPoint(x: 0.4, y: 0.44)
    let angle = Angle(degrees: 65)
    
    var body: some View {
        let gradient = Gradient(colors: colors)
        ZStack{
            AngularGradient(gradient: gradient, center: centerLocation, angle: angle)
                .edgesIgnoringSafeArea(.all)
            VStack{
                HStack(spacing:0) {
                    Text("Memorize")
                        .font(Font.custom("Montserrat-SemiBold", size: 20))
                    Text("3")
                        .font(Font.custom("Kristi-Regular", size: 80))
                        .padding(.top,15)
                        .padding(.leading, -10)
                        .frame(height: 50)
                    Spacer()
                }
                .padding(.horizontal)
                .foregroundColor(.white)
                
                ZStack{
                    HStack{
                        Spacer()
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.green)
                            .frame(width: 80, height: 70)
                    }
                    
                    CustomBlurView(effect: .systemUltraThinMaterialLight) { view in
                        
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                    .frame(height: 70)
                    
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
                .padding(.horizontal)
                WordPod()
                WordPod()
                WordPod()
                
                Spacer()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


struct CustomBlurView: UIViewRepresentable {
    var effect: UIBlurEffect.Style
    var onChange: (UIVisualEffectView)->()
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: effect))
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        DispatchQueue.main.async {
            onChange(uiView)
        }
    }
    
}

struct WordPod: View {
    @State var isVisible = false
    var body: some View {
        ZStack{
            HStack{
                Spacer()
                if !isVisible{
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.red)
                        .frame(width: 80, height: 150)
                }
                
            }
            
            CustomBlurView(effect: .systemUltraThinMaterialDark) { view in
                
            }
            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
            .frame(height: 150)
            .padding(.leading,20)
            
            HStack{
                Text("Headline")
                    .fixedSize()
                    .frame(width: 20)
                    .rotationEffect(Angle(degrees: -90))
                
                if isVisible{
                    Text("This is translated word into local language, This is translated word into local language,This is translated word into local language,This is translated word into local language,This is translated word into local language,This is translated word into local language")
                        .foregroundColor(.white)
                        .frame(height: 150)
                }
               
                
                Spacer()
                
                if !isVisible {
                    Text("Reveal")
                        .foregroundColor(.white)
                        .onTapGesture {
                            withAnimation {
                                isVisible.toggle()
                            }
                           
                        }
                }
                
            }
            .padding(.trailing)
        }
        .padding(.horizontal)
    }
}
