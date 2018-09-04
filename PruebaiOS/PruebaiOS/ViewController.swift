//
//  ViewController.swift
//  PruebaiOS
//
//  Created by Sergio Acosta on 9/3/18.
//  Copyright © 2018 Sergio Acosta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var projectsView: UIView!
    @IBOutlet weak var investorsView: UIView!
    @IBOutlet weak var projectsButton: UIButton!
    @IBOutlet weak var inverstorsButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        
        
       
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setupView(){
        
        projectsView.layer.borderWidth = 2
        projectsView.layer.borderColor = UIColor(named: "gris_obscuro")?.cgColor
        projectsView.layer.cornerRadius = 15
        projectsView.layer.masksToBounds = true
        
        investorsView.layer.borderWidth = 2
        investorsView.layer.borderColor = UIColor(named: "gris_obscuro")?.cgColor
        investorsView.layer.cornerRadius = 15
        investorsView.layer.masksToBounds = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

