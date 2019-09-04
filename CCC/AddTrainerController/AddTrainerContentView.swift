//
//  AddTrainerContentView.swift
//  CCC
//
//  Created by Alessio Sardella on 07/05/2019.
//  Copyright © 2019 Alessio Sardella. All rights reserved.
//

import UIKit

class AddTrainerContentView: ContentView {
    
    var addTrainerContent: AddTrainerContent{
        return self.content as! AddTrainerContent
    }
    
    override init(frame: CGRect, content: Content) {
        
        super.init(frame: frame, content: content)
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: frame.size.width - 20, height: 50))
        button.backgroundColor = .black
        button.center = self.center
        button.setTitle("Add Trainer", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self.content, action: #selector(self.addTrainerContent.createNewTrainer), for: .touchUpInside)
        addSubview(button)
        
    }
}
