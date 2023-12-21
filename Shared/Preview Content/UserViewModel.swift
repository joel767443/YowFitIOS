//
//  UserViewModel.swift
//  YoFit
//
//  Created by macos on 2023/12/12.
//

import Foundation

@MainActor
class UserViewModel: ObservableObject {
    
    private let service: UserService
    @Published var showAlert = false
    @Published var allerMessage: String = ""
    @Published var hasError = false
    @Published var isLoading = false
    @Published var isLoggedIn = false
    
    
    init(service:UserService) {
        self.service = service
    }
    
    func createUser(name: String, password: String, email: String) async throws {
        
        isLoading = true
        
        let response = try await service.createUser(name: name, password:password, email:email)
        
        switch response.status {
        case true:
            isLoading = false
            hasError = false
            isLoggedIn = true
            allerMessage = response.message
            showAlert.toggle()
            break

        case false:
            isLoading = false
            hasError = true
            allerMessage = response.message
            showAlert.toggle()
            break
        }
    }
    
    func login(email: String, password: String) async throws {
        
        isLoading = true
        
        let response = try await service.login(password: password, email: email)
        
        switch response.status {
        case true:
            isLoading = false
            isLoggedIn = true
            break
            
        case false:
            isLoading = false
            hasError = true
            allerMessage = response.message
            showAlert.toggle()
            break
        }
    }
    
    func logOut() async throws {
        isLoading = true
        let response = try await service.logout()
        
//        switch response.status {
//        case true:
//            isLoading = false
//            isLoggedIn = false
//            break
//            
//        case false:
//            isLoading = false
//            hasError = true
//            allerMessage = "Logout failed."
//            showAlert.toggle()
//            break
//        }
    }
}
