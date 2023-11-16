import SwiftUI

struct Chapter1View: View {
    @Binding var showChapter1: Bool
    @Binding var tabSelection: Int
    @State var numberOfClicks: Int = 0
    @State var sentence: String = "One Halloween night, many years ago, some friends were looking for something fun to do."
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("house3")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
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
        case 1:
            sentence = "\"Have you ever seen that old abandoned house on Hill Street? It's so creepy. We should check it out.\""
        case 2:
            sentence = "\"We should go explore it!\" one of the friends said."
        case 3:
            sentence = "\"I don't know about that...\" said another."
        case 4:
            sentence = "\"Oh, come on! let's go!\" and so the friends walked in the moonlight to the dark, lonely house on Hill Street."
        case 5:
            sentence = "When they got there, the friends found the front door ajar, and they walked right in."
        case 6:
            tabSelection = 2
            showChapter1 = false
        default:
            break
        }
    }
    
    func back(_ numberOfClicks: Int) {
        switch numberOfClicks {
        case -1:
            showChapter1 = false
            tabSelection = 1
        case 0:
            sentence = "One Halloween night, many years ago, some friends were looking for something fun to do."
        case 1:
            sentence = "\"Have you ever seen that old abandoned house on Hill Street? It's so creepy. We should check it out.\""
        case 2:
            sentence = "\"We should go explore it!\" one of the friends said."
        case 3:
            sentence = "\"I don't know about that...\" said another."
        case 4:
            sentence = "\"Oh, come on! let's go!\" and so the friends walked in the moonlight to the dark, lonely house on Hill Street."
        case 5:
            sentence = "When they got there, the friends found the front door ajar, and they walked right in."
        default:
            break
        }
    }
}

//#Preview {
//    Chapter1View()
//}
