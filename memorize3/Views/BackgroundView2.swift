//
//  BackgroundView2.swift
//  memorize3
//
//  Created by ilkay girgin on 18.12.2022.
//

import SwiftUI

struct BackgroundView2: View {
    let colors = [Color("Color1"), Color("Color2"), Color("Color3")]
    
    var body: some View {
        let gradient = Gradient(colors: colors)
        AngularGradient(gradient: gradient, center: UnitPoint(x: 0.4, y: 0.44), angle: Angle(degrees: 65.0))
            .edgesIgnoringSafeArea(.all)
    }
}

struct BackgroundView2_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView2()
    }
}
