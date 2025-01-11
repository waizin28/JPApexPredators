//
//  PredatorMap.swift
//  JPApexPredators
//
//  Created by Wai Zin Linn on 1/11/25.
//

import SwiftUI
import MapKit

struct PredatorMap: View {
    let predators = Predators()
    
    @State var position: MapCameraPosition
    @State var satellite = false
    
    var body: some View {
        Map(position: $position){ //will zoom into position of a specific dino
            ForEach(predators.apexPredators){ // will be able to see other dino at other location
                predator in
                Annotation(predator.name, coordinate: predator.location){
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .shadow(color: .white, radius: 3)
                        .scaleEffect(x: -1)
                }
            }
            
        }
        .mapStyle(satellite ? .imagery(elevation: .realistic) : .standard(elevation: .realistic))
        .overlay(alignment: .bottomTrailing){
            Button {
                satellite.toggle()
            }label: {
                Image(systemName: satellite ? "globe.americas.fill" : "globe.americas")
                    .font(.largeTitle)
                    .imageScale(.large)
                    .padding(3)
                    .background(.ultraThinMaterial)
                    .clipShape(.rect(cornerRadius: 7))
                    .shadow(radius: 3)
                    .padding()
            }
        }
    }
}

#Preview {
    PredatorMap(position: .camera(MapCamera(centerCoordinate:
                                            Predators().apexPredators[2].location,
                                            distance: 1000,
                                            heading: 250,
                                            pitch: 80))
    ) //heading and pitch direction camera is facing
    .preferredColorScheme(.dark)
}
