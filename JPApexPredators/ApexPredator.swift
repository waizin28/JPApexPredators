//
//  ApexPredator.swift
//  JPApexPredators
//
//  Created by Wai Zin Linn on 1/7/25.
//

struct ApexPredator: Decodable{ //Decodable protocol json to swift format
    let id: Int
    let name: String
    let type: String
    let latitude: Double
    let longitude: Double
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String
    
    struct MovieScene: Decodable{
        let id: Int
        let movie: String
        let sceneDescription: String
    }
}
