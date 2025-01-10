//
//  ApexPredator.swift
//  JPApexPredators
//
//  Created by Wai Zin Linn on 1/7/25.
//
import SwiftUI
import MapKit

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
    
    var location: CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    struct MovieScene: Decodable, Identifiable {
        let id: Int
        let movie: String
        let sceneDescription: String
    }
}

enum APType: String, Decodable, CaseIterable, Identifiable {
    var id: APType{
        self
    }
    // raw value to be string
    
    case all
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
        case .all:
                .black
        }
    }
    
    var icon: String{
        switch self {
        case .land:
                "leaf.fill"
        case .air:
                "wind"
        case .sea:
                "drop.fill"
        case .all:
                "square.stack.3d.up.fill"
        }
    }
}
