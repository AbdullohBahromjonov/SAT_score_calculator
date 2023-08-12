//
//  Result.swift
//  Score Calculator
//
//  Created by Abdulloh on 03/08/23.
//

import SwiftUI

func frecuencyOfNumberIn(_ array: [Int]) -> [Dictionary<Int, Int>.Element]{
    let numbers = Array(Set(array))
    let devider = Double(array.count)/100.0
    var newDictionary = [Int: Int]()
    
    for i in 0..<numbers.count {
        var frec = [Int]()
        
        for n in 0..<array.count {
            if numbers[i] == array[n] {
                frec.append(array[n])
            }
        }
        
        let dicti = [frec[0]: frec.count]
             
        for i in dicti {
            let perc = Int(Double(i.value)/devider)
            newDictionary[i.key] = perc
        }
    }
    return newDictionary.sorted(by: {$0.value > $1.value})
}

func showResults(mathCorrect: Int, readingCorrect: Int, writingCorrect: Int) -> (math: [Dictionary<Int, Int>.Element], reading: [Dictionary<Int, Int>.Element], writing: [Dictionary<Int, Int>.Element], finalScore: Int) {
    
    let mathResults = frecuencyOfNumberIn(math[mathCorrect] ?? [0])
    let readingResults = frecuencyOfNumberIn(reading[readingCorrect] ?? [0])
    let writingResults = frecuencyOfNumberIn(writing[writingCorrect] ?? [0])
    let finalScore = mathResults.first!.key + readingResults.first!.key + writingResults.first!.key
    
    return (mathResults, readingResults, writingResults, finalScore)
}

func scoreColor(score: Int) -> Color {
    if score <= 1000 {
        return Color("Red")
    } else if score <= 1150 {
        return Color("Orange")
    } else if score <= 1250 {
        return Color("Green")
    } else if score <= 1390 {
        return Color("Blue")
    } else if score <= 1600 {
        return Color("Purple")
    } else {
        return Color("Main color")
    }
}
