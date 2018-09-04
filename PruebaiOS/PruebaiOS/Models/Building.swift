//
//  Building.swift
//  PruebaiOS
//
//  Created by Sergio Acosta on 9/3/18.
//  Copyright © 2018 Sergio Acosta. All rights reserved.
//

import UIKit


struct Building: Decodable {
    let id:String
    let description:[String]
    let license:String
    let builder: String
    let services: [String]
    let limitDate: String
    let progress: Int
    let area: Int
    let status: String
    //let location:
    let price: Int
    let gallery: [String]
    let name: String
    var image: Data?
    

    enum CodingKeys: String,CodingKey{
        case id = "_id"
        case description,license,builder,services,limitDate,progress,area,price,gallery,status,name,image
    }
}
