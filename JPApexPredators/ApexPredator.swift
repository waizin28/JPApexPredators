//
//  ApexPredator.swift
//  JPApexPredators
//
//  Created by Wai Zin Linn on 1/7/25.
//
import SwiftUI

struct ApexPredator: Decodable, Identifiable { //Decodable protocol json to swift format
    let id: Int
    let name: String
    let type: APType
    let latitude: Double
    let longitude: Double
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String
    
    var image: String {
        //taking advantage of the fact that image name is similar to dinosaur name
        name.lowercased().replacingOccurrences(of: " ", with: "")
    }
    
    struct MovieScene: Decodable {
        let id: Int
        let movie: String
        let sceneDescription: String
    }
    
    enum APType: String, Decodable { // raw value to be string
        case land // "land"
        case air // "air"
        case sea // "sea"
        
        var background: Color {
            switch self {
            case .land:
                .brown
            case .air:
                .teal
            case .sea:
                .blue
            }
        }
    }
}
