//
//  YoKachApp.swift
//  Shared
//
//  Created by macos on 2023/12/08.
//

import SwiftUI

@main
struct YoKachApp: App {
    
    @StateObject private var userViewModel = UserViewModel(service: UserService())
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userViewModel)
        }
    }
}
