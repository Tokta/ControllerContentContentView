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

class AddTrainerController: Controller {
    
    var content:AddTrainerContent = AddTrainerContent()
    var contentView:AddTrainerContentView!
    
    public weak var delegate: AddTrainerControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.startController()
    }
    
    override func getContent() -> Content {
        return self.content
    }
    
    override func loadContent(){
        self.content.delegate = self
        self.content.loadData {
            self.bindView()
        }
    }
    
    override func loadContentView() {
        self.contentView = AddTrainerContentView(frame: self.view.bounds, content: self.content)
        self.view.addSubview(self.contentView)
    }

}

extension AddTrainerController: ContentDelegate{
   
    func baseDelegate(withKey key: BaseKey, _ dictionary: [String : Any]?) {
        
        if key == .createTrainer,
            let trainer = dictionary?[DictionaryKey.trainerKey] as? Trainer{
            
            self.dismiss(animated: true, completion: {
                self.delegate?.addNewTrainerAndReload(trainer)
            })
        }
    }
}
