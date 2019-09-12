//
//  Content.swift
//  CCC
//
//  Created by Alessio Sardella on 26/04/2019.
//  Copyright © 2019 Alessio Sardella. All rights reserved.
//

import Foundation

class TrainersContent: Content {
    
    private var trainers: [Trainer] = []
    
    override func loadData(completion:@escaping () -> Void) {
        
        self.resetLoadError()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            
            do {
                
                self.trainers = try JSONReader.decodeJsonToObjectDictionary(jsonName: "trainers").compactMap({ (dictionary) -> Trainer? in
                    
                    return Trainer(with: dictionary)
                    
                })
                self.sortTrainers()
                self.dataSource = [self.trainers]
                self.setLoaded(true)
                completion()
                
            } catch {
                
                self.dataSource = []
                self.setLoadError("Something went wrong")
                completion()
                
            }
        }
    }
}

extension TrainersContent{
    
    func addTrainer(_ trainer: Trainer){
    
        self.trainers.append(trainer)
        self.sortTrainers()
        self.dataSource = [self.trainers]
    }
    
    func sortTrainers(){
        self.trainers = self.trainers.sorted(by: { (trainerA, trainerB) -> Bool in
            
            trainerA.name < trainerB.name
            
        })
    }
}
