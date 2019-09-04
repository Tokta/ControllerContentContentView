//
//  ContentView.swift
//  CCC
//
//  Created by Alessio Sardella on 04/09/2019.
//  Copyright © 2019 Alessio Sardella. All rights reserved.
//

import UIKit

class ContentView: UIView {
    
    var content: Content!
    
    init(frame: CGRect, content: Content) {
        
        super.init(frame: frame)
        self.content = content
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
