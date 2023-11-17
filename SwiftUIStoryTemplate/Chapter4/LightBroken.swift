//
//  LightBroken.swift
//  Chapter4
//
//  Created by Nathan on 11/13/23.
//

import SwiftUI

struct LightBroken: View {
//    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var story: StoryVM
    @Binding var showChapter4: Bool
    @Binding var tabSelection: Int
    
    @State var chestOpenOpacity: Double = 0.0
    @State var chestClosedOpacity: Double = 0.0
    @State var doorOpacity: Double = 1.0
    @State var doorZoom: Double = 1.0
    @State var numberOfClicks = 0
    @State var sentence = "Standing outside the bedroom door, Joey reaches out and turns the doorknob."
    @State var lightOn = false

    @State var ghost1Opacity = 0.0
    @State var ghost1Scale = 0.1
    @State var ghost1Offset: CGFloat = 150
    
    @State var ghost2Opacity = 0.0
    @State var ghost2Scale = 0.1
    @State var ghost2Offset: CGFloat = 150
    @State var ghost2Rotation: Double = 0.0

    @State var ghost3Opacity = 0.0
    @State var ghost3Scale = 0.1
    @State var ghost3Offset: CGFloat = 150
    @State var ghost3Rotation: Double = 0.0

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
                Image("door8a")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geo.size.width, height: geo.size.height)
                    .opacity(doorOpacity)
                
                VStack {
                    Spacer()
                    ZStack {
                        Image("chestOpen")
                            .resizable()
                            .frame(width: geo.size.width/1.9, height: geo.size.width/1.6)
                            .opacity(chestOpenOpacity)
                            .saturation(0.7)
                            .offset(x: 0, y: 150)
                        Image("chestClosed")
                            .resizable()
                            .frame(width: geo.size.width/2, height: geo.size.width/1.3)
                            .opacity(chestClosedOpacity)
                            .saturation(0.7)
                            .offset(x: 0, y: 150)
                        Image(story.ghost1.name != nil ? story.ghost1.name! : "ghost1")
                            .resizable()
                            .scaleEffect(CGSize(width: ghost1Scale, height: ghost1Scale))
                            .opacity(ghost1Opacity)
                            .offset(x: 0, y: ghost1Offset)
                        Image(story.ghost2.name != nil ? story.ghost2.name! : "ghost2")
                            .resizable()
                            .scaleEffect(CGSize(width: ghost2Scale, height: ghost2Scale))
                            .opacity(ghost2Opacity)
                            .offset(x: 0, y: ghost2Offset)
                            .rotationEffect(.degrees(ghost2Rotation))
                        Image(story.ghost3.name != nil ? story.ghost3.name! : "ghost3")
                            .resizable()
                            .rotationEffect(.degrees(ghost3Rotation))
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
                            numberOfClicks -= 1
                            back(numberOfClicks)
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
            sentence = "The door creaks as he opens it."
            withAnimation(.linear(duration: 1)) {
                doorOpacity = 0.0
            }
        case 2:
            sentence = "He tries flipping the light switch but the bulb is burnt out."
        case 3:
            sentence = "The room is dark, so he turns on his flashlight and steps inside."
            withAnimation(.linear(duration: 2)) {
                lightOn = true
            }
        case 4:
            sentence = "To his surprise, the door slams behind him."
            
        case 5:
            sentence = "Frightened in the dark, he shines his flashlight around the room."
        case 6:
            sentence = "The only thing he sees in the room is a wooden trunk."
            withAnimation(.linear(duration: 2)) {
                chestClosedOpacity = 1.0
            }
        case 7:
            sentence = "He opens the trunk..."
            chestOpenOpacity = 1.0
            withAnimation(.easeInOut(duration: 0.6)) {
                chestClosedOpacity = 0.0
            }
        case 8:
            sentence = story.ghostSentences[0]
            withAnimation(.easeOut(duration: 2)) {
                ghost1Opacity = 1.0
                ghost1Scale = 0.6
                ghost1Offset = -160
            }
            withAnimation(.easeOut(duration: 0.5).delay(2)) {
                ghost1Offset = -130
            }
            withAnimation(.easeIn(duration: 0.5).delay(2.5)) {
                ghost1Offset = -160
            }
            withAnimation(.easeIn(duration:2).delay(3)) {
                ghost1Opacity = 0.0
                ghost1Scale = 1.4
                ghost1Offset = 1000
            }
        case 9:
            sentence = story.ghostSentences[1]
            withAnimation(.easeIn(duration: 2)) {
                ghost2Opacity = 1.0
                ghost2Scale = 0.6
                ghost2Offset = -150
                ghost2Rotation = -10.0
            }
            withAnimation(.linear(duration: 0.5).delay(2)) {
                ghost2Offset = -120
            }
            withAnimation(.linear(duration: 0.5).delay(2.5)) {
                ghost2Offset = -150
            }
            withAnimation(.easeInOut(duration: 1).delay(2)) {
                ghost2Rotation = 10.0
            }
            withAnimation(.easeInOut(duration: 1).delay(2)) {
                ghost2Rotation = 10.0
            }
            withAnimation(.easeOut(duration:2).delay(3)) {
                ghost2Opacity = 0.0
                ghost2Scale = 1.4
                ghost2Offset = 1000
                ghost2Rotation = 0.0
            }
        case 10:
            sentence = story.ghostSentences[2]
            withAnimation(.linear(duration: 0.5)) {
                ghost3Opacity = 0.25
                ghost3Scale = 0.2
                ghost3Offset = -50
                ghost3Rotation = 0
            }
            withAnimation(.easeOut(duration: 1.5).delay(0.5)) {
                ghost3Opacity = 1.0
                ghost3Scale = 0.6
                ghost3Offset = -250
                ghost3Rotation = -360.0
            }
            ghost3Rotation = 0
            withAnimation(.easeIn(duration:2).delay(2)) {
                ghost3Opacity = 0.0
                ghost3Scale = 1.4
                ghost3Offset = 1000
                
            }
        case 11:
            sentence = "He turns around, and runs out of the room to find his friends."
        case 12:
            tabSelection = 5
            showChapter4 = false
        default:
            break
        }
    }
    
    func back(_ numberOfClicks: Int) {
        switch numberOfClicks {
        case -1:
            tabSelection = 4
            showChapter4 = false
        case 0:
            sentence = "Standing outside the bedroom door, Nathan reaches out and turns the doorknob."
            withAnimation(.linear(duration: 1)) {
                doorOpacity = 1.0
            }
        case 1:
            sentence = "The door creaks as he opens it."
            
        case 2:
            sentence = "He tries flipping the light switch but the bulb is burnt out."
            withAnimation(.linear(duration: 2)) {
                lightOn = false
            }
        case 3:
            sentence = "The room is dark, so he turns on his flashlight and steps inside."
            
        case 4:
            sentence = "To his surprise, the door slams behind him."
            
        case 5:
            sentence = "Frightened in the dark, he shines his flashlight around the room."
            withAnimation(.linear(duration: 2)) {
                chestClosedOpacity = 0.0
            }
        case 6:
            sentence = "The only thing he sees in the room is a wooden trunk."
            
            withAnimation(.easeInOut(duration: 0.6)) {
                chestClosedOpacity = 1.0
            }
            chestOpenOpacity = 0.0
        case 7:
            sentence = "He opens the trunk..."
            withAnimation(.easeOut(duration: 2)) {
                ghost1Opacity = 1.0
                ghost1Scale = 0.6
                ghost1Offset = -160
            }
            withAnimation(.easeIn(duration: 2).delay(2)) {
                ghost1Opacity = 0.0
                ghost1Scale = 0.1
                ghost1Offset = 150
            }
        case 8:
            sentence = story.ghostSentences[0]
            withAnimation(.easeOut(duration: 2)) {
                ghost2Opacity = 1.0
                ghost2Scale = 0.6
                ghost2Offset = -160
            }
            withAnimation(.easeIn(duration: 2).delay(2)) {
                ghost2Opacity = 0.0
                ghost2Scale = 0.1
                ghost2Offset = 150
            }
        case 9:
            sentence = story.ghostSentences[1]
            withAnimation(.easeOut(duration: 2)) {
                ghost3Opacity = 1.0
                ghost3Scale = 0.6
                ghost3Offset = -160
            }
            withAnimation(.easeIn(duration: 2).delay(2)) {
                ghost3Opacity = 0.0
                ghost3Scale = 0.1
                ghost3Offset = 150
            }
        case 10:
            sentence = story.ghostSentences[2]
        case 11:
            sentence = "He turns around, and runs out of the room to find his friends."
        default:
            break
        }
    }
}



//#Preview {
//    LightBroken(story: StoryVM(), showChapter4: false)
//}



//                        Button("Home") {
//                            self.presentationMode.wrappedValue.dismiss()
//                        }
//                        .buttonStyle(.bordered)
//                        .font(.largeTitle)
//                        .tint(.white)
//                        Spacer()
