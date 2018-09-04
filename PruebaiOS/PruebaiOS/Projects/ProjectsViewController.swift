//
//  ProjectsViewController.swift
//  PruebaiOS
//
//  Created by Sergio Acosta on 9/3/18.
//  Copyright © 2018 Sergio Acosta. All rights reserved.
//

import UIKit

class ProjectsViewController: UIViewController {

    let projectsDataModel = ProjectsDataModel()
    var showInProgress: Bool = false
    var imagesProjects: [UIImage?] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableViewCell()
        projectsDataModel.delegate = self
        projectsDataModel.getProjects()

        // Do any additional setup after loading the view.
        setUpView()
    }
    

    func setUpView(){
        
        segmentedControl.backgroundColor = .clear
        segmentedControl.tintColor = .clear
        
        segmentedControl.setTitleTextAttributes([
            NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.light),
            NSAttributedStringKey.foregroundColor: UIColor(named: "gris_claro")!,
            ], for: .normal)
        
        
        segmentedControl.setTitleTextAttributes([
            NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.light),
            NSAttributedStringKey.foregroundColor: UIColor.white,
            ], for: .selected)
        
        segmentedControl.backgroundColor = UIColor(named: "negro")!
        
        let buttonBar = UIView()
        // This needs to be false since we are using auto layout constraints
        buttonBar.translatesAutoresizingMaskIntoConstraints = false
        buttonBar.backgroundColor = UIColor(named: "azul")
        view.addSubview(buttonBar)
        buttonBar.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor).isActive = true
        buttonBar.heightAnchor.constraint(equalToConstant: 5).isActive = true
        buttonBar.leftAnchor.constraint(equalTo: segmentedControl.leftAnchor).isActive = true
        buttonBar.widthAnchor.constraint(equalTo: segmentedControl.widthAnchor, multiplier: 1 / CGFloat(segmentedControl.numberOfSegments)).isActive = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpTableViewCell(){
        self.tableView.register(UINib(nibName: "BuildingTableViewCell", bundle: nil), forCellReuseIdentifier: "buildingCell")
    }

}

extension ProjectsViewController: ProjectsDataSource {
    func didFinishedLoadingBuildings() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func failedLoadingBuildings(message: String) {
        DispatchQueue.main.async {
            debugPrint(message)
        }
    }
}
