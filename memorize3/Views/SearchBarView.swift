//
//  SearchBarView.swift
//  memorize3
//
//  Created by ilkay girgin on 21.12.2022.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color("TextDark"))
                .opacity(searchText.isEmpty ? 0.9 : 0.9)
            TextField("Search for word...", text: $searchText)
                .foregroundColor(Color("TextDark"))
                .disableAutocorrection(true)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10)
                        .foregroundColor(Color("TextDark"))
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            UIApplication.shared.endEditing()
                            searchText = ""
                        }
                    , alignment: .trailing
                )
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color("White"))
                .shadow(radius: 10, x: 10.0, y:10.0)
                    
        )
        //.padding()
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchText: .constant("hello"))
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
