//
//  LoginView.swift
//  YoKach
//
//  Created by macos on 2023/12/10.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject private var userViewModel: UserViewModel
    @State var email = ""
    @State var password = ""
    var body: some View {
        NavigationView {
            ZStack {
                Color("ColorBlue")
                    .ignoresSafeArea(.all, edges: .all)
                VStack {
                    Spacer()
                    Text("WELCOME")
                        .font(.largeTitle)
                        .foregroundColor(.white.opacity(0.8))
                        .fontWeight(.semibold)
                    Text("Log in to an existing account.")
                        .foregroundColor(.white.opacity(0.8))
                    
                    TextField("email", text: $email)
                        .modifier(InnerShadowViewModifier())
                    
                    TextField("password", text: $password)
                        .modifier(InnerShadowViewModifier())
                    
                    NavigationLink(destination: RegisterView()) {
                        Text("No account? Register")
                            .foregroundColor(.white.opacity(0.8))
                            .navigationBarTitle("")
                            .navigationBarHidden(true)
                    }
                    
                    Button {
                        Task {
                            try? await userViewModel.login(email: self.email, password: self.password)
                        }
                    } label: {
                        Spacer()
                        Text("Login")
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .foregroundColor(.white.opacity(0.8))
                    .padding(20)
                    .modifier(ShadowViewModifier())
                    .cornerRadius(5)
                    
                    Spacer()
                }
                .padding()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .alert(userViewModel.hasError ? "Error" : "Success", isPresented: $userViewModel.showAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(userViewModel.allerMessage)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
