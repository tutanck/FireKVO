//
//  DBObject.swift
//  FireKVO
//
//  Created by Joan Angb on 29/07/2017.
//  Copyright © 2017 DevArtisant. All rights reserved.
//

import Foundation
import Firebase


class DBObject : NSObject {
    
    // MARK: - Properties
    
    let ref : DatabaseReference
    
    private let dbProperties : [String]
    
    /*lazy var serializedDictionary : [String : Any] = {
        var dictionary : [String : Any] = [:]
        return dictionary
    }()*/
    
    
    // MARK: - Init
    
    init(
        parent : DatabaseReference,
        fields : [String]=[],
        key: String?=nil
        ){
        
        if key == nil{
            self.ref = parent.childByAutoId()
        }else{
            self.ref = parent.child(key!)
        }
        
        self.dbProperties = fields
        
        super.init()
        
        for prop in self.dbProperties {
            addObserver(self, forKeyPath: prop, options: [.old, .new], context: nil)
        }
    }
    
    
    // MARK: - Deinit
    
    deinit {
        for property in self.dbProperties {
            removeObserver(self, forKeyPath: property)
        }
    }
    
    
    // MARK: - Key-Value Observing
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let property = keyPath,
            dbProperties.contains(property),
            let newValue = change![.newKey],
            let  oldValue = change![.oldKey]{
            print("About to fire local property '\(property)' from '\(oldValue)' to '\(newValue)'")
            fire(property,newValue)
        }
    }
    
    
    
    // MARK: - internal private working set methods
    
    private func fire(_ property : String , _ val : Any){
        if hasSimpleType(val){
            self.ref.child(property).setValue(val)
        }
        else if let val = val as? DBObject {
            self.ref.child(property).setValue(val/*.serializedDictionary*/)
        }else{
            print("Type error") //TODO throw except
        }
    }
    
    
    private func hasSimpleType(_ val : Any)->Bool{
        
        switch val {
            
        case is Bool : return true
            
        case is Int : return true
            
        case is Double : return true
            
        case is String : return true
            
        default: return false
            
        }
        
    }
    
    
    
}
