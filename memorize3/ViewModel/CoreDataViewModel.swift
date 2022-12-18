//
//  CoreDataViewModel.swift
//  memorize3
//
//  Created by ilkay girgin on 18.12.2022.
//

import Foundation
import CoreData

class CoreDataViewModel: ObservableObject {
    
    let container: NSPersistentContainer
    
    @Published var allWords: [Word] = []
    
    @Published var previewWords: [Word] = []
    
    init() {
        container = NSPersistentContainer(name: "Main")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error Loading Core Data : \(error)")
            }
        }
        
        fetchWords()
        
    }
    
    func fetchWords() {
        
        let request = NSFetchRequest<Word>(entityName: "Word")
        //request.predicate = NSPredicate(format: "level = %i", 3)
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Word.name, ascending: true)]
        
        
        do {
            allWords = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching entities. : \(error)")
        }
        
    }
    
    func addWord(addedWord: Word) {
        let newWord = Word(context: container.viewContext)
        newWord.name = addedWord.name
        newWord.translate = addedWord.translate
        newWord.meaning = addedWord.meaning
        newWord.sentence = addedWord.sentence
        newWord.level = addedWord.level
        newWord.repeats = 0
        
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchWords()
        } catch let error {
            print("Error saving core data: \(error)")
        }
    }
}
