//
//  Chapter3Preview.swift
//  SwiftUIStoryTemplate
//
//  Created by Nathan on 11/15/23.
//

import SwiftUI

struct Chapter3Preview: View {
    @State var showChapter3: Bool = false
    @State var wave: Bool = false
    @Binding var tabSelection: Int

    var body: some View {
        GeometryReader { geo in
                ZStack {
                    Image("stairs")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geo.size.width, height: geo.size.height)
                    VStack {
                        Text("Chapter 3")
                            .font(.largeTitle)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color.white)
                            .onTapGesture {
                                showChapter3.toggle()
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
                                showChapter3.toggle()
                            }
                            .fullScreenCover(isPresented: $showChapter3) {
                                Chapter3View(showChapter3: $showChapter3, tabSelection: $tabSelection)
                            }
                    }
                    
//                    if showChapter3 {
////                        Chapter4View(showChapter4: $showChapter4)
//                        Chapter3View(showChapter3: $showChapter3, tabSelection: $tabSelection)
//                }
            }
        }
    }
}

//#Preview {
//    Chapter3Preview()
//}
