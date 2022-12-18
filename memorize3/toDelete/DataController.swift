//
//  DataController.swift
//  memorize3
//
//  Created by ilkay girgin on 16.12.2022.
//

import Foundation
import CoreData
import SwiftUI


class DataController: ObservableObject {
   //turn this part into a service which works once
    //let privateContext = NSManagedObjectContext(concurrencyType:  .privateQueueConcurrencyType)
    
    //let container: NSPersistentCloudKitContainer
    
    let container = PersistenceController.shared.container
    /*
    @Published var allWords: [Word]
    
    init() {
        let allWordss: FetchRequest<Word>
        
        allWordss = FetchRequest<Word>(entity: Word.entity(), sortDescriptors: [
            NSSortDescriptor(keyPath: \Word.name, ascending: true)], predicate: NSPredicate(format: "level = %i", 3)
        )
        
        allWords = allWordss.wrappedValue as [Word]
    }
    
    func getWordsFromCoreData() {
        
    }
    */
    

    func getDataFromJSON() {
        let allWords = try! JSONDecoder().decode([wordJSON].self, from: readLocalFile(forName: "words_")!)
        print("\(allWords.count)")
        
        //
        
        //
        
        allWords.forEach { wordjsn in
            print(wordjsn.name)
            
            let word = Word(context: container.viewContext)
            word.name = wordjsn.name
            word.translate = wordjsn.translate
            word.meaning = wordjsn.meaning
            word.sentence = wordjsn.sentence
            word.level = Int16(wordjsn.level)
            word.repeats = Int16(wordjsn.repeats)
            
        }
        
        do {
            try container.viewContext.save()
            
        } catch let saveError {
            print("Failed to save:", saveError)
        }
    }
    
    private func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }
    
    
}

struct wordJSON : Decodable {
    let name: String
    let translate: String
    let meaning: String
    let sentence: String
    let level: Int
    let repeats: Int
}
