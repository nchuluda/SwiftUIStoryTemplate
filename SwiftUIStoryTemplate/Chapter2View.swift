import SwiftUI

struct Chapter2View: View {
    @Binding var showChapter2: Bool
    @Binding var tabSelection: Int

    var body: some View {
        NavigationStack {
            
            VStack{
                Spacer()
                HStack {
                    Spacer()
                    Text("Exit")
                                         .font(.system(size: 30))
                                         .padding(.trailing, 25)
                                         .symbolEffect(.variableColor
                                             .hideInactiveLayers)
                                         .foregroundColor(.red)
                                         .onTapGesture {
                                             showChapter2 = false
                                             tabSelection = 3
                                         }
                                      
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
                        .navigationBarBackButtonHidden(true)
                }
                Spacer()
                Spacer()
                Text ("You are in the room now!")
                    .font(.largeTitle)
                Spacer()
                HStack{
                    Image(systemName: "chineseyuanrenminbisign.circle")
                        .font(.largeTitle)
                        .foregroundColor(.red)
                        .symbolEffect(.variableColor
                            .hideInactiveLayers)
                    Image(systemName: "o.circle")
                        .font(.largeTitle)
                        .foregroundColor(.red)
                        .symbolEffect(.variableColor
                            .reversing
                            .iterative)
                    Image(systemName: "u.circle")
                        .font(.largeTitle)
                        .foregroundColor(.red)
                        .symbolEffect(.variableColor
                            .hideInactiveLayers)
                    Text ("can leave")
                        .bold()
                }
                Text("if you are scared")
                    .font(.largeTitle)
                Spacer()
                HStack {
                    NavigationLink {
                        dangerStoryMood(showChapter2: $showChapter2, tabSelection: $tabSelection) }
                    label: {
                        Label("Keep Going", systemImage: "")
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                            .bold()
                            .navigationBarBackButtonHidden(true)
                    }
                }
                Spacer()
                }
        }
        .navigationBarBackButtonHidden(true)
    }
}

//#Preview {
//    Chapter2View()
//}
