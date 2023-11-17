//
//  Chapter2Preview.swift
//  SwiftUIStoryTemplate
//
//  Created by Nathan on 11/15/23.
//

import SwiftUI

struct Chapter2Preview: View {
    
    @State var showChapter2: Bool = false
    @State var wave: Bool = false
    @Binding var tabSelection: Int

    var body: some View {
        GeometryReader { geo in
                ZStack {
                    Image("hallway2")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geo.size.width, height: geo.size.height)
                    VStack {
                        Text("Chapter 2")
                            .font(.largeTitle)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color.white)
                            .onTapGesture {
                                showChapter2.toggle()
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
                                showChapter2.toggle()
                            }
                    }
                    
                    .fullScreenCover(isPresented: $showChapter2) {
                        Chapter2View(showChapter2: $showChapter2, tabSelection: $tabSelection)
                    }
                    
//                    if showChapter2 {
////                        Chapter4View(showChapter4: $showChapter4)
//                        Chapter2View(showChapter2: $showChapter2)
//                }
            }
        }
    }
}

//#Preview {
//    Chapter2Preview()
//}
