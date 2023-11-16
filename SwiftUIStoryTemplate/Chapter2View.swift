import SwiftUI

struct Chapter2View: View {
    @Binding var showChapter2: Bool

    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("hallway2")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geo.size.width, height: geo.size.height)
                Text("EXIT")
                    .font(.largeTitle)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color.white)
                    .onTapGesture {
                        showChapter2.toggle()
                    }
            }
        }
    }
}

//#Preview {
//    Chapter2View()
//}
