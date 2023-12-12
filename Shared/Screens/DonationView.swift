//
//  DonationView.swift
//  YoKach
//
//  Created by macos on 2023/12/08.
//

import SwiftUI

struct DonationView: View {
    @State var showDonation = false
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffSet: CGFloat =  0
    @State private var isAnimating: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("ColorBlue")
                    .ignoresSafeArea(.all, edges: .all)
                
                VStack(spacing: 20) {
                    // MARK : - Header
                    Spacer()
                    
                    VStack(spacing:0) {
                        Text("Share.")
                            .font(.system(size: 60))
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                        Text("""
                        Support the development
                        and improvement of this app
                        """)
                            .font(.title3)
                            .fontWeight(.light)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 10)
                    }
                    .opacity(isAnimating ? 1 : 0)
                    .offset(y: isAnimating ? -30 : 40)
                    .animation(.easeOut(duration: 1), value: isAnimating)
                    // MARK : - Center
                    ZStack {
                        CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
                        Image("running")
                            .resizable()
                            .scaledToFit()
                            .padding()
                            .opacity(isAnimating ? 1 : 0)
                            .animation(.easeOut(duration: 1.0), value: isAnimating)
                    }
                    Spacer()
                    // MARK : - Footer
                    NavigationLink(destination: LoginView()) {
                        Text("Login")
                            .foregroundColor(.white.opacity(0.8))
                            .navigationBarTitle("")
                            .navigationBarHidden(true)
                    }
                    ZStack {
                        Capsule()
                            .fill(Color.white.opacity(0.2))
                        Capsule()
                            .fill(Color.white.opacity(0.2))
                            .padding(8)
                        HStack {
                            Capsule()
                                .fill(Color("ColorRed"))
                                .frame(width: buttonOffSet + 80)
                            Spacer()
                        }
                        Text("Donate")
                            .font(.system(.title3, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .offset(x:20)
                        HStack {
                            ZStack {
                                Circle()
                                    .fill(Color("ColorRed"))
                                Circle()
                                    .fill(.black.opacity(0.15))
                                    .padding(8)
                                Image(systemName: "chevron.right.2")
                                    .font(.system(size: 24, weight: .bold))
                            }
                            .foregroundColor(.white)
                        .frame(width: 80, height: 80, alignment: .center)
                        .offset(x: buttonOffSet)
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    if gesture.translation.width > 0 && buttonOffSet <= buttonWidth - 80 {
                                        buttonOffSet = gesture.translation.width
                                    }
                                }
                                .onEnded { _ in
                                    withAnimation(Animation.easeOut(duration: 1.0)) {
                                        if buttonOffSet > buttonWidth / 2 {
                                            buttonOffSet = buttonWidth - 80
                                            showDonation = true
                                        } else {
                                            buttonOffSet = 0
                                        }
                                    }
                                }
                        )
                        .sheet(isPresented: $showDonation) {
                            DonateView(isPresented: $showDonation, buttonOffSet: $buttonOffSet)
                        }
                        Spacer()
                        }
                    }
                    .frame(width: buttonWidth, height:80, alignment: .center)
                    .padding()
                    .opacity(isAnimating ? 1 : 0)
                    .offset(y: isAnimating ? 0 : 40)
                    .animation(.easeOut(duration: 1), value: isAnimating)
                }
            }
            .onAppear(perform: {
                isAnimating = true
            })
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct DonationView_Previews: PreviewProvider {
    static var previews: some View {
        DonationView()
    }
}
