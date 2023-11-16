//
//  LightBrokenViewModel.swift
//  SwiftUIStoryTemplate
//
//  Created by Nathan on 11/14/23.
//

import SwiftUI

class StoryVM: ObservableObject {
    @Published var model = Story()
    
    init() {
        model.ghostFactory()
    }
    
    var ghost1: Story.Ghost { model.ghost1 }
    var ghost2: Story.Ghost { model.ghost2 }
    var ghost3: Story.Ghost { model.ghost3 }
    
    var numberOfGhosts: Int { model.numberOfGhosts }
    var ghostSentences: [String] { model.ghostSentences }
}
