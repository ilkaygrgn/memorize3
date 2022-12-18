//
//  PersistenceController.swift
//  memorize3
//
//  Created by ilkay girgin on 17.12.2022.
//

import Foundation
import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for x in 0..<10 {
            let newWord = Word(context: viewContext)
            newWord.name = "test word \(x)"
            newWord.translate = "new word translate"
            newWord.meaning = "new word meaning"
            newWord.sentence = "new word sentence"
            newWord.level = 3
            newWord.repeats = 0
        }
        
        return result
    }()
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Main")
        
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved Error \(error), \(error.userInfo)")
            }
        }
    }
}
