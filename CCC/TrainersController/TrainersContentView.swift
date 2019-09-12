//
//  ContentView.swift
//  CCC
//
//  Created by Alessio Sardella on 26/04/2019.
//  Copyright © 2019 Alessio Sardella. All rights reserved.
//

import UIKit

class TrainersContentView: ContentView {
    
    var tableView: UITableView = UITableView(frame: CGRect.zero)
    var refreshControl: UIRefreshControl!
    
    override init(frame: CGRect, content: Content) {
        
        super.init(frame: frame, content: content)
        
        tableView = UITableView(frame: self.bounds, style: UITableView.Style.plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.separatorStyle = .singleLine
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.estimatedRowHeight = 50
        addSubview(tableView)
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(self.handleRefresh(_:)), for: UIControl.Event.valueChanged)
        refreshControl.tintColor = .black
        tableView.addSubview(refreshControl)
    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        
        self.refreshControl.endRefreshing()
        self.content.delegate?.baseDelegate(withKey: .reloadData, nil)
    }
}

extension TrainersContentView: UITableViewDelegate, UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return self.content.dataSource.count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.content.dataSource[section] as? [Any])?.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        
        if let trainers = self.content.dataSource[indexPath.section] as? [Trainer],
            trainers.count > indexPath.row{
            
            let trainer = trainers[indexPath.row]
            cell.textLabel?.text = trainer.name
            cell.detailTextLabel?.text = "birthday: " + trainer.getBirthday()
        }
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let trainers = self.content.dataSource[indexPath.section] as? [Trainer],
            trainers.count > indexPath.row{
            
            let trainer = trainers[indexPath.row]
            self.content.delegate?.baseDelegate(withKey: .showAlert, [DictionaryKey.stringKey : trainer.name as Any])
            
        }
    }
}

