//
//  Score_CalculatorApp.swift
//  Score Calculator
//
//  Created by Abdulloh on 08/07/23.
//

import SwiftUI

@main
struct Score_CalculatorApp: App {
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .font : UIFont(name: "Arvo-Bold", size: 40) ?? .boldSystemFont(ofSize: 40),
            .foregroundColor : UIColor(Color("Text color"))
        ]

        UINavigationBar.appearance().barTintColor = UIColor(Color("Main color"))
        UINavigationBar.appearance().titleTextAttributes = [
            .font : UIFont(name: "Arvo-Bold", size: 17) ?? .boldSystemFont(ofSize: 17),
            .foregroundColor : UIColor(Color("Text color"))
        ]
    }
    
    var body: some Scene {
        WindowGroup {
            HomeScreen()
                .preferredColorScheme(.light)
        }
    }
}
