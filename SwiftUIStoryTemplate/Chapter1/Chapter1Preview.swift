//
//  Chapter1Preview.swift
//  SwiftUIStoryTemplate
//
//  Created by Nathan on 11/15/23.
//

import SwiftUI

struct Chapter1Preview: View {
    @State var wave: Bool = false
    @State var showChapter1: Bool = false
    @Binding var tabSelection: Int
    var body: some View {
        GeometryReader { geo in
                ZStack {
                    Image("house3")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                        .aspectRatio(contentMode: .fill)
//                        .brightness(-0.06)
                        .frame(width: geo.size.width, height: geo.size.height)
                    VStack {
                        Text("Chapter 1")
                            .font(.largeTitle)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color.white)
                            .onTapGesture {
                                showChapter1.toggle()
                            }
                        Text("Tap to begin...")
                            .font(.subheadline)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color.white)
                            .opacity(wave ? 0.6 : 0.9)
                            .animation(Animation.easeInOut(duration: 0.8).repeatForever(autoreverses: true), value: wave)
                            .onAppear {
                                self.wave.toggle()
                            }
                            .onTapGesture {
                                showChapter1.toggle()
                            }
                    }
                    
                    if showChapter1 {
//                        Chapter4View(showChapter4: $showChapter4)
                        Chapter1View(showChapter1: $showChapter1, tabSelection: $tabSelection)
                }
            }
        }
    }
}

//#Preview {
//    Chapter1Preview()
//}
