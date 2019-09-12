//
//  Model.swift
//  CCC
//
//  Created by Alessio Sardella on 26/04/2019.
//  Copyright © 2019 Alessio Sardella. All rights reserved.
//

import Foundation

fileprivate let DBDateFormat = "YYYY-MM-dd'T'hh:mm:ss Z"
fileprivate let TrainerCellDateFormat = "dd.MM.yyy"

public class Trainer {
    
    let name: String
    let birthdate: Date
    
    init(with dictionary: [String:Any]){
        
        self.name = dictionary["name"] as? String ?? ""
        self.birthdate = DateUtils.getDateFromString(dictionary["birthdate"] as? String ?? "",
                                                     withFormat: DBDateFormat)
    }
    
    public func getBirthday() -> String{
        return DateUtils.getStringFromDate(self.birthdate,
                                           withFormat: TrainerCellDateFormat)
    }
}


