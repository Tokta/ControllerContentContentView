//
//  Model.swift
//  CCC
//
//  Created by Alessio Sardella on 26/04/2019.
//  Copyright © 2019 Alessio Sardella. All rights reserved.
//

import Foundation

public class Trainer {
    
    var name: String!
    
    init(with dictionary: [String:Any]){
        
        self.name = dictionary["name"] as? String ?? ""
    }
}


