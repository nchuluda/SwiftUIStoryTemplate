import SwiftUI

struct Chapter5View: View {
    @Binding var showChapter5: Bool
    @Binding var tabSelection: Int
    @State var numberOfClicks: Int = 0
    @State var hallBrightness: Double = 0.0
    @State var sentence: String = "The friends, each having their own frightening experience in the house, agreed it was time to leave."
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("hall4")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .brightness(hallBrightness)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geo.size.width, height: geo.size.height)
                VStack {
                    Spacer()
                    ZStack {
                        Image("chestOpen")
                            .resizable()
                            .frame(width: geo.size.width/1.9, height: geo.size.width/1.6)
                            .opacity(0.0)
                            .saturation(0.7)
                            .offset(x: 0, y: 150)
                        Image("chestClosed")
                            .resizable()
                            .frame(width: geo.size.width/2, height: geo.size.width/1.3)
                            .opacity(0.0)
                            .saturation(0.7)
                            .offset(x: 0, y: 150)
                        
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
            }
        }
    }
    
    func next(_ numberOfClicks: Int) {
        switch numberOfClicks {
//        case 1:
//            sentence = "One Halloween night, many years ago, some friends were looking for something fun to do."
        case 1:
            sentence = "\"I can't believe what happened tonight\" one of them said."
        case 2:
            sentence = "\"Let's get out of here!\" urged another."
        case 3:
            sentence = "They walked back into the moonlight, grateful to be away from the terror of Hill House."
        case 4:
            sentence = "The End"
            withAnimation(.easeIn(duration: 2)) {
                hallBrightness = -1.0
            }
        case 5:
            tabSelection = 1
            showChapter5 = false
//            withAnimation(.easeIn(duration: 1).delay(2)) {
//                showChapter5 = false
//            }
//            withAnimation(.easeIn(duration: 1).delay(3)) {
//                tabSelection = 1
//            }
        default:
            break
        }
    }
    
    func back(_ numberOfClicks: Int) {
        switch numberOfClicks {
        case -1:
            showChapter5 = false
            tabSelection = 5
        case 0:
            sentence = "The friends, each having their own frightening experience in the house, agreed it was time to leave."
        case 1:
            sentence = "\"I can't believe what happened tonight\" one of them said."
        case 2:
            sentence = "\"Let's get out of here!\" urged another."
        case 3:
            sentence = "They walked back into the moonlight, grateful to be away from the terror of Hill House."
            withAnimation(.easeIn(duration: 1)) {
                hallBrightness = 0.0
            }
        default:
            break
        }
    }
}

//#Preview {
//    Chapter1View()
//}
