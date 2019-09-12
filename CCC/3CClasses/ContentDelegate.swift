//
//  ContentDelegate.swift
//  CCC
//
//  Created by Alessio Sardella on 07/05/2019.
//  Copyright © 2019 Alessio Sardella. All rights reserved.
//

import Foundation

protocol ContentDelegate: AnyObject {
    
    ///Use this method for comunicating updates from the ContentView throught the Content, to the Controller
    func baseDelegate(withKey key: BaseKey, _ dictionary: [String: Any]?)
    
    ///Use this method to manage navigation from the ContentView throught the Content, to the Controller
    func pushNext(withKey key: BaseKey, _ dictionary: [String: Any]?)
}

extension ContentDelegate {
    //This is needed to make the method optional
    func baseDelegate(withKey key: BaseKey, _ dictionary: [String: Any]?){
        
    }
    
    func pushNext(withKey key: BaseKey, _ dictionary: [String: Any]?) {
        
    }
}

//Create keys to manage different delegate's call inside the same method
enum BaseKey {
    
    case goBack
    case pushAddNewTrainer
    case reloadData
    case showAlert
    case createTrainer
}

struct DictionaryKey{
    static let stringKey = "stringKey"
    static let trainerKey = "trainerKey"
}
