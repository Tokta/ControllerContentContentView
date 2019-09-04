//
//  Content.swift
//  CCC
//
//  Created by Alessio Sardella on 04/09/2019.
//  Copyright © 2019 Alessio Sardella. All rights reserved.
//

import Foundation

class Content {
    
    public var dataSource: [Any] = []
    public weak var delegate: ContentDelegate?
    public var currentTab: Int = 0
    
    ///True if data are loaded
    private(set) var loaded: Bool = false
    ///True if an error occured while loading
    private(set) var loadError: ContentError = ContentError()
    
    init() {
        
    }
    
    func loadData(completion:@escaping () -> Void) {
        
        //Override in subclass
        
    }
    
    public final func setLoaded(_ load: Bool) {
        self.loaded = load
    }
    
    public final func setLoadError(_ error: String) {
        self.loadError = ContentError(error)
        self.loaded = true
    }
    
    public final func resetLoadError() {
        self.loadError = ContentError("")
        self.loaded = false
    }
}

