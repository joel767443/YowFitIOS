//
//  ContentView.swift
//  Shared
//
//  Created by macos on 2023/12/08.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("loggedIn") var isLoggedIn: Bool = true
    
    var body: some View {
        IntroView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
