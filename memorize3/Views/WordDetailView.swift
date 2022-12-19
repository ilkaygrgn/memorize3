//
//  WordDetailView.swift
//  memorize3
//
//  Created by ilkay girgin on 19.12.2022.
//

import SwiftUI

struct WordDetailView: View {
    
    @EnvironmentObject var data: CoreDataViewModel
    
    let currentWord: Word
    
    @State var name: String
    @State var translation: String
    @State var meaning: String
    @State var sentence: String
    @State var repeats: Int
    @State var level: Int
    
    init(currentWord: Word){
        self.currentWord = currentWord
        
        _name = State(wrappedValue: currentWord.nameText)
        _translation = State(wrappedValue: currentWord.translateText)
        _meaning = State(wrappedValue: currentWord.meaningText)
        _sentence = State(wrappedValue: currentWord.sentenceText)
        _repeats = State(wrappedValue: Int(currentWord.repeats))
        _level = State(wrappedValue: Int(currentWord.level))
        
    }
    
    var body: some View {
        ZStack{
            BackgroundView2()
                
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(.all)
                .foregroundColor(.white)
                .opacity(0.0)
            
            VStack{
                HStack(spacing:0) {
                    Text("Word Detail Edit")
                        .font(Font.custom("Montserrat-SemiBold", size: 20))
                    Spacer()
                }
                .padding()
                .padding(.horizontal)
                .foregroundColor(Color("TextDark"))
                
                ZStack{
                    
                    HStack {
                        TextField("Enter word...", text: $name)
                            .font(.title2)
                            .bold()
                            .frame(height: 70)
                        
                        Spacer()
                        
                        Picker("Level", selection: $level){
                            Text("Easy").tag(1)
                            Text("Medium").tag(2)
                            Text("Hard").tag(3)
                        }
                        .pickerStyle(.menu)
                        //Text(currentWord.levelText)
                            
                    }
                    .foregroundColor(Color("TextDark"))
                    .padding(.horizontal)
                }
                .background(RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color("White")))
                .padding(.horizontal)
                WordPod3(currentText: $translation, headline: "Translation", color1: Color("BlueMiddle"), color2: Color("BlueLight"))
                WordPod3(currentText: $meaning, headline: "Meaning", color1: Color("PurpleMiddle"), color2: Color("PurpleLight"))
                WordPod3(currentText: $sentence, headline: "Sentence", color1: Color("OrangeMiddle"), color2: Color("OrangeLight"))
                
                Spacer()
            }
        }
        .onDisappear{
            update()
            data.saveData()
        }
    }
    
    func update(){
        currentWord.objectWillChange.send()
        
        currentWord.name = name
        currentWord.translate = translation
        currentWord.meaning = meaning
        currentWord.sentence = sentence
        currentWord.level = Int16(level)
    }
}
/*
struct WordDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        WordDetailView(currentWord: )
    }
}
*/

struct WordPod3: View {
    
    @State var isVisible = false
    @State var pad = 70.0
    
    @Binding var currentText: String
    var headline: String
    var color1: Color
    var color2: Color
    
    var body: some View {
        ZStack{
            HStack{
                Text(headline)
                    .bold()
                    .fixedSize()
                    .frame(width: 20)
                    .rotationEffect(Angle(degrees: -90))
                    .onTapGesture {
                        withAnimation {
                            isVisible.toggle()
                            pad = 70.0
                        }
                    }
                    .foregroundColor(Color("TextDark"))
                
                ZStack{
                    HStack{
                        Spacer()
                        //if !isVisible {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(color1)
                                .frame(width: 150, height: 150)
                                .overlay(alignment: .trailing, content: {
                                    Text("Reveal")
                                        .foregroundColor(Color("TextDark"))
                                        .padding(.trailing, 10)
                                }
                                )
                                .onTapGesture {
                                    withAnimation {
                                        isVisible.toggle()
                                        pad = 0.0
                                    }
                                }
                       // }
                    }
                    
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(color2)
                        .frame(height: 150)
                        .padding(.trailing, pad)
                        .overlay(alignment: .leading) {
                            if isVisible{
                                TextField("Add...", text: $currentText, axis: .vertical)
                                    .multilineTextAlignment(.leading)
                                    .textFieldStyle(.roundedBorder)
                                    .foregroundColor(Color("TextDark"))
                                    .frame(height: 150)
                                    .padding()
                            }
                        }
                }
            }
        }
        .padding(.horizontal)
    }
}
