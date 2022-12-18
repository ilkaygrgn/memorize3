//
//  memorize3App.swift
//  memorize3
//
//  Created by ilkay girgin on 30.11.2022.
//

import SwiftUI

@main
struct memorize3App: App {
    //let persistenceController = PersistenceController.shared
    //@StateObject var dataController: DataController
    @StateObject var coreDataViewModel: CoreDataViewModel
    
    init() {
        //let dataController = DataController()
        //_dataController = StateObject(wrappedValue: dataController)
        
        let coreDataViewModel = CoreDataViewModel()
        _coreDataViewModel = StateObject(wrappedValue: coreDataViewModel)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                //.environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(coreDataViewModel)
        }
    }
}
