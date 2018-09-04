//
//  Protocols.swift
//  PruebaiOS
//
//  Created by Sergio Acosta on 9/3/18.
//  Copyright © 2018 Sergio Acosta. All rights reserved.
//

import Foundation

protocol ProjectsDataSource: class {
    func didFinishedLoadingBuildings()
    func failedLoadingBuildings(message: String)
}
