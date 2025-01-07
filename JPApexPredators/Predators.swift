//
//  Predators.swift
//  JPApexPredators
//
//  Created by Wai Zin Linn on 1/7/25.
//

import Foundation //have some decoding stuff

// Manipulate data to ready for view

class Predators{
    
    var apexPredators: [ApexPredator] = [] //need to change data
    
    init(){
        decodeApexPredatorData() //when predator is initialize all the data will get coded
    }
    
    func decodeApexPredatorData(){
        
        // if you can find this json file, store url in url property
        // if protect app from crashing if something go wrong
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json"){
            do{
                let data = try Data(contentsOf: url) // try to get data from json file and store at data property
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase //convert json snake case with _ to camel case
                apexPredators = try decoder.decode([ApexPredator].self, from: data) // decode json data
            }catch{
                print("Error decoding JSON Data \(error)")
            }
        }
    }
    
    
}
