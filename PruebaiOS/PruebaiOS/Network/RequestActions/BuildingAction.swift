//
//  BuildingAction.swift
//  PruebaiOS
//
//  Created by Sergio Acosta on 9/3/18.
//  Copyright © 2018 Sergio Acosta. All rights reserved.
//

import Foundation

class BuildingAction {
    
    var path: String?
    var method: String?
    
    init(path: String? = nil, method: String? = nil) {
        self.path = path
        self.method = method
    }
    
    func getEvents(){
        path = "projectsNoLogin"
        method = "GET"
    }
    
    func getImage(path: String){
        self.path = path
        method = "GET"
    }
}
