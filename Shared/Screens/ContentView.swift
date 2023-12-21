//
//  ContentView.swift
//  Shared
//
//  Created by macos on 2023/12/08.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var userViewModel: UserViewModel
    @AppStorage("loggedIn") var isLoggedIn: Bool = true
    
    var body: some View {
        if isLoggedIn {
            ZStack {
                Color("ColorBlue")
                    .ignoresSafeArea(.all, edges: .all)
                VStack {
                    Text("Logged in")
                    Button {
                        Task {
                            isLoggedIn = false
                            try? await userViewModel.logOut()
                        }
                    } label: {
                        Spacer()
                        Text("Logout")
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .foregroundColor(.white.opacity(0.8))
                    .padding(20)
                    .modifier(ShadowViewModifier())
                    .cornerRadius(5)
                }
            }
        } else {
            IntroView()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
