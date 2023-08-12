//
//  ScoreSectionView.swift
//  Score Calculator
//
//  Created by Abdulloh on 04/08/23.
//

import SwiftUI

struct ScoreSectionView: View {
    let title: String
    let correct: Int
    
    let scores: [Dictionary<Int, Int>.Element]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .padding(.bottom, 5)
            
            Divider()
                .frame(height: 1)
                .overlay(.white)
            
            HStack {
                VStack {
                    ForEach(scores, id: \.key) { key, _ in
                        Text("\(key)")
                    }
                }
                
                Spacer()
                
                VStack {
                    ForEach(scores, id: \.key) { _, value in
                        Text("\(value)%")
                    }
                }
            }
        }
    }
}

struct ScoreSectionView_Previews: PreviewProvider {
    static var test = [1: 0].sorted(by: {$0.value > $1.value})
    
    static var previews: some View {
        ScoreSectionView(title: "Math", correct: 40, scores: test)
    }
}
