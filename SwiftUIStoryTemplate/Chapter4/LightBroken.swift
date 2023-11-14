//
//  LightBroken.swift
//  Chapter4
//
//  Created by Nathan on 11/13/23.
//

import SwiftUI

var ghosts = ["ghost1", "ghost2", "ghost3", "ghost4", "ghost5", "ghost6", "ghost7", "ghost8"]

var shuffledGhosts = ghosts.shuffled()

let ghost1 = shuffledGhosts[0]
let ghost2 = shuffledGhosts[1]
let ghost3 = shuffledGhosts[2]
let ghost4 = shuffledGhosts[3]

var sentences = [
    "Standing outside the bedroom door, Nathan reaches out and turns the doorknob.",
    "The door creaks as he opens the door.",
    "He tries flipping the light switch but the bulb is burnt out.",
    "The room is dark, so he turns on his flashlight and steps inside.",
    "To his surprise, the door slams behind him.",
    "Frightened in the dark, he shines his flashlight around the room.",
    "The only thing he sees in the room is a wooden trunk.",
    "He opens the trunk..."
]



struct LightBroken: View {
    
    @State var chestOpenOpacity: Double = 0.0
    @State var chestClosedOpacity: Double = 0.0
    @State var numberOfClicks = 0
    @State var sentence = "Chapter 4"
    @State var lightOn = false
    @State var doorOpen = false

    @State var ghost1Opacity = 0.0
    @State var ghost1Scale = 0.1
    @State var ghost1Offset: CGFloat = 150
    
    @State var ghost2Opacity = 0.0
    @State var ghost2Scale = 0.1
    @State var ghost2Offset: CGFloat = 150

    @State var ghost3Opacity = 0.0
    @State var ghost3Scale = 0.1
    @State var ghost3Offset: CGFloat = 150
    
//    @State var ghost4Opacity = 0.0
//    @State var ghost4Scale = 0.0
    


    var body: some View {
        GeometryReader { geo in
            ZStack {
                // Background Images
                Image("room1dark")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                if lightOn {
                    Image("room1")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                }
                VStack {
                    Spacer()
                    ZStack {
                        Image("chestOpen")
                            .resizable()
                            .frame(width: geo.size.width/1.9, height: geo.size.width/1.6)
                            .opacity(chestOpenOpacity)
                            .offset(x: 0, y: 150)
                        Image("chestClosed")
                            .resizable()
                            .frame(width: geo.size.width/2, height: geo.size.width/1.3)
                            .opacity(chestClosedOpacity)
                            .offset(x: 0, y: 150)
                        Image(ghost1)
                            .resizable()
                            .scaleEffect(CGSize(width: ghost1Scale, height: ghost1Scale))
                            .opacity(ghost1Opacity)
                            .offset(x: 0, y: ghost1Offset)
                        Image(ghost2)
                            .resizable()
                            .scaleEffect(CGSize(width: ghost2Scale, height: ghost2Scale))
                            .opacity(ghost2Opacity)
                            .offset(x: 0, y: ghost2Offset)
                        Image(ghost3)
                            .resizable()
                            .scaleEffect(CGSize(width: ghost3Scale, height: ghost3Scale))
                            .opacity(ghost3Opacity)
                            .offset(x: 0, y: ghost3Offset)
                    }
                    ScrollView {
                        Text(sentence)
                            .frame(width: geo.size.width - 25)
                            .foregroundStyle(.white)
                            .font(.title)
                    }.frame(height: 140)
                        
                    HStack {
                        Button("Back") {
                            print("Back")
                        }
                        .buttonStyle(.bordered)
                        .font(.largeTitle)
                        .tint(.white)
                        .padding(.leading)
                        Spacer()
                        Button("Next") {
                            numberOfClicks +=  1
                            next(numberOfClicks)
                        }
                        .buttonStyle(.bordered)
                        .font(.largeTitle)
                        .tint(.white)
                        .padding(.trailing)
                    }.frame(width: geo.size.width)
                }
            }.frame(width: geo.size.width, height: geo.size.height, alignment: .center)
        }
    }
    
    func next(_ numberOfClicks: Int) {
        switch numberOfClicks {
        case 1:
            sentence = sentences[0]
        case 2:
            sentence = sentences[1]
        case 3:
            sentence = sentences[2]
        case 4:
            sentence = sentences[3]
            withAnimation(.linear(duration: 2)) {
                lightOn = true
            }
        case 5:
            sentence = sentences[4]
            
        case 6:
            sentence = sentences[5]
        case 7:
            sentence = sentences[6]
            withAnimation(.linear(duration: 2)) {
                chestClosedOpacity = 1.0
            }
        case 8:
            sentence = sentences[7]
            chestOpenOpacity = 1.0
            withAnimation(.easeInOut(duration: 0.6)) {
                chestClosedOpacity = 0.0
            }
        case 9:
            sentence = "Boo! shrieks the first ghost"
            withAnimation(.easeOut(duration: 2)) {
                ghost1Opacity = 1.0
                ghost1Scale = 0.6
                ghost1Offset = -180
            }
            withAnimation(.easeIn(duration:2).delay(2)) {
                ghost1Opacity = 0.0
                ghost1Scale = 1.4
                ghost1Offset = 1000
            }
//            self.numberOfClicks = 0
        case 10:
            sentence = "Get out! shrieks the second ghost"
            withAnimation(.easeOut(duration: 2)) {
                ghost2Opacity = 1.0
                ghost2Scale = 0.6
                ghost2Offset = -180
            }
            withAnimation(.easeIn(duration:2).delay(2)) {
                ghost2Opacity = 0.0
                ghost2Scale = 1.4
                ghost2Offset = 1000
            }
        case 11:
            sentence = "This is our house! hisses the third ghost"
            withAnimation(.easeOut(duration: 2)) {
                ghost3Opacity = 1.0
                ghost3Scale = 0.6
                ghost3Offset = -180
            }
            withAnimation(.easeIn(duration:2).delay(2)) {
                ghost3Opacity = 0.0
                ghost3Scale = 1.4
                ghost3Offset = 1000
            }
        default:
            break
        }
    }
}



#Preview {
    LightBroken()
}
