//
//  AddTrainerContent.swift
//  CCC
//
//  Created by Alessio Sardella on 07/05/2019.
//  Copyright © 2019 Alessio Sardella. All rights reserved.
//

import Foundation

class AddTrainerContent: Content{
    
    override func loadData(completion: @escaping () -> Void) {
        self.setLoaded(true)
        completion()
    }
    
    @objc func createNewTrainer() {
        
        //For sake of simplicity it is hardcoded
        let newTrainer = Trainer(with: ["name": "Abigail Smith", "birthdate" : "1899-12-03T02:59:07 -01:00"])
        self.delegate?.baseDelegate(withKey: .createTrainer, [DictionaryKey.trainerKey : newTrainer])
        
    }
}
