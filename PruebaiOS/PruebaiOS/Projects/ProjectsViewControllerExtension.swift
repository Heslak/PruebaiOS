//
//  ProjectsViewControllerExtension.swift
//  PruebaiOS
//
//  Created by Sergio Acosta on 9/3/18.
//  Copyright © 2018 Sergio Acosta. All rights reserved.
//

import UIKit

extension ProjectsViewController:  UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if showInProgress {
            return ActiveSession.sharedInstance.inProgress.count
        } else {
            return ActiveSession.sharedInstance.Finished.count
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "buildingCell", for: indexPath) as! BuildingTableViewCell
        var building: Building
        if showInProgress {
            building = ActiveSession.sharedInstance.inProgress[indexPath.row]
        } else {
            building = ActiveSession.sharedInstance.Finished[indexPath.row]
        }

        cell.projectBuilding.text = building.name
        cell.projectYear.text = "Año de finalización: \(building.limitDate)"
        cell.projectArea.text = "Área: \(building.area)"
        cell.projectPrice.text = "Cotización: \(building.price)"
        
        if let data = building.image {
            cell.projectImage.image = UIImage(data: data)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detail", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail"{
            let destinationVC = segue.destination as! ProjectDetailViewController
            guard let index = sender as? IndexPath else { return }
            if showInProgress {
                destinationVC.building = ActiveSession.sharedInstance.inProgress[index.row]
            } else {
                destinationVC.building = ActiveSession.sharedInstance.Finished[index.row]
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}
