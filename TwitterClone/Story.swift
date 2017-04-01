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
    
    // set firebase reference
    private let storiesRef = FIRDatabase.database().reference().child("stories")
    
    // set initialiser - for new story
    init(text: String) {
        self.text = text
        ref       = storiesRef.childByAutoId()
    }
    
    // set initialiser - for story from firebase
    init(snapshot: FIRDataSnapshot) {
        ref       = snapshot.ref
        
        if let value = snapshot.value as? [String: Any] {
            text             = value["text"] as! String
            numberOfLikes    = value["number_of_likes"] as! Int
            numberOfDislikes = value["number_of_dislikes"] as! Int
        } else {
            numberOfLikes    = 0
            numberOfDislikes = 0
        }
    }
    
    // function to save to firebase
    func save() {
        ref.setValue(toAny())
    }
    
    // function to format data into key-value pair (dictionary)
    func toAny() -> Any {
        return [
            "text":               text,
            "number_of_likes":    numberOfLikes,
            "number_of_dislikes": numberOfDislikes
        ]
    }
}
