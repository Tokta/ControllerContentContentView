//
//  ViewController.swift
//  CCC
//
//  Created by Alessio Sardella on 26/04/2019.
//  Copyright © 2019 Alessio Sardella. All rights reserved.
//

import UIKit

class TrainersController: UIViewController {

    var content:TrainersContent = TrainersContent()
    var contentView:TrainersContentView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "New Trainer", style: .plain, target: self, action: #selector(presentAddNewTrainerController))
        self.loadContent()
        self.bindContentView()
    }

    func loadContent(){
        self.content.delegate = self
        self.content.loadData {
            self.bindContentView()
        }
    }
    
    func bindContentView(){
        
        self.view.subviews.forEach({ $0.removeFromSuperview() })
        
        if !self.content.loaded{
            
            self.showMessage("Loading...")
            
        }else if self.content.loadError{
            
            self.showMessage("Something went wrong")
            
        }else{
            
            self.contentView = TrainersContentView(frame: self.view.bounds, content: self.content)
            self.view.addSubview(self.contentView)
        }
    }
    
    func showMessage(_ message:String){
        //Show error
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 20))
        label.center = self.view.center
        label.text = message
        label.textAlignment = .center
        label.textColor = .black
        self.view.addSubview(label)
    }
    
    @objc func presentAddNewTrainerController(){
        
        let addNewTrainerController = AddTrainerController()
        addNewTrainerController.delegate = self
        self.navigationController?.present(addNewTrainerController, animated: true, completion: nil)
    }
}

extension TrainersController: ContentDelegate{
   
    func showAlertWithTrainerName(_ name: String) {
        
        let alert = UIAlertController(title: "Trainer", message: name, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    func reloadData(){
        self.content.setLoaded(false) // set the Content as not loaded
        self.bindContentView() // reload the View to show a loading screen
        self.content.loadData { // reload Content data
            self.bindContentView() // reload view to show the ContentView
        }
    }
}

extension TrainersController: AddTrainerControllerDelegate{
    
    func addNewTrainerAndReload(_ trainer: Trainer) {
        
        self.content.trainers.append(trainer)
        self.content.sortTrainers()
        self.contentView.tableView.reloadData()
        
    }
}
