//
//  StoryColors.swift
//  MyStoryChapter
//
//  Created by johndanial on 24/08/1402 AP.
//

import SwiftUI

struct StoryColors: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    
                }
                
                Image(systemName: "rainbow")
                    .font(.system(size: 200))
                    .symbolRenderingMode(.multicolor)
                    .symbolEffect(
                        .variableColor
                            .reversing
                            .iterative
                            .hideInactiveLayers
                        
                    )
                Spacer()
                
                Text("you can't leave\n\n\n")
                    .multilineTextAlignment(.center)
                    .bold()
                    .font(.largeTitle)
           
                Text ("Door is gone")
                    .multilineTextAlignment(.center)
                    .bold()
                    .font(.largeTitle)
                Spacer()
                
            }
            
          
        }
        NavigationLink {
            allRooms() }
    label: {
        Label("RunRunRun", systemImage: "figure.run.circle.fill")
            .foregroundColor(.red)
            .font(.system(size: 40))
//            .padding(.trailing, 25)
            .padding(.bottom, 40)
        
    }
    .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    StoryColors()
}
