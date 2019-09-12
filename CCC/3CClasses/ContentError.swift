//
//  ContentError.swift
//  CCC
//
//  Created by Alessio Sardella on 04/09/2019.
//  Copyright © 2019 Alessio Sardella. All rights reserved.
//

import Foundation

struct ContentError {
    
    var text: String = ""
    var isError: Bool = false
    
    init(_ error: String? = nil) {
        
        if let error = error {
            self.text = error
            self.isError = !self.text.isEmpty
        }
    }
}
