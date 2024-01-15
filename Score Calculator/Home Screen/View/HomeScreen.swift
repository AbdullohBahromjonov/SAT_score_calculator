//
//  ContentView.swift
//  Score Calculator
//
//  Created by Abdulloh and Abdurahmon 08/07/23.
//

import SwiftUI

struct HomeScreen: View {
    @State var reading = ""
    @State var writing = ""
    @State var math = ""
    
    @State var readingWarning = 0
    @State var writingWarning = 0
    @State var mathWarning = 0
    
    @State var results = showResults(mathCorrect: 0, readingCorrect: 0, writingCorrect: 0)
    
    @State var finalScore = 0
    
    @State var check = false
    @FocusState var isInputActive: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Main color")
                    .ignoresSafeArea()
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 40) {
                        CustomTextField(text: $reading, warning: $readingWarning, title: "Reading", max: 52)
                            .focused($isInputActive)
                        CustomTextField(text: $writing, warning: $writingWarning, title: "Writing", max: 44)
                            .focused($isInputActive)
                        CustomTextField(text: $math, warning: $mathWarning, title: "Math", max: 58)
                            .focused($isInputActive)
                            .toolbar {
                                ToolbarItemGroup(placement: .keyboard) {
                                    Spacer()
                                    Button("Done") {
                                        warning()
                                        
                                        isInputActive = false
                                    }
                                }
                            }
                        
                        
                        NavigationLink(
                            destination:
                                ScoreScreen(
                                    reading: $results.reading,
                                    writing: $results.writing,
                                    math: $results.math,
                                    readingCorrect: $reading,
                                    writingCorrect: $writing,
                                    mathCorrect: $math,
                                    finalScore: $results.finalScore
                                ),
                            isActive: $check
                        ) {
                            Button(
                                action: {
                                    results = showResults(mathCorrect: Int(math) ?? 0, readingCorrect: Int(reading) ?? 0, writingCorrect: Int(writing) ?? 0)
                                    
                                    warning()
                                    
                                    if readingWarning == 0 && writingWarning == 0 && mathWarning == 0 {
                                        check = true
                                    }
                                },
                                label: {
                                    Text("CHECK")
                                        .font(.custom("Arvo-Bold", size: 20))
                                        .foregroundColor(Color("Main color"))
                                        .background(
                                            RoundedRectangle(cornerRadius: 20)
                                                .foregroundColor(.white)
                                                .frame(width: 180, height: 60)
                                        )
                                }
                            )
                            
                        }
                        .padding(.top, 60)
                    }
                    .padding(30)
                }
                .frame(alignment: .center)
            }
            .navigationTitle(Text("Welcome 👋"))
        }
    }
    
    func warning() {
        if Int(reading) ?? 0 < 0 || Int(reading) ?? 0 > 52 {
            readingWarning = 1
        } else if reading.isEmpty {
            readingWarning = 2
        } else {
            readingWarning = 0
        }
        
        if Int(writing) ?? 0 < 0 || Int(writing) ?? 0 > 44 {
            writingWarning = 1
        } else if writing.isEmpty {
            writingWarning = 2
        } else {
            writingWarning = 0
        }
        
        if Int(math) ?? 0 < 0 || Int(math) ?? 0 > 58 {
            mathWarning = 1
        } else if math.isEmpty {
            mathWarning = 2
        } else {
            mathWarning = 0
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
