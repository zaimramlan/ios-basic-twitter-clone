//
//  StoriesTableViewController.swift
//  TwitterClone
//
//  Created by Zaim Ramlan on 01/04/2017.
//  Copyright © 2017 zaimramlan. All rights reserved.
//

import UIKit
import Firebase

class StoriesTableViewController: UITableViewController {
    // MARK: - Properties
    var stories = [Story]()
    
    // set firebase reference
    private let storiesRef = FIRDatabase.database().reference().child("stories")
    
    @IBOutlet weak var composeBarButtonItem: UIBarButtonItem!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // bind onto firebase database
        storiesRef.observe(.value, with: { snapshot in
            // remove existing stories
            self.stories.removeAll()
            
            // access child object
            for child in snapshot.children {
                // initialise the child object into a story
                let story = Story(snapshot: child as! FIRDataSnapshot)
                self.stories.append(story)
            }
            
            // reload the tableView to display latest data from firebase
            self.tableView.reloadData()
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.hidesBackButton = true
        title = "Stories"
        self.navigationItem.rightBarButtonItem = composeBarButtonItem
        
        self.tableView.estimatedRowHeight = 92.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell   = tableView.dequeueReusableCell(withIdentifier: "Story Cell", for: indexPath) as! StoryTableViewCell
        
        // assign the cell with the story at the particular index
        cell.story = self.stories[indexPath.row]
        
        return cell
    }
}
