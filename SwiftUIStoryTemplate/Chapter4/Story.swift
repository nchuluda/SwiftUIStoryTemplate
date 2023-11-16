//
//  Story.swift
//  SwiftUIStoryTemplate
//
//  Created by Nathan on 11/14/23.
//

import Foundation

struct Story {
    
    let numberOfGhosts = Int.random(in: 2...4)
    
    var phrases = ["Boo!", "Leave us alone!", "Get out!", "You aren't welcome here!", "This is our house!"]
    var verbs = ["howls", "hisses", "shrieks", "screams", "shouts", "booms", "yells"]
    
    struct Ghost {
        var name: String? = nil
        var phrase: String? = nil
        var verb: String? = nil
        var ordinal: String? = nil
    }
    
    var ghost1 = Ghost()
    var ghost2 = Ghost()
    var ghost3 = Ghost()
    
    var ghosts: [Ghost] = []
    var ghostImages = ["ghost1", "ghost2", "ghost3", "ghost4", "ghost5", "ghost6", "ghost7", "ghost8"]
    var ghostSentences: [String] = []

    mutating func ghostFactory() {
        phrases.shuffle()
        verbs.shuffle()
        ghostImages.shuffle()
        ghost1 = Ghost(name: ghostImages[0], phrase: phrases[0], verb: verbs[0], ordinal: "first")
        ghost2 = Ghost(name: ghostImages[1], phrase: phrases[1], verb: verbs[1], ordinal: "second")
        ghost3 = Ghost(name: ghostImages[2], phrase: phrases[2], verb: verbs[2], ordinal: "third")
        
        ghosts = [ghost1, ghost2, ghost3]
        
        for ghost in ghosts {
            ghostSentences.append("\"\(ghost.phrase!)\" \(ghost.verb!) the \(ghost.ordinal!) ghost.")
        }
    }
}
