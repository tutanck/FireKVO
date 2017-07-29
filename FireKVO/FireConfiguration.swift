//
//  FireConfiguration.swift
//  FireKVO
//
//  Created by Joan Angb on 29/07/2017.
//  Copyright © 2017 DevArtisant. All rights reserved.
//

import Foundation
import Firebase

class FireConfiguration: DBObject {
    
    // MARK: - Properties
    
    dynamic var createdAt : Date
    dynamic var updatedAt : Date
    
    
    init(parent  : DatabaseReference){
        createdAt = Date()
        updatedAt = Date()
        
        super.init(parent: parent, fields: ["createdAt","updatedAt"])
    }
}
