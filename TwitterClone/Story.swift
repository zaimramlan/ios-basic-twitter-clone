//
//  Story.swift
//  TwitterClone
//
//  Created by Zaim Ramlan on 01/04/2017.
//  Copyright © 2017 zaimramlan. All rights reserved.
//

import Foundation
import Firebase

class Story {
    var text             = ""
    var numberOfLikes    = 0
    var numberOfDislikes = 0
    
    let ref: FIRDatabaseReference!
    
    private let storiesRef = FIRDatabase.database().reference().child("stories")
    
    init(text: String) {
        self.text = text
        ref       = storiesRef.childByAutoId()
    }
    
    func save() {
        ref.setValue(toAny())
    }
    
    func toAny() -> Any {
        return [
            "text":               text,
            "number_of_likes":    numberOfLikes,
            "number_of_dislikes": numberOfDislikes
        ]
    }
}
