//
//  ButtonView.swift
//  YoKach
//
//  Created by macos on 2023/12/10.
//

import SwiftUI

struct ButtonView: View {
    
    @State var text:String
    
    var body: some View {
        Button(action:{
            //DashBoardView()
        }, label: {
            Spacer()
            Text(verbatim: text)
                .fontWeight(.bold)
            Spacer()
        })
            .foregroundColor(.white.opacity(0.8))
            .padding(20)
            .modifier(ShadowViewModifier())
            .cornerRadius(5)
    }
}

struct ShadowViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .white, radius: 8, x: 8, y: 8)
            .shadow(color: .white, radius: 8, x: -8, y: -8)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(text: "text")
    }
}
