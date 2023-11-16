import SwiftUI

struct Chapter3View: View {
    @Binding var showChapter3: Bool

    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("stairs")
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
                        showChapter3.toggle()
                    }
            }
        }
    }
}

//#Preview {
//    Chapter3View(showChapter3: $showChapter3)
//}
