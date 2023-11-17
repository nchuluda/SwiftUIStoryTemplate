import SwiftUI

struct Chapter3View: View {
    @State var doorOpen = false
    @State var witchVisible = false
    @State var sentence = "."
    @State var numberOfTaps = 0
    @State var forest = false
    @State var Village = false
    @State var boat = false
    @State var forestD = false
    @State var kitchenE = false
    @State var opacity1: Double = 1.0
    @State var opacity2: Double = 0.0
    @State var opacity3: Double = 0.0
    @State var opacity4: Double = 0.0
    @State var opacity5: Double = 0.0
    @State var opacity6: Double = 0.0
    @State var opacity7: Double = 0.0
    @State var opacity8: Double = 0.0
    
    @Binding var showChapter3: Bool
    @Binding var tabSelection: Int
    
    
    var body: some View {
        GeometryReader { geo in
            ZStack{
                Image("snakeDoor2")
                    .resizable()
                    .scaledToFill()
                    .opacity(opacity1)
                    .ignoresSafeArea()
//                if doorOpen {
                    Image("hauntedRoom2")
                        .resizable()
                        .scaledToFill()
                        .opacity(opacity2)
                        .ignoresSafeArea()
//                    }
//                if witchVisible {
                    Image("witch")
                        .resizable()
                        .scaledToFill()
                        .opacity(opacity3)
                        .ignoresSafeArea()
//                }
//                if forest {
                    Image("forest")
                        .resizable()
                        .scaledToFill()
                        .opacity(opacity4)
                        .ignoresSafeArea()
//                }
//                if Village {
                    Image("Village")
                        .resizable()
                        .scaledToFill()
                        .opacity(opacity5)
                        .ignoresSafeArea()
//                }
//                if boat {
                    Image("boat")
                        .resizable()
                        .scaledToFill()
                        .opacity(opacity6)
                        .ignoresSafeArea()
//                }
//                if forestD {
                    Image("forestD")
                        .resizable()
                        .scaledToFill()
                        .opacity(opacity7)
                        .ignoresSafeArea()
//                }
//                if kitchenE {
                    Image("kitchenE")
                        .resizable()
                        .scaledToFill()
                        .opacity(opacity8)
                        .ignoresSafeArea()
//                }
                
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
//                        Button("Back") {
//                            numberOfClicks -= 1
//                            back(numberOfClicks)
//                        }
//                        .buttonStyle(.bordered)
//                        .font(.largeTitle)
//                        .tint(.white)
//                        .padding(.leading)
                        Spacer()
                        Button("Next") {
                            numberOfTaps +=  1
                            next(numberOfTaps)
                        }
                        .buttonStyle(.bordered)
                        .font(.largeTitle)
                        .tint(.white)
                        .padding(.trailing)
                    }.frame(width: geo.size.width)
                }
//                VStack{
//                        Text(sentence)
//                        .frame (width:380)
//                        .frame(alignment: .topLeading)
//                        .bold()
//                            .font(.title)
//                            .offset(x:10)
//                            .offset(y:300)
//                            .foregroundColor(.white)
//                    
//                    
//                    
//                        Button("Next"){
//                            numberOfTaps += 1
//                            next(numberOfTaps)
//                        }
//                        .buttonStyle(.bordered)
//                        .font(.largeTitle)
//                        .tint(.white)
//                        .offset(x:110)
//                        .offset(y:300)
//                }
//                VStack {
//                    Spacer()
//                    Text(sentence)
//    //                    .frame(width:380, alignment: .topLeading)
//                        .bold()
//                        .font(.title)
//                        .padding()
//                        .foregroundColor(.white)
//                    HStack {
//                        Button("Next") {
//                            numberOfTaps +=  1
//                            next(numberOfTaps)
//                        }
//                        .buttonStyle(.bordered)
//                        .font(.largeTitle)
//                        .tint(.white)
//                        .padding(.trailing)
//                    
//                    }.frame(width: geo.size.width)
//                }
            }
        }
        
    }
    func next(_ numberOfTaps:Int){
        
        switch numberOfTaps {
        case 1:
            sentence = "I step through a creepy door "
             
            
        case 2:
            sentence = "and I see a witch by the name of Rynesses"
            withAnimation(.easeIn(duration:1)){
                doorOpen=true
                
            }
        case 3:
            sentence = "And she threw two yellow stones that put me back in time "
            withAnimation(.linear(duration: 1)){
                witchVisible = true
            }
        case 4:
            sentence = " Now I am now in the old legend of the snake goddess of bell isle Suddenly the witch disappeared and the room changed "
            withAnimation(.linear(duration: 1)){
                forest = true
            }
        case 5:
            sentence = "but her voice is still there and she instructs me to figure out the meaning behind her title"
        case 6:
            sentence = "I start By going into the woods and look for the one rare white doe from the folklore story says that the Chippewa chief"
        case 7:
            sentence = "wanted his daughter to be protected from men who wanted to marry his beautiful daughter"
        case 8:
            sentence = "As I go through the dark woods I finally get to a clear landing where everything is peaceful and I see the prettiest white doe"
        case 9:
            sentence = "when we meet eyes and I bow to show my respect to her when she yells asking why dare I intrude on her island"
        case 10:
            sentence = "I tell her quickly that im not here to hurt her I just wanna know how you ended up like this,"
        case 11:
            sentence = "when she hears my plea she walks up to me and states \"if you really want to know me touch my forehead and look into my past\" so I decided"
        case 12:
            sentence = "to touch her forehead and it took me into her memory and In the chippewa village"
            withAnimation(.linear(duration: 1)){
                Village = true
            }
        case 13:
            sentence = "Native American Chief Sleeping Bear had a daughter with beauty of no other, many men wanted to wed his daughter but he kept turning them down"
        case 14:
            sentence = "Eventually he put his daughter on a boat and covered her up so no men would would want to marry her after sometime he"
            withAnimation(.linear(duration: 1)){
               boat = true
            }
        case 15:
            sentence = "puts his daughter in a boat to hid her and puts a blanket to hide her"
        case 16:
            sentence = "but even the wind was curious to see the girl"
        case 17:
            sentence = "and with a gust of wind the blanket flew off but was also strong enough to send her down the river where she ended up being take captive by a man for a while"
        case 18:
            sentence = "When she was returned to her father he was so detrminted to keep her safe and went to the island and asked the gods to keep her safe"
        case 19:
            sentence = "which they did by making her immortal and also placing giant snakes around the island to keep her safe"
        case 20:
            sentence = "back from her memory we are now standing in the dark now"
            withAnimation(.linear(duration: 1)){
                forestD = true
            }
        case 21:
            sentence = "\"So your father just wanted just wanted to protect you and make sure that u never got hurt but ended up hurting you for eternity\""
        case 22:
            sentence = "\"that’s so sad, this is the reason why no one wants to come to the island because they fear you but don’t know you.\""
        case 23:
            sentence = "I kneel down to hug her and say \"no matter what form or shape you take you will always be beautiful\""
        case 24:
            sentence = "and with that I had not only figured out why she got the title of “snake goddess of bell isle” but also freed her of her curse of immortality and saving her soul and bell isle"
        case 25:
            sentence = "Smoke surrounded me and I was in the empty room which I originally had stepped into and there was nothing so I left and went into the kitchen to see where my friends were"
            withAnimation(.easeIn(duration:1)){
                kitchenE=true
                
            }
            
        default:
          break
    }
  }
}

//#Preview {
//    Chapter3View()
//}


//import SwiftUI
//
//struct Chapter3View: View {
//    @Binding var showChapter3: Bool
//
//    var body: some View {
//        GeometryReader { geo in
//            ZStack {
//                Image("stairs")
//                    .resizable()
//                    .scaledToFill()
//                    .ignoresSafeArea()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: geo.size.width, height: geo.size.height)
//                Text("EXIT")
//                    .font(.largeTitle)
//                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                    .foregroundColor(Color.white)
//                    .onTapGesture {
//                        showChapter3.toggle()
//                    }
//            }
//        }
//    }
//}
//
////#Preview {
////    Chapter3View(showChapter3: $showChapter3)
////}
