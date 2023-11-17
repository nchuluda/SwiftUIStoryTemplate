import SwiftUI

struct Chapter3View: View {
    @State var doorOpen = false
    @State var witchVisible = false
    @State var sentence = ""
    @State var numberOfTaps = 0
    @State var forest = false
    @State var Village = false
    @State var boat = false
    @State var forestD = false
    @State var kitchenE = false
    @Binding var showChapter3: Bool
    @Binding var tabSelection: Int

    var body: some View {
        ZStack{
            Image("snakeDoor")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            if doorOpen{
                Image("hauntedRoom")
                }
            if witchVisible{
                Image("witch")
                if forest{
                    Image("forest")
                    if Village{
                        Image("Village")
                        if boat{
                            Image("boat")
                            if forestD{
                                Image("forestD")
                                if kitchenE{
                                    Image("kitchenE")
                                }
                            }
                        }
                    }
                }
            }
            VStack{
                    Text(sentence)
                    .frame (width:380)
                    .frame(alignment: .topLeading)
                    .bold()
                        .font(.title)
                        .offset(x:10)
                        .offset(y:300)
                        .foregroundColor(.white)
                
                
                
                    Button("Next"){
                        numberOfTaps += 1
                        next(numberOfTaps)
                    }
                    .buttonStyle(.bordered)
                    .font(.largeTitle)
                    .tint(.white)
                    .offset(x:110)
                    .offset(y:300)
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
        case 26:
            tabSelection = 4
            showChapter3 = false
            
        default:
          break
    }
  }
}

//#Preview {
//    Chapter3View()
//}
