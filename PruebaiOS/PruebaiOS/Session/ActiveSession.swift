//
//  ActiveSession.swift
//  PruebaiOS
//
//  Created by Sergio Acosta on 9/3/18.
//  Copyright © 2018 Sergio Acosta. All rights reserved.
//

import Foundation

class ActiveSession {
    
    static let sharedInstance = ActiveSession()
    private init(){}
    
    var inProgress: [Building] = []
    var Finished: [Building] = []
    
}
