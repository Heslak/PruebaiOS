//
//  ProjectDetailViewController.swift
//  PruebaiOS
//
//  Created by Sergio Acosta on 9/3/18.
//  Copyright © 2018 Sergio Acosta. All rights reserved.
//

import UIKit

class ProjectDetailViewController: UIViewController {

    @IBOutlet weak var buildingLabel: UILabel!
    var building: Building!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupView(){
        buildingLabel.text = "   \(building.name)"
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
