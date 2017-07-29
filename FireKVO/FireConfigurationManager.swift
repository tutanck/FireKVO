//
//  FireConfigurationManager.swift
//  FireKVO
//
//  Created by Joan Angb on 29/07/2017.
//  Copyright © 2017 DevArtisant. All rights reserved.
//

import UIKit
import Firebase

class FireConfigurationManager: DBObject {
    
    // MARK: - Properties
    
    var configuration: FireConfiguration
    
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
    
    init(parent  : DatabaseReference) {
        self.configuration = FireConfiguration(parent: ref)
        super.init(parent: parent, fields: ["configuration"])

    }
    
    
    // MARK: - Public Interface
    
    func updateConfiguration() {
        configuration.updatedAt = Date()
    }
    
}
