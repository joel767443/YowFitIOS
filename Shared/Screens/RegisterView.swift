//
//  RegisterView.swift
//  YoKach
//
//  Created by macos on 2023/12/10.
//

import SwiftUI

struct RegisterView: View {
    @State var name = ""
    @State var password = ""
    @State var email = ""
    @State var radius:CGFloat = 5;
    @EnvironmentObject private var userViewModel: UserViewModel
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            VStack {
                if (userViewModel.isLoading) {
                    ProgressView()
                }
                ScrollView {
                    Spacer()
                    Text("REGISTRATION")
                        .font(.largeTitle)
                        .foregroundColor(.white.opacity(0.8))
                        .fontWeight(.semibold)
                    Text("Note that all fields are required.")
                        .foregroundColor(.white.opacity(0.8))
                    
                    TextField("name", text: $name)
                        .modifier(InnerShadowViewModifier())
                    
                    TextField("password", text: $password)
                        .modifier(InnerShadowViewModifier())
                    
                    TextField("email", text: $email)
                        .modifier(InnerShadowViewModifier())
                        
                    Button {
                        Task {
                            try? await userViewModel.createUser(name: self.name, password: self.password, email: self.email)
                        }
                    } label: {
                        Spacer()
                        Text("Register")
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
            .navigationBarHidden(true)
        }
        .alert(userViewModel.hasError ? "Error" : "Success", isPresented: $userViewModel.showAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(userViewModel.allerMessage)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
