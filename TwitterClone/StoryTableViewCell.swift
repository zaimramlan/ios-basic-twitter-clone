//
//  StoryTableViewCell.swift
//  TwitterClone
//
//  Created by Zaim Ramlan on 01/04/2017.
//  Copyright © 2017 zaimramlan. All rights reserved.
//

import UIKit

class StoryTableViewCell: UITableViewCell {
    fileprivate let likeColor = UIColor(red: 243.0/255.0, green: 62.0/255.0, blue: 30.0/255.0, alpha: 1.0)
    fileprivate let angryColor = UIColor(red: 155/255.0, green: 53/255.0, blue: 181/255.0, alpha: 1.0)
    
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var dislikeButton: UIButton!
    
    var story: Story! {
        didSet {
            storyLabel.text = story.text
            likeButton.setTitle("😍 \(story.numberOfLikes)", for: UIControlState())
            dislikeButton.setTitle("😞 \(story.numberOfDislikes)", for: UIControlState())
        }
    }
    @IBAction func dislikeDidTouch(_ sender: AnyObject) {
        // CHALLENGE: get dislikes on this story
    }
    
    @IBAction func likeDidTouch(_ sender: AnyObject) {
        // TODO: Like this story
    }
}
