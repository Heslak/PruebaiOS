//
//  ProjectDetailViewController.swift
//  PruebaiOS
//
//  Created by Sergio Acosta on 9/3/18.
//  Copyright © 2018 Sergio Acosta. All rights reserved.
//

import UIKit
import MapKit

class ProjectDetailViewController: UIViewController {

    @IBOutlet weak var buildingLabel: UILabel!
    @IBOutlet weak var buildingImage: UIImageView!
    @IBOutlet weak var licenseLabel: UILabel!
    @IBOutlet weak var builderLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var benefitsLabel: UILabel!
    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var porcentLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var mapView: MKMapView!
    
    var building: Building!
    let months = ["Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"]
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
        
        descriptionView.layer.cornerRadius = 15
        descriptionView.layer.masksToBounds = true
        
        buildingLabel.text = "   \(building.name)"
        if let data = building.image {
            buildingImage.image = UIImage(data: data)
        }
        licenseLabel.text = "Licencia: \(building.license)"
        builderLabel.text = "Constructora: \(building.builder)"
        descriptionLabel.text = " ∙ \(building.description.joined(separator: "\n ∙ "))"
        benefitsLabel.text = " ∙ \(building.services.joined(separator: "\n ∙ "))"
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let calendar: Calendar = Calendar.init(identifier: Calendar.Identifier.gregorian)
        if let date = dateFormatterGet.date(from: building.limitDate) {
            let year = calendar.component(Calendar.Component.year, from: date)
            let month = calendar.component(Calendar.Component.month, from: date)
            let day = calendar.component(Calendar.Component.day, from: date)
            dateLabel.text = "\(day) de \(months[month-1]) del \(year)"
        }
        
        porcentLabel.text = "\(building.progress)%"
        
        let latitude = Double(building.location.latitude) ?? 0.0
        let longitude = Double(building.location.longitude) ?? 0.0
        let zoom = Double(building.location.zoom) ?? 0.0
    
        
        
        mapView.camera = MKMapCamera(lookingAtCenter: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), fromDistance: zoom, pitch: 0, heading: 0)
        
        //locationLabel.text = "Ubicacion \(building.)"

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
