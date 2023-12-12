//
//  InputView.swift
//  YoKach
//
//  Created by macos on 2023/12/10.
//

import SwiftUI

struct InputView: View {
    
    @State var label: String
    @State var textInput: String
    
    var body: some View {
        TextField("", text: $textInput)
    }
}

struct InnerShadowViewModifier: ViewModifier {
    @State var radius:CGFloat = 5;
    func body(content: Content) -> some View {
        content
            .padding()
            .cornerRadius(5)
            .foregroundColor(.white.opacity(0.8))
            .overlay(
                RoundedRectangle(cornerRadius: radius)
                    .stroke(Color(.white), lineWidth: 1)
                    .shadow(color: .white, radius: 4, x: 5, y: 5)
                    .clipShape(RoundedRectangle(cornerRadius: radius))
                    .shadow(color: .white, radius: 4, x: -5, y: -5)
                    .clipShape(RoundedRectangle(cornerRadius: radius))
            )
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView(label: "username", textInput: "username")
    }
}
//format: .number
