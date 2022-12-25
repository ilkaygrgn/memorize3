//
//  CustomTabView.swift
//  memorize3
//
//  Created by ilkay girgin on 20.12.2022.
//

import Foundation
import SwiftUI

struct TabItemData {
    let image: String
    let selectedImage: String
    let title: String
}

struct TabItemView: View {
    let data: TabItemData
    let isSelected: Bool
    
    var body: some View {
        VStack {
            Image(isSelected ? data.selectedImage : data.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 32, height: 32)
                .animation(.default, value: isSelected)
            
            Spacer().frame(height: 4)
            
            Text(data.title)
                .foregroundColor(isSelected ? .black : .gray)
                .font(.system(size: 14))
        }
    }
}


struct TabBottomView: View {
    
    let tabbarItems: [TabItemData]
    var height: CGFloat = 70
    var width: CGFloat = UIScreen.main.bounds.width - 32
    @Binding var selectedIndex: Int
    
    var body: some View {
        HStack {
            Spacer()
            
            ForEach(tabbarItems.indices) { index in
                let item = tabbarItems[index]
                Button {
                    self.selectedIndex = index
                } label: {
                    let isSelected = selectedIndex == index
                    TabItemView(data: item, isSelected: isSelected)
                }
                Spacer()
            }
        }
        .frame(width: width, height: height)
        .background(Color.blue)
        .cornerRadius(13)
        .shadow(radius: 5, x: 0, y: 4)
    }
}

struct CustomTabView<Content: View>: View {
    
    let tabs: [TabItemData]
    @Binding var selectedIndex: Int
    @ViewBuilder let content: (Int) -> Content
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedIndex) {
                ForEach(tabs.indices) { index in
                    content(index)
                        .tag(index)
                }
            }
            .background(Color.green)
            
            VStack {
                Spacer()
                TabBottomView(tabbarItems: tabs, selectedIndex: $selectedIndex)
            }
            .padding(.bottom, 8)
        }
    }
}

enum TabType: Int, CaseIterable {
    case home = 0
    case myFile
    case profile
    
    var tabItem: TabItemData {
        switch self {
        case .home:
            return TabItemData(image: "Vector", selectedImage: "Vector", title: "Home")
        case .myFile:
            return TabItemData(image: "Vector", selectedImage: "Vector", title: "My File")
        case .profile:
            return TabItemData(image: "Vector", selectedImage: "Vector", title: "Me")
        }
    }
}


