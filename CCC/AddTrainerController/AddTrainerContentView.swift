//
//  AddTrainerContentView.swift
//  CCC
//
//  Created by Alessio Sardella on 07/05/2019.
//  Copyright © 2019 Alessio Sardella. All rights reserved.
//

import UIKit

open class AddTrainerContentView: UIView {
    
    public var content: AddTrainerContent!
    
    public init(frame: CGRect, content: AddTrainerContent) {
        
        super.init(frame: frame)
        self.content = content
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: frame.size.width - 20, height: 50))
        button.backgroundColor = .black
        button.center = self.center
        button.setTitle("Add Trainer", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self.content, action: #selector(self.content.createNewTrainer), for: .touchUpInside)
        addSubview(button)
        
    }
    
    @available(*, unavailable)
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
