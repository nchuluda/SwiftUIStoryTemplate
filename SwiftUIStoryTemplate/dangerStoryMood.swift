//
//  dangerStoryMood.swift
//  MyStoryChapter
//
//  Created by johndanial on 24/08/1402 AP.
//

import SwiftUI

struct dangerStoryMood: View {
    @State private var isLightOn = false
    @State private var flashingTimer: Timer?
    @State private var toggleTry = false
    @State var chapterStorey = "Chapter 2"
    @State private var isBeating = false
    
    let impactFeedback = UIImpactFeedbackGenerator(style: .heavy)
    let impactFeedback2 = UIImpactFeedbackGenerator(style: .light)
    let generator = UINotificationFeedbackGenerator()
    var body: some View {
      
    
        NavigationStack {
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
            }
//                    Image(systemName: "door.left.hand.open")
                .font(.system(size: 80))
                .padding(.trailing, 25)
                .symbolEffect(.variableColor
                    .hideInactiveLayers)
                .foregroundColor(.red)
        }
            VStack {
                Spacer()
                Text ("Exit Now if you are a 🐣")
                    .font(.largeTitle)
              
                Spacer()
            Spacer()
                HStack {
                    Image(systemName:"eye")
                        .font(.largeTitle)
                        .foregroundColor(.red)
                        .symbolEffect(.variableColor
                            .iterative)
                    NavigationLink {
                        movingPart() }
                label: {
                    Label("Turn Around ", systemImage: "")
                        .font(.largeTitle)
                        .navigationBarBackButtonHidden(true)
                }
                    Image(systemName:"eye")
                        .font(.largeTitle)
                        .foregroundColor(.red)
                        .symbolEffect(.variableColor
                            .hideInactiveLayers
                            .iterative)
                }
                Spacer()
                    .navigationBarBackButtonHidden(true)
            }
            .navigationBarBackButtonHidden(true)
        }}
    
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
    dangerStoryMood()
}
