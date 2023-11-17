import SwiftUI

struct ContentView: View {
    @State var tabSelection = 1
    
    var body: some View {
        TabView(selection: $tabSelection) {
            Chapter1Preview(tabSelection: $tabSelection)
                .tag(1)
            Chapter2Preview()
                .tag(2)
            Chapter3Preview(tabSelection: $tabSelection)
                .tag(3)
            Chapter4Preview(tabSelection: $tabSelection)
                .tag(4)
            Chapter5Preview(tabSelection: $tabSelection)
                .tag(5)
        }
        .tabViewStyle(.page)
        .ignoresSafeArea()
        .preferredColorScheme(.dark)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ContentView()
}
