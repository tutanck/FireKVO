//
//  FireViewController.swift
//  FireKVO
//
//  Created by Joan Angb on 29/07/2017.
//  Copyright © 2017 DevArtisant. All rights reserved.
//

import UIKit
import Firebase

class FireViewController: UIViewController {
    
    
    // MARK: - Properties
    
    @IBOutlet var timeLabel: UILabel!
    
    // MARK: -
    
    var fireConfigurationManager : FireConfigurationManager? = nil 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let ref : DatabaseReference! = Database.database().reference()
        print("AZERTY : \(ref.key)")
        
        
        
        fireConfigurationManager = FireConfigurationManager(parent: ref)
        
        addObserver(self, forKeyPath: #keyPath(fireConfigurationManager.configuration.updatedAt), options: [.old, .new, .initial], context: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Actions
    
    @IBAction func updateConfiguration(sender: UIButton) {
        fireConfigurationManager!.updateConfiguration()
    }
    
    
    
    // MARK: - Key-Value Observing
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == #keyPath(fireConfigurationManager.configuration.updatedAt) {
            // Update Time Label
            timeLabel.text = fireConfigurationManager!.updatedAt
        }
    }
    
    // MARK: - Deinitialization
    
    deinit {
        removeObserver(self, forKeyPath: #keyPath(fireConfigurationManager.configuration.updatedAt))
    }
    
}

