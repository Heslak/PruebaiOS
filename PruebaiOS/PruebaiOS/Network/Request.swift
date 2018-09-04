//
//  Request.swift
//  PruebaiOS
//
//  Created by Sergio Acosta on 9/3/18.
//  Copyright © 2018 Sergio Acosta. All rights reserved.
//

import Foundation

class Request {
    
    static let sharedInstance = Request()
    var baseURL = URL(string: "https://chapin.vintapp.mx")!
    
    private init(){}
    //Building requests
    var successBuildingResponse: (_ success: [Building]) -> Void = { _ in }
    var successImageResponse: (_ success: Data?) -> Void = { _ in }
    
    //General requests
    var onFailureResponse: (_ error: String) -> Void = { _ in }
    
    typealias buildingsSuccessHandler = ([Building]) -> Void
    typealias imagesSuccessHandler = (Data?) -> Void
    typealias errorHandler = (_ error: String) -> Void
    
    func getFullPath(actionPath: String) -> URL {
        return baseURL.appendingPathComponent(actionPath)
    }
}
