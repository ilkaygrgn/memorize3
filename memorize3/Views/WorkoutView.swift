//
//  WorkoutView.swift
//  memorize3
//
//  Created by ilkay girgin on 24.12.2022.
//

import SwiftUI

struct WorkoutView: View {
    
    @EnvironmentObject var data: CoreDataViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State var isDeleted = false
    
    var currentWord: Word
    
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
                    Text("Memorize")
                        .font(Font.custom("Montserrat-SemiBold", size: 20))
                        .padding(.leading)
                    Text("3")
                        .font(Font.custom("Kristi-Regular", size: 80))
                        .padding(.top,15)
                        .padding(.leading, -10)
                        .frame(height: 50)
                    Spacer()
                    
                    Text("Today:  1 / 8 / 12")
                        .font(Font.custom("Montserrat-SemiBold", size: 18))
                        .foregroundColor(Color("TextDark"))
                        .padding(10)
                        .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 10))
                }
                .padding(.horizontal)
                .foregroundColor(Color("White"))
                
                ZStack{
                    
                    HStack {
                        VStack {
                            Image(systemName: "eye")
                            
                            Text("\(repeats)")
                        }
                        .foregroundColor(Color("TextDark"))
                        
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
                            
                    }
                    .foregroundColor(Color("TextDark"))
                    .padding(.horizontal)
                }
                .background(RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color("White")))
                .padding(.horizontal)
                .padding(.bottom)
                
                ScrollView {
                    WordPodWorkout(currentText: $translation, headline: "Translation", color1: Color("BlueMiddle"), color2: Color("BlueLight"))
                    WordPodWorkout(currentText: $meaning, headline: "Meaning", color1: Color("PurpleMiddle"), color2: Color("PurpleLight"))
                    WordPodWorkout(currentText: $sentence, headline: "Sentence", color1: Color("OrangeMiddle"), color2: Color("OrangeLight"))
                }
                Spacer()
            }
        }
        .navigationTitle("")
        //.navigationBarHidden(true)
        .onDisappear{
            if !isDeleted {
                update()
                data.saveData()
            }
            
        }
        .onAppear{
            print("wordDetail onAppear!!")
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
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct WorkoutView_Preview: PreviewProvider {
    static let controller = PersistenceController.exampleWord
    static var previews: some View {
        WorkoutView(currentWord: controller)
    }
}

struct WordPodWorkout: View {
    
    @State var isVisible = false
    @State var pad = 70.0
    @State var isTextDisabled = true
    
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
                        if !isVisible {
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
                        }
                    }
                    
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(color2)
                        .frame(height: 150)
                        .padding(.trailing, pad)
                        .overlay(alignment: .leading) {
                            if isVisible{
                                VStack(spacing: 0){
                                    HStack{
                                        Spacer()
                                        Image(systemName: "square.and.pencil")
                                            .foregroundColor(Color("TextDark"))
                                            .onTapGesture {
                                                isTextDisabled.toggle()
                                            }
                                            .padding()
                                            //.background(.purple)
                                    }
                                    //.background(.red)
                                    
                                    TextField("Add...", text: $currentText, axis: .vertical)
                                        .lineLimit(2...4)
                                        //.textFieldStyle(.roundedBorder)
                                        .foregroundColor(Color("TextDark"))
                                        //.frame(maxHeight: 120)
                                        .padding(5)
                                        .background(RoundedRectangle(cornerRadius: 10).fill(isTextDisabled ? Color.clear : Color("White")))
                                        .padding(.horizontal)
                                        .padding(.bottom)
                                        .disabled(isTextDisabled)
                                        
                                        //.background(.blue)
                                    Spacer()
                                }
                                //.background(.yellow)
                                
                            }
                        }
                }
            }
        }
        .padding(.horizontal)
    }
}

