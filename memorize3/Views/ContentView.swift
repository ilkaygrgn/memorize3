//
//  ContentView.swift
//  memorize3
//
//  Created by ilkay girgin on 30.11.2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm : CoreDataViewModel
    
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject var data = DataController()
    
    
    
    var body: some View {
        ZStack {
            
            //ListWordsView()
            WorkoutView(currentWord: vm.getNewWord())
            //AppTabBarView()
        }
        
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
