//
//  ViewController.swift
//  FireKVO
//
//  Created by Joan Angb on 29/07/2017.
//  Copyright © 2017 DevArtisant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: - Properties
    
    @IBOutlet var timeLabel: UILabel!
    
    // MARK: -
    
    let configurationManager = ConfigurationManager(withConfiguration: Configuration())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addObserver(self, forKeyPath: #keyPath(configurationManager.configuration.updatedAt), options: [.old, .new, .initial], context: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Actions
    
    @IBAction func updateConfiguration(sender: UIButton) {
        configurationManager.updateConfiguration()
    }
    
    
    
    // MARK: - Key-Value Observing
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == #keyPath(configurationManager.configuration.updatedAt) {
            // Update Time Label
            timeLabel.text = configurationManager.updatedAt
        }
    }
    
    // MARK: - Deinitialization
    
    deinit {
        removeObserver(self, forKeyPath: #keyPath(configurationManager.configuration.updatedAt))
    }

}

