//
//  BackgroundView.swift
//  memorize3
//
//  Created by ilkay girgin on 11.12.2022.
//

import SwiftUI

struct BackgroundView: View {
    
    
    var body: some View {
        ZStack{
            Circle()
                .strokeBorder(Color.blue, lineWidth: 50.0)
                .frame(width: 200)
                .position(x:150, y:150)
                .blur(radius: 60)
            
            Circle()
                .strokeBorder(Color.purple, lineWidth: 50.0)
                .frame(width: 200)
                .position(x:300, y:420)
                .blur(radius: 60)
            
            Circle()
                .strokeBorder(Color.orange, lineWidth: 50.0)
                .frame(width: 200)
                .position(x:100, y:620)
                .blur(radius: 60)
        }
        
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
