//
//  ListWordsView.swift
//  memorize3
//
//  Created by ilkay girgin on 17.12.2022.
//

import SwiftUI

struct ListWordsView: View {
    
    @EnvironmentObject var vm: CoreDataViewModel
    
    var body: some View {
        NavigationView{
            ZStack{
                BackgroundView2()
                    .blur(radius: 5)
                
                VStack{
                    HStack(spacing:0) {
                        Text("Word List")
                            .font(Font.custom("Montserrat-SemiBold", size: 20))
                        Spacer()
                    }
                    .padding()
                    .padding(.horizontal)
                    .foregroundColor(Color("TextDark"))
                    
                    ScrollView{
                        LazyVStack {
                            ForEach(vm.allWords) { wordItem in
                                ListItemView(word: wordItem)
                            }
                        }
                    }
                }
                
            }
        }
        
        
    }
}
/*
struct ListWordsView_Previews: PreviewProvider {
    
    static var previews: some View {
        ListWordsView()
    }
}
*/


struct ListItemView: View {
    
    @ObservedObject var word: Word
    
    //var name: String
    //var repeats: Int
    
    var body: some View {
        NavigationLink(destination: WordDetailView(currentWord: word), label: {
            HStack {
                Text(word.nameText)
                
                Spacer()
                
                Image(systemName: "eye")
                
                Text("\(word.repeats)")
            }
            .foregroundColor(Color("TextDark"))
            .padding()
            //.background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color("BlueLight")))
            .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal)
        })
    }
}
