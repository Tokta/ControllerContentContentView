//
//  AddTrainerController.swift
//  CCC
//
//  Created by Alessio Sardella on 07/05/2019.
//  Copyright © 2019 Alessio Sardella. All rights reserved.
//

import UIKit

public protocol AddTrainerControllerDelegate: AnyObject {
    
    func addNewTrainerAndReload(_ trainer: Trainer)
}

class AddTrainerController: UIViewController {
    
    var content:AddTrainerContent = AddTrainerContent()
    var contentView:AddTrainerContentView!
    public weak var delegate: AddTrainerControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        self.loadContent()
        self.bindContentView()
    }
    
    func loadContent(){
        self.content.delegate = self
        
    }
    
    func bindContentView(){
        
        self.view.subviews.forEach({ $0.removeFromSuperview() })
        
        self.contentView = AddTrainerContentView(frame: self.view.bounds, content: self.content)
        self.view.addSubview(self.contentView)
    }
}

extension AddTrainerController: AddTrainerContentDelegate{
   
    func addTrainer(_ trainer: Trainer) {
        
        self.dismiss(animated: true, completion: nil)
        self.delegate?.addNewTrainerAndReload(trainer)
        
    }
}
