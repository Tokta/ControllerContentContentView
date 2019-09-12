//
//  ViewController.swift
//  CCC
//
//  Created by Alessio Sardella on 26/04/2019.
//  Copyright © 2019 Alessio Sardella. All rights reserved.
//

import UIKit

class TrainersController: Controller {

    var content:TrainersContent = TrainersContent()
    var contentView:TrainersContentView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "New Trainer",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(presentAddNewTrainerController))
        self.startController()
    }

    override func getContent() -> Content{
        return self.content
    }
    
    override func loadContent(){
        self.content.delegate = self
        self.content.loadData {
            self.bindView()
        }
    }
    
    override func loadContentView() {
        
        self.contentView = TrainersContentView(frame: self.view.bounds, content: self.content)
        self.view.addSubview(self.contentView)
    }
    
    @objc func presentAddNewTrainerController(){
        
        let addNewTrainerController = AddTrainerController()
        addNewTrainerController.delegate = self
        self.navigationController?.present(addNewTrainerController, animated: true, completion: nil)
    }
}

extension TrainersController: ContentDelegate{
   
    func baseDelegate(withKey key: BaseKey, _ dictionary: [String: Any]?){
        
        switch key{
        case .reloadData:
            self.reloadData()
            
        case .showAlert:
            if let trainerName = dictionary?[DictionaryKey.stringKey] as? String{
                self.showAlertWithTrainerName(trainerName)
            }
            
        default:
            print("BaseKey not used")
        }
    }
    
    func showAlertWithTrainerName(_ name: String) {
        
        let alert = UIAlertController(title: "Trainer", message: name, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    func reloadData(){
        self.content.setLoaded(false) // set the Content as not loaded
        self.bindView() // reload the View to show a loading screen
        self.content.loadData { // reload Content data
            self.bindView() // reload view to show the ContentView
        }
    }
}

extension TrainersController: AddTrainerControllerDelegate{
    
    func addNewTrainerAndReload(_ trainer: Trainer) {
        
        self.content.addTrainer(trainer)
        self.contentView.tableView.reloadData()
        
    }
}
