//
//  ProjectsDataModel.swift
//  PruebaiOS
//
//  Created by Sergio Acosta on 9/3/18.
//  Copyright © 2018 Sergio Acosta. All rights reserved.
//

import Foundation


class ProjectsDataModel{
    
    weak var delegate : ProjectsDataSource?
    
    func getProjects(){
        let action = BuildingAction()
        action.getEvents()
        Request.sharedInstance.makeRequest(onAction: action, onSuccess: {buildings in
            
            ActiveSession.sharedInstance.inProgress = []
            ActiveSession.sharedInstance.Finished = []
            for build in buildings{
                var buildWithImage = build
                if let path = build.gallery.first{
                    let action = BuildingAction()
                    action.getImage(path: path)
                    Request.sharedInstance.getImage(onAction: action, onSuccess: { data in
                        guard let data = data else {
                            return
                        }
                        buildWithImage.image = data
                    }, onFailure: { _ in
                        return
                    })
                }
                if build.status == "Process"{
                    ActiveSession.sharedInstance.inProgress.append(buildWithImage)
                }else{
                    ActiveSession.sharedInstance.Finished.append(buildWithImage)
                }
            }
            self.delegate?.didFinishedLoadingBuildings()
        }, onFailure: { message in
            self.delegate?.failedLoadingBuildings(message: message)
        })
    }
}
