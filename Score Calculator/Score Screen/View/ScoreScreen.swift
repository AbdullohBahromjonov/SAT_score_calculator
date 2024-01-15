//
//  ScoreScreen.swift
//  Score Calculator
//
//  Created by Abdulloh on 09/07/23.
//

import SwiftUI

struct ScoreScreen: View {
    @Environment(\.dismiss) var dismiss
    @Binding var reading: [Dictionary<Int, Int>.Element]
    @Binding var writing: [Dictionary<Int, Int>.Element]
    @Binding var math: [Dictionary<Int, Int>.Element]
    
    @Binding var readingCorrect: String
    @Binding var writingCorrect: String
    @Binding var mathCorrect: String
    
    @Binding var finalScore: Int
    
    var body: some View {
        ZStack {
            Color("Main color")
                .ignoresSafeArea()
            ScrollView(showsIndicators: false) {
                VStack(spacing: 30) {
                    VStack(alignment: .leading) {
                        Text("Final Score")
                            .font(.custom("Arvo-Bold", size: 35))
                        Text("\(finalScore)")
                            .scaleEffect(0.9)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(scoreColor(score: finalScore))
                            )
                            .foregroundColor(.white)
                            .font(.custom("Arvo-Bold", size: 75))
                            .padding(.bottom, -2)
                            
                        Divider()
                            .frame(height: 2)
                            .overlay(Color("Main color"))
                        
                        Text("Confidence level  \((math.first!.value + reading.first!.value + writing.first!.value)/3)%")
                            .font(.custom("Arvo-Bold", size: 20))
                            .padding(.bottom, 5)
                        
                        Text("English: \(finalScore-math.first!.key)")
                            .font(.custom("Arvo-Bold", size: 20))
                        Text("Math: \(math.first!.key)")
                            .font(.custom("Arvo-Bold", size: 20))
                            .padding(.bottom, 5)
                        
                        Text("Your score range at a")
                            .font(.custom("Arvo-Bold", size: 20))
                        Text("\(reading.sorted(by: {$0.key > $1.key}).last!.key + writing.sorted(by: {$0.key > $1.key}).last!.key + math.sorted(by: {$0.key > $1.key}).last!.key) - \(reading.sorted(by: {$0.key > $1.key}).first!.key + writing.sorted(by: {$0.key > $1.key}).first!.key + math.sorted(by: {$0.key > $1.key}).first!.key)")
                            .font(.custom("Arvo-Bold", size: 25))
                    }
                    .foregroundColor(Color("Main color"))
                    .padding(30)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.white)
                    )
                    
                    ScoreSectionView(title: "Reading", correct: readingCorrect, scores: reading)
                    
                    ScoreSectionView(title: "Writing", correct: writingCorrect, scores: writing)
                    
                    ScoreSectionView(title: "Math", correct: mathCorrect, scores: math)
                    
                }
                .font(.custom("Arvo-Bold", size: 20))
                .foregroundColor(.white)
                .padding(.horizontal, 30)
                .padding(.bottom, 30)
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    HStack(spacing: 5) {
                        Image(systemName: "chevron.backward")
                            .font(.system(size: 15, weight: .semibold))
                        Text("Back")
                            .font(.custom("Arvo-Bold", size: 15))
                            .offset(y: 1)
                    }
                    .foregroundColor(.white)
                }
            }
        }
    }
}

struct ScoreScreen_Previews: PreviewProvider {
    @State static var reading: [Dictionary<Int, Int>.Element] = [400: 0].sorted(by: {$0.value > $1.value})
    @State static var score = 1350
    @State static var correct = "25"
    
    static var previews: some View {
        ScoreScreen(
            reading: $reading,
            writing: $reading,
            math: $reading,
            readingCorrect: $correct,
            writingCorrect: $correct,
            mathCorrect: $correct,
            finalScore: $score
        )
    }
}
