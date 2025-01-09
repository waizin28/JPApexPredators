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
                        .shadow(color: .black, radius: 7) //make image 3d like
                        .offset(y: 20) // move image down
                    
                }
                
                // Name of Dino
                
                // Current Location
                
                // List of movies dino appear in
                
                // Movie moment
                
                // Link to webpage
            }
        }.ignoresSafeArea()
    }
}

#Preview {
    PredatorDetail(predator: Predators().apexPredators[2])
//        .preferredColorScheme(.dark)
}
