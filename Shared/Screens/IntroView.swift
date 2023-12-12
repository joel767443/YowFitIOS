//
//  HomeView.swift
//  YoKach
//
//  Created by macos on 2023/12/08.
//

import SwiftUI

struct IntroView: View {
    
    @State private var isAnimating: Bool = false
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // MARK: - Headder
                Spacer()
                ZStack {
                    CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
                    Image("food")
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .offset(y: isAnimating ? 35 : -35)
                        .animation(
                            Animation
                                .easeInOut(duration: 3)
                                .repeatForever()
                            , value: isAnimating
                        )
                }
                // MARK: - Center
                Text("I am making this app for people who have been trying to lose weight and were demotivated.")
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding()
                // MARK: - Footer
                Spacer()
                
                NavigationLink(destination: DonationView()) {
                    Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                        .imageScale(.large)
                    Text("Continue")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .controlSize(.large)
            }
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                    isAnimating = true
                })
            })
        }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
