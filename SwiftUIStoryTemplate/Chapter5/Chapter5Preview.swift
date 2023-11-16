//
//  Chapter5Preview.swift
//  SwiftUIStoryTemplate
//
//  Created by Nathan on 11/15/23.
//

import SwiftUI

struct Chapter5Preview: View {
    @State var showChapter5: Bool = false
    @State var wave: Bool = false
    @Binding var tabSelection: Int
    var body: some View {
        GeometryReader { geo in
                ZStack {
                    Image("hall4")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geo.size.width, height: geo.size.height)
                    VStack {
                        Text("Chapter 5")
                            .font(.largeTitle)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color.white)
                            .onTapGesture {
                                showChapter5.toggle()
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
                                showChapter5.toggle()
                            }
                    }
                    
                    if showChapter5 {
//                        Chapter4View(showChapter4: $showChapter4)
                        Chapter5View(showChapter5: $showChapter5, tabSelection: $tabSelection)
                }
            }
        }
    }
}

//#Preview {
//    Chapter5Preview()
//}
