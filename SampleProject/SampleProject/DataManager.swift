//
//  DataManager.swift
//  SampleProject
//
//  Created by chanakkya mati on 9/1/17.
//  Copyright © 2017 chanakya. All rights reserved.
//

import Foundation


enum Result {
    case success([Rocket])
    case failure(Error)
}

enum RocketDataError:Error{
    case invalidData
}

class Rocket {
    
    let flightNumber:Int
    let launchdate:String
    let details:String?
    
    init(flightNumber:Int,launchdate:String,details:String?){
        self.flightNumber = flightNumber
        self.launchdate = launchdate
        self.details = details
    }
    
}


class DataManager {
    let url = URL(string: "http://api.spacexdata.com/v1/launches")!
    
    let session:URLSession = {
        let configuration = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: configuration)
        return session
    }()
    
    func fetchRocketData(completionHandler:@escaping (Result)->Void){
        session.dataTask(with: url) { (data, response, error) in
            guard let jsonData = data else {
                OperationQueue.main.addOperation {
                    completionHandler(Result.failure(error!))
                }
                
                return
            }
            let result = self.parseJson(jsonData: jsonData)
            OperationQueue.main.addOperation {
             completionHandler(result)
            }
        }.resume()
    }
    
    func parseJson(jsonData:Data)->Result{
        guard let toplevelObject = try! JSONSerialization.jsonObject(with: jsonData, options: []) as? [Dictionary<String,Any>] else {
            return (Result.failure(RocketDataError.invalidData))
         
        }
        var rocketDataArray = [Rocket]()
        for dict in toplevelObject{
            guard let flightNumber = dict["flight_number"] as? Int,
                let launchDate = dict["launch_date_utc"] as? String else{
                    continue
            }
            let details = dict["details"] as? String
            
           rocketDataArray.append(Rocket(flightNumber: flightNumber, launchdate: launchDate, details: details))
        }
        return Result.success(rocketDataArray)
    }
}
