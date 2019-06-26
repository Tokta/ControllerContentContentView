//
//  BaseContent.swift
//  CCC
//
//  Created by Alessio Sardella on 07/05/2019.
//  Copyright © 2019 Alessio Sardella. All rights reserved.
//

import Foundation

open class BaseContent {
    
    public var dataSource: [Any] = []
    ///True if data are loaded
    public var loaded: Bool = false
    ///True if an error occurred while loading
    public var loadError: Bool = false
    
    weak var delegate: BaseDelegate?
    
    public init() {
        
    }
    
    open func loadData(completion:@escaping () -> Void) {
        
        //OVERRIDE IN SUBCLASSS
        fatalError()
    }
    
    public final func setLoaded(_ load: Bool) {
        self.loaded = load
        self.loadError = false
    }
    
    public final func setLoadError() {
        self.loaded = true
        self.loadError = true
    }
}
