//
//  Word-CoreDataHelper.swift
//  memorize3
//
//  Created by ilkay girgin on 19.12.2022.
//

import Foundation

extension Word {
    var nameText: String {
        name ?? ""
    }
    
    var translateText: String {
        translate ?? ""
    }
    
    var meaningText: String {
        meaning ?? ""
    }
    
    var sentenceText: String {
        sentence ?? ""
    }
    
    var levelText: String {
        switch level {
        case 3:
            return "Hard"
        case 2:
            return "Medium"
        case 1:
            return "Easy"
        default: return ""
        }
    }
    
    
    /*
    static var exampleWord: Word {
        let controller = CoreDataViewModel()
        let viewContext = controller.container.viewContext
        
        let word = Word(context: viewContext)
        word.name = "test"
        word.translate = "test"
        word.meaning = "test"
        word.sentence = "test"
        word.level = 3
        word.repeats = 0
        
        return word
    }
     
     */
}
