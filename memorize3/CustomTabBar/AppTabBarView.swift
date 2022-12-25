//
//  AppTabBarView.swift
//  memorize3
//
//  Created by ilkay girgin on 21.12.2022.
//

import SwiftUI

// Generics
// ViewBuilder
// PreferenceKey
// MatchedGeometryEffect
struct AppTabBarView: View {
    
    @State private var selection: String = "home"
    @State private var tabSelection: TabBarItem = .home
    
    var body: some View {
        CustomTabBarContainerView(selection: $tabSelection) {
            ListWordsView()
                .tabBarItem(tab: .profile, selection: $tabSelection)
            
            ListWordsView()
                .tabBarItem(tab: .messages, selection: $tabSelection)

            ListWordsView()
                .tabBarItem(tab: .home, selection: $tabSelection)
            
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

struct AppTabBarView_Previews: PreviewProvider {
    
    static var previews: some View {
        AppTabBarView()
    }
}

extension AppTabBarView {
    
    private var defaultTabView: some View {
        TabView(selection: $selection) {
            Color.red
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            Color.blue
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorites")
                }
            Color.orange
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
    }
    
}

struct TestTabView: View {
    
    let text: String
    @State private var textFieldText: String = ""
    
    init(text: String) {
        self.text = text
        print("INIT" + text)
    }
    
    var body: some View {
        VStack {
            Text(text)
                .onAppear {
                    print("ONAPPEAR" + text)
            }
            TextField("Type something...", text: $textFieldText)
                .disableAutocorrection(true)
            
        }
    }
}
