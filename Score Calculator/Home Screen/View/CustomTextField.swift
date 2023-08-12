//
//  CustomTextField.swift
//  Score Calculator
//
//  Created by Abdulloh on 06/08/23.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    @Binding var warning: Int
    let title: String
    let max: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.custom("Arvo-Bold", size: 20))
                .foregroundColor(.white)
            
            TextField("Correct answers number", text: $text)
                .padding()
                .keyboardType(.numberPad)
                .foregroundColor(Color("Main color"))
                .font(.custom("Arvo-Bold", size: 16))
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .frame(height: 50)
                        .foregroundColor(.white)
                )
                
            if warning == 1 {
                Text("Correct answers for \(title) must be between 0 and \(max)")
                    .font(.custom("Arvo-Bold", size: 15))
                    .foregroundColor(Color("Red"))
            }
            if warning == 2 {
                Text("Please fill the gap")
                    .font(.custom("Arvo-Bold", size: 15))
                    .foregroundColor(Color("Red"))
            }
        }
    }
}


struct CustomTextField_Previews: PreviewProvider {
    @State static var text = ""
    @State static var warning = 1
    
    static var previews: some View {
        CustomTextField(text: $text, warning: $warning, title: "Math", max: 58)
            .padding()
            .background(Color("Main color"))
            .previewLayout(.sizeThatFits)
            
    }
}
