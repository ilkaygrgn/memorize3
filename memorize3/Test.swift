//
//  Test.swift
//  memorize3
//
//  Created by ilkay girgin on 30.11.2022.
//

import SwiftUI

struct Test: View {
    let colors = [Color("Color1"), Color("Color2"), Color("Color3")]
    
    let centerLocation = UnitPoint(x: 0.4, y: 0.44)
    let angle = Angle(degrees: 65)
    
    @State var textSlide = 162.0
    
    //let gradient = Gradient(colors: c)

    var body: some View {
        let gradient = Gradient(colors: colors)
        ZStack{
            AngularGradient(gradient: gradient, center: centerLocation, angle: angle)
                .edgesIgnoringSafeArea(.all)
            
            ZStack{
                Parallelogram(percent: -5)
                    .frame(width: 250, height: 80)
                    .foregroundColor(.white)
                    .padding(.leading, 89)
                    .padding(.bottom, 77)
                
                    .mask {
                        HStack(spacing:0) {
                            Text("Memorize")
                                .font(Font.custom("Montserrat-SemiBold", size: 33))
                                .position(x: textSlide, y: 30)
                            Text("3")
                                .font(Font.custom("Kristi-Regular", size: 120))
                                .position(x: textSlide-77, y: 40)
                        }
                        
                    }
                 
            }
            .padding(.leading,95)
            .animation(.default, value: textSlide)
             
            
           
            Circle()
                .strokeBorder(Color("Color4"), lineWidth: 50.0)
                .position(x:390, y:720)
            
            Button {
                textSlide = 162
            } label: {
                Text("slide")
            }
            .padding(.top, 300)
            
            Button {
                textSlide = 0
            } label: {
                Text("slide2")
            }
            .padding(.top, 500)

        }
        .onAppear{
           
        }
        
        
        
        
    }
}

struct Parallelogram: Shape {
  @State var percent: Double
  func path(in rect: CGRect) -> Path {
    let edge = rect.width * CGFloat(percent/100)
    var path = Path()
    path.move(to: CGPoint(x: rect.minX + edge, y: rect.minY))
    path.addLine(to: CGPoint(x: rect.maxX + edge, y: rect.minY))
    path.addLine(to: CGPoint(x: rect.maxX - edge, y: rect.maxY ))
    path.addLine(to: CGPoint(x: rect.minX - edge, y: rect.maxY))
    path.closeSubpath()
    return path
  }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
