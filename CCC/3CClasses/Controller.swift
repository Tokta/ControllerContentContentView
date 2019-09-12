//
//  Controller.swift
//  CCC
//
//  Created by Alessio Sardella on 04/09/2019.
//  Copyright © 2019 Alessio Sardella. All rights reserved.
//

import UIKit

class Controller: UIViewController {
    
    final func startController(){
        self.loadContent()
        self.bindView()
    }
    
    func getContent() -> Content{
        fatalError("Override in subclass")
    }
    
    func loadContent(){
        fatalError("Override in subclass")
    }
    
    func loadContentView(){
        fatalError("Override in subclass")
    }
    
    final func bindView(){
        
        self.view.subviews.forEach{$0.removeFromSuperview()}
        
        if !self.getContent().loaded{
            
            self.showMessage("Loading...")
            
        }else if self.getContent().loadError.isError{
            
            self.showMessage(self.getContent().loadError.text)
            
        }else{
            
            self.loadContentView()
            
        }
    }
    
    func showMessage(_ message:String){
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 20))
        label.center = self.view.center
        label.text = message
        label.textAlignment = .center
        label.textColor = .black
        self.view.addSubview(label)
    }
}
