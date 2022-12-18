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
        ZStack{
            BackgroundView2()
            NavigationView{
                List {
                    ForEach(vm.allWords) { wordItem in
                        ListItemView(name: wordItem.name ?? "" , repeats: Int(wordItem.repeats))
                    }
                }
                .listStyle(.plain)
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
    var name: String
    var repeats: Int
    
    var body: some View {
        HStack {
            Text(name)
                .foregroundColor(Color("BlueDark"))
            Spacer()
            
            Image(systemName: "eye")
                .foregroundColor(Color("BlueDark"))
            
            Text("\(repeats)")
                .foregroundColor(Color("BlueDark"))
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color("BlueLight")))
    }
}
