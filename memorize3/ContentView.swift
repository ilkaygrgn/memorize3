//
//  ContentView.swift
//  memorize3
//
//  Created by ilkay girgin on 30.11.2022.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject var data = DataController()
    
    var body: some View {
        ZStack {
            //Test()
            //MainView2()
            ListWordsView()
        }
        
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
