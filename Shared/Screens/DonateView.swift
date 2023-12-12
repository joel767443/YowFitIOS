//
//  DonateView.swift
//  YoFit
//
//  Created by macos on 2023/12/12.
//

import SwiftUI

struct DonateView: View {
    @Binding var isPresented: Bool
    @Binding var buttonOffSet: CGFloat
    
    @State var amount: String = ""
    var body: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            VStack {
                Text("Donate Here")
                    .font(.title)
                    .fontWeight(.light)
                .foregroundColor(.white.opacity(0.9))
                
                TextField("Placeholder", text: $amount)
                    .padding()
                    .cornerRadius(5)
                    .modifier(InnerShadowViewModifier())
                    .foregroundColor(.white.opacity(0.8))
                
                Button("Back to Main") {
                    isPresented = false
                    buttonOffSet = 0
                }
                .foregroundColor(.white.opacity(0.9	))
                
            }
            .padding()

        }.onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}

struct DonateView_Previews: PreviewProvider {
    static var previews: some View {
        DonateView(isPresented: .constant(true), buttonOffSet: .constant(0))
    }
}
