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
    var showInProgress: Bool = true
    var imagesProjects: [UIImage?] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var labelProjectsStatus: UILabel!
    let buttonBar = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableViewCell()
        projectsDataModel.delegate = self
        projectsDataModel.getProjects()

        // Do any additional setup after loading the view.
        setUpView()
    }
    
    @IBAction func changeView(_ sender: UISegmentedControl) {
       
        if self.segmentedControl.selectedSegmentIndex == 1 {
            self.showInProgress = false
            self.labelProjectsStatus.text = "   Proyectos Finalizados"
        }else{
            self.showInProgress = true
            self.labelProjectsStatus.text = "   Proyectos en Proceso"
        }
        
        UIView.transition(with: tableView, duration: 0.35, options: .transitionCrossDissolve, animations: {
            self.tableView.reloadData()
        }, completion: { _ in
            UIView.animate(withDuration: 0.3, animations: {
                self.buttonBar.frame.origin.x = (self.segmentedControl.frame.width / CGFloat(self.segmentedControl.numberOfSegments)) * CGFloat(self.segmentedControl.selectedSegmentIndex)
            })
        })
        
    }
    
    func setUpView(){
        
        segmentedControl.backgroundColor = .clear
        segmentedControl.tintColor = .clear
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.setTitleTextAttributes([
            NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.light),
            NSAttributedStringKey.foregroundColor: UIColor(named: "gris_claro")!,
            ], for: .normal)
        
        
        segmentedControl.setTitleTextAttributes([
            NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.light),
            NSAttributedStringKey.foregroundColor: UIColor.white,
            ], for: .selected)
        
        segmentedControl.backgroundColor = UIColor(named: "negro")!
        
        // This needs to be false since we are using auto layout constraints
        buttonBar.translatesAutoresizingMaskIntoConstraints = false
        buttonBar.backgroundColor = UIColor(named: "azul")
        view.addSubview(buttonBar)
        
        buttonBar.frame.origin.x = 0
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
