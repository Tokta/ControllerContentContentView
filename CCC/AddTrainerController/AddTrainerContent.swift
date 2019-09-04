//
//  AddTrainerContent.swift
//  CCC
//
//  Created by Alessio Sardella on 07/05/2019.
//  Copyright © 2019 Alessio Sardella. All rights reserved.
//

import Foundation

public protocol AddTrainerContentDelegate: AnyObject {
    
    func addTrainer(_ trainer: Trainer)
}

class AddTrainerContent: Content{
    
    override func loadData(completion: @escaping () -> Void) {
        self.setLoaded(true)
        completion()
    }
    
    @objc func createNewTrainer() {
        
        //For sake of simplicity it is hardcoded
        let newTrainer = Trainer(with: ["name": "Alan Smith"])
        self.delegate?.baseDelegate(withKey: .createTrainer, [DictionaryKey.trainerKey.rawValue : newTrainer])
        
    }
}
