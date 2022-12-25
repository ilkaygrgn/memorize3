//
//  WordScraper.swift
//  memorize3
//
//  Created by ilkay girgin on 11.12.2022.
//

import Foundation
import SwiftSoup

struct WordScraper {
    
    var myURL = URL(string: "https://dictionary.cambridge.org/tr/s%C3%B6zl%C3%BCk/ingilizce/hello")
    
    func getWord() {
        print("in wordScraper!!")
        
        let html = try! String(contentsOf: myURL!, encoding: .utf8)

            do {
                let doc: Document = try SwiftSoup.parseBodyFragment(html)
                let headerTitle = try doc.title()
                let element = try doc.select("div[class=" + "def ddef_d db" + "]").first()
                
                let text = try element!.getElementsByTag("div").text();

                print(text)
                // my body
                let body = doc.body()
                // elements to remove, in this case images
                let undesiredElements: Elements? = try body?.select("img[src]")
                //remove
                try undesiredElements?.remove()


                print("Header title: \(headerTitle)")
            } catch Exception.Error(let type, let message) {
                print("Message: \(message)")
            } catch {
                print("error")
            }
    }
    
}
