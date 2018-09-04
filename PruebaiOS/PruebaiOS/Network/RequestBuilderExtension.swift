//
//  RequestBuilderExtension.swift
//  PruebaiOS
//
//  Created by Sergio Acosta on 9/3/18.
//  Copyright © 2018 Sergio Acosta. All rights reserved.
//

import Foundation

extension Request {
    
    func getURLRequest(_ actionData: BuildingAction) -> URLRequest {
        let url = getFullPath(actionPath: actionData.path!)
        var request =  URLRequest(url: url)
        request.httpMethod = actionData.method
        //print(String(data: jsonData!, encoding: .utf8))
        
        return request
        
    }
    
    func makeRequest(onAction: BuildingAction, onSuccess: @escaping buildingsSuccessHandler, onFailure: @escaping errorHandler) {
        successBuildingResponse = onSuccess
        onFailureResponse = onFailure

        let request = getURLRequest(onAction)
        URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
            if let error = error {
                onFailure(error.localizedDescription)
            }
            if let httpResponse = response as? HTTPURLResponse, let data = data {
                switch httpResponse.statusCode {
                case 200:
                    self?.parseProject(data)
                case 401:
                    onFailure("Error 401")
                default:
                    onFailure("Error default")
                }
            } else {
                onFailure("error al parsear el data")
            }
        }.resume()
        
    }
    
    func getImage(onAction: BuildingAction, onSuccess: @escaping imagesSuccessHandler, onFailure: @escaping errorHandler) {
        successImageResponse = onSuccess
        onFailureResponse = onFailure
        let url = getFullPath(actionPath: onAction.path!)
        let data = try? Data(contentsOf: url)
        self.getImage(data)
    }
    
    func parseProject(_ data: Data) {
        do {
            let json = try JSONDecoder().decode([Building].self, from: data)
            print(json)
            successBuildingResponse(json)
        } catch let err {
            onFailureResponse("Error al parsear datos \(err)")
        }
    }
    
    func getImage(_ data: Data?){
        successImageResponse(data)
    }
    
}
