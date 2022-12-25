//
//  ListWordsView.swift
//  memorize3
//
//  Created by ilkay girgin on 17.12.2022.
//

import SwiftUI

struct ListWordsView: View {
    
    @EnvironmentObject var vm: CoreDataViewModel
    
    @State var selectedIndex = 0
    
    @State var searchText: String = ""
    
    @State var isSearchResultEmpty = false
    
    @State var newWord: Word? = nil
    @State var showDetailView = false
    
    var body: some View {
        
        NavigationView {
            ZStack{
                BackgroundView2()
                    .blur(radius: 5)
               
                VStack{
                    
                    HStack(spacing:0) {
                        Text("Word List")
                            .font(Font.custom("Montserrat-SemiBold", size: 25))
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    .foregroundColor(Color("TextDark"))
                    
                    SearchBarView(searchText: $searchText)
                        .padding(.bottom)
                    
                    
                    if !searchText.isEmpty && searchResults.isEmpty{
                        /*
                        NavigationLink(destination: WordDetailView(currentWord: vm.createNewWord(wordName: searchText)))
                        {
                            HStack{
                                Image(systemName: "plus")
                                    
                                Text("Add new word : \(searchText)")
                                    .font(.headline)
                            }
                            .padding()
                            .foregroundColor(Color("TextDark"))
                            .background(RoundedRectangle(cornerRadius: 15)
                                .fill(Color("White")))
                        }
                        */
                        Button {
                            //Add new word logic add...
                            
                            newWord = vm.createNewWord(wordName: searchText)
                            showDetailView = true
                            print("sth")
                        } label: {
                            HStack{
                                Image(systemName: "plus")
                                    
                                Text("Add new word : \(searchText)")
                                    .font(.headline)
                            }
                            .padding()
                            .foregroundColor(Color("TextDark"))
                            .background(RoundedRectangle(cornerRadius: 15)
                                .fill(Color("White")))
                        }
                         
                    }
                    

                    
                    ScrollView{
                        LazyVStack {
                            /*
                            ForEach(vm.allWords) { wordItem in
                                ListItemView(word: wordItem)
                            }
                             */
                            ForEach(searchResults) { wordItem in
                                ListItemView(word: wordItem)
                            }
                        }
                    }
                    
                    

                    //.searchable(text: $searchText, prompt: "Seach for a word...")
                }
                .padding(.horizontal)
            }
            .background{
                //NavigationLink(destination: WordDetailView(currentWord: newWord!), isActive: $showDetailView, label: {EmptyView()})
            }
        }
        
        
    }
    
    var searchResults: [Word] {
        if searchText.isEmpty {
            return vm.allWords
        } else {
            return vm.allWords.filter{ $0.nameText.contains(searchText.lowercased()) }
        }
    }
}

struct ListWordsView_Previews: PreviewProvider {
    static let vm = CoreDataViewModel()
    static var previews: some View {
        ListWordsView().environmentObject(vm)
    }
}

struct ListItemView: View {
    
    @ObservedObject var word: Word
    
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
