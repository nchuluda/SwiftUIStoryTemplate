//
//  allRooms.swift
//  MyStoryChapter
//
//  Created by johndanial on 25/08/1402 AP.
//

import SwiftUI

struct allRooms: View {
    
    let impactFeedback5 = UIImpactFeedbackGenerator(style: .heavy)
    
    @State private var isRotating = 0.0
    
    @State private var isLightOn = false
    @State private var flashingTimer: Timer?
    @State private var toggleTry = false
    @State var chapterStorey = "Chapter 2"
    @State private var isBeating = false
    
    let impactFeedback = UIImpactFeedbackGenerator(style: .heavy)
    let impactFeedback2 = UIImpactFeedbackGenerator(style: .light)
    let generator = UINotificationFeedbackGenerator()
    var body: some View {
        NavigationView {
            ZStack {
                
                VStack {
                    HStack {
                        Image(systemName: "lightbulb.fill")
                            .font(.system(size: 100))
                            .foregroundColor(isLightOn ? .white : .red)
                            .padding()
                        Spacer()
                        Spacer()
                            .padding()
                            .onAppear{startFlashing() }
                            .onDisappear{stopFlashing() }
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
                    VStack {
                        Image(systemName: "rainbow")
                            .font(.system(size: 200))
                            .symbolRenderingMode(.multicolor)
                            .symbolEffect(
                                .variableColor
                                    .reversing
                                    .iterative
                                    .hideInactiveLayers
                                
                            )
                    }
                    Spacer()
                }
                VStack {
                    Spacer()
                    
                    Spacer()
                    HStack {
                        Image(systemName:"eye")
                            .font(.largeTitle)
                            .foregroundColor(.red)
                            .symbolEffect(.variableColor
                                .iterative)
                        
                        Image(systemName:"eye")
                            .font(.largeTitle)
                            .foregroundColor(.red)
                            .symbolEffect(.variableColor
                                .hideInactiveLayers
                                .iterative)
                    }
                    Spacer()
                }
                
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
    }
    private func startFlashing() {
        // Invalidate the existing timer if any
        flashingTimer?.invalidate()
        
        // Start a new timer to toggle the light every 0.5 seconds
        flashingTimer = Timer.scheduledTimer(withTimeInterval: 0.6, repeats: true) { timer in
            withAnimation {
                isLightOn.toggle()
                
                impactFeedback.impactOccurred()
                generator.notificationOccurred(.success)
            }
        }
    }
    
    private func stopFlashing() {
        // Stop the flashing by invalidating the timer
        flashingTimer?.invalidate()
        isLightOn = false
    }
     
}

#Preview {
    allRooms()
}
