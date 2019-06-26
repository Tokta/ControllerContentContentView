//
//  Content.swift
//  CCC
//
//  Created by Alessio Sardella on 26/04/2019.
//  Copyright © 2019 Alessio Sardella. All rights reserved.
//

import Foundation

public protocol ContentDelegate: AnyObject {
    
    func showAlertWithTrainerName(_ name: String)
    
    func reloadData()
}

open class TrainersContent {
    
    public var trainers: [Trainer] = []
    ///True if data are loaded
    public var loaded: Bool = false
    ///True if an error occurred while loading
    public var loadError: Bool = false
    
    public weak var delegate: ContentDelegate?
    
    public init() {
        
    }
    
    open func loadData(completion:@escaping () -> Void) {
        
        self.setLoaded(false)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            
            do {
                
                self.trainers = try JSONReader.decodeJsonToObjectDictionary(jsonName: "trainers").compactMap({ (dictionary) -> Trainer? in
                    
                    return Trainer(with: dictionary)
                    
                })
                self.sortTrainers()
                self.setLoaded(true)
                completion()
                
            } catch {
                
                self.trainers = []
                self.setLoadError()
                completion()
                
            }
        }
    }
    
    public final func setLoaded(_ load: Bool) {
        self.loaded = load
        self.loadError = false
    }
    
    public final func setLoadError() {
        self.loaded = true
        self.loadError = true
    }
}

extension TrainersContent{
    
    func sortTrainers(){
        self.trainers = self.trainers.sorted(by: { (trainerA, trainerB) -> Bool in
            
            trainerA.name < trainerB.name
            
        })
    }
}
