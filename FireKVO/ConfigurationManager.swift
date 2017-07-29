//
//  ConfigurationManager.swift
//  FireKVO
//
//  Created by Joan Angb on 29/07/2017.
//  Copyright © 2017 DevArtisant. All rights reserved.
//

import UIKit

class ConfigurationManager: NSObject {
    
    // MARK: - Properties
    
    var configuration: Configuration
    
    // MARK: -
    
    lazy private var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy:MM:dd HH:mm:ss"
        return dateFormatter
    }()
    
    // MARK: -
    
    var createdAt: String {
        return dateFormatter.string(from: configuration.createdAt)
    }
    
    var updatedAt: String {
        return dateFormatter.string(from: configuration.updatedAt)
    }
    
    // MARK: - Initialization
    
    init(withConfiguration configuration: Configuration) {
        self.configuration = configuration
        
        super.init()
    }
    
    // MARK: - Public Interface
    
    func updateConfiguration() {
        configuration.updatedAt = Date()
    }
    
}
