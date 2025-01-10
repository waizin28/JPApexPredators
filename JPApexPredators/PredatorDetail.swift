//
//  PredatorDetail.swift
//  JPApexPredators
//
//  Created by Wai Zin Linn on 1/9/25.
//

import SwiftUI

struct PredatorDetail: View {
    
    let predator: ApexPredator
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                ZStack(alignment: .bottomTrailing) { //move image ot right
                    // Background Image
                    // image name already match the type
                    Image(predator.type.rawValue)
                        .resizable()
                        .scaledToFit()
                    
                    // Dinosaur Image
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width/1.5, height: geo.size.height/3.7) // reszing based on device size
                        .scaleEffect(x: -1) //flip the image horizontally
                        .shadow(color: .black, radius: 7) //makeimage 3d like
                        .offset(y: 20) // move image down
                    
                }
                
                VStack(alignment: .leading){
                    // Name of Dino
                    Text(predator.name)
                        .font(.largeTitle)
                    
                    // Current Location
                    
                    // List of movies dino appear in
                    Text("Appear In:")
                        .font(.title3)
                    
                    ForEach(predator.movies, id: \.self){
                        movie in
                        Text("•" + movie)
                            .font(.subheadline)
                    }
                    
                    // Movie moment
                    Text("Movie Moments")
                        .font(.title)
                        .padding(.top, 15)
                    
                    ForEach(predator.movieScenes){ scene in
                        Text(scene.movie)
                            .font(.title2)
                            .padding(.vertical, 1)
                        
                        Text(scene.sceneDescription)
                            .padding(.bottom, 15)
                    }
                    
                    // Link to webpage
                    Text("Read More:")
                        .font(.caption)
                    
                    Link(predator.link, destination: URL(string: predator.link)!)
                        .font(.caption)
                        .foregroundStyle(.blue)
                    
                }.padding().padding(.bottom).frame(width: geo.size.width, alignment: .leading) // to add alignment to the vstack itself, otherwise will be at center
            }
        }.ignoresSafeArea()
    }
}

#Preview {
    PredatorDetail(predator: Predators().apexPredators[2])
//        .preferredColorScheme(.dark)
}
