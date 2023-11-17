//
//  movingPart.swift
//  MyStoryChapter
//
//  Created by johndanial on 24/08/1402 AP.
//

import SwiftUI

struct movingPart: View {
    @Binding var showChapter2: Bool
    @Binding var tabSelection: Int
    let impactFeedback = UIImpactFeedbackGenerator(style: .heavy)
    
    @State private var isRotating = 0.0
    
    var body: some View {
        
        ZStack {
            NavigationView {
                VStack {
                 
                    HStack {
                        Spacer()
                        
                    
                    NavigationLink {
                        ContentView() }
                    label: {
                        Label("", systemImage: "door.left.hand.open")
                            .foregroundColor(.red)
                            .font(.system(size: 40))
                            .padding(.trailing, 25)
                            
                    }
                }
                  
                    Spacer()
                    Text("Scared Yet?")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                        .bold()
                        .padding()
                        
                   
                    Spacer()
                    HStack {
                        NavigationLink {
                            StoryColors(showChapter2: $showChapter2, tabSelection: $tabSelection) }
                        label: {
                            Label("RUN", systemImage: "figure.run.circle")
                                .foregroundColor(.white)
                                .font(.system(size: 40))
                                .padding(.trailing, 25)
                           
                                
                        }
                    }
                    .padding(.bottom, 100)
                }
                .background {
                    Circle()
                        .fill(
                            AngularGradient(gradient: Gradient(colors: [.red, .black]),center: .center)
                        )
                        .frame(width: 1000, height: 1000)
                        .rotationEffect(.degrees(isRotating))
                        .onAppear() {
                            withAnimation (.linear(duration: 0.01)
                                .speed(0.1).repeatForever(autoreverses: false)) {
                                    isRotating = 360
                                    impactFeedback.prepare()
                                    impactFeedback.impactOccurred()
                                }
                        }
                }
            }
            .navigationBarBackButtonHidden(true)
            
        }
        .navigationBarBackButtonHidden(true)
    }}

//#Preview {
//    movingPart()
//}
