//
//  PreviewModel.swift
//  memorize3
//
//  Created by ilkay girgin on 18.12.2022.
//

import Foundation
import CoreData

class PreviewModel: ObservableObject {
    
    @Published var allWords: [Word] = []
    
    init() {
        
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
            allWords.append(newWord)
        }
    }
}
