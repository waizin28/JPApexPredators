//
//  PredatorDetail.swift
//  JPApexPredators
//
//  Created by Wai Zin Linn on 1/9/25.
//

import SwiftUI
import MapKit

struct PredatorDetail: View {
    
    let predator: ApexPredator
    @State var position: MapCameraPosition
    @Namespace var namespace // a place to bundle group of animation/transition together
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                ZStack(alignment: .bottomTrailing) { //move image ot right
                    // Background Image
                    // image name already match the type
                    Image(predator.type.rawValue)
                        .resizable()
                        .scaledToFit()
                        .overlay{
                            LinearGradient(stops: [
                                Gradient.Stop(color: .clear, location: 0.8),
                                Gradient.Stop(color: .black, location: 1)],
                                           startPoint: .top, endPoint: .bottom)
                        }
                    
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
                    NavigationLink{
                        // Showing Map View of corresponding dinosaur
                        PredatorMap(position: .camera(
                            MapCamera(centerCoordinate:
                                predator.location,
                                distance: 1000,
                                heading: 250,
                                pitch: 80))
                        ).navigationTransition(.zoom(
                            sourceID: 1, //what specific animation within namespace
                            in: namespace))
                    }label: {
                        // Current Location
                        Map(position: $position){
                            Annotation(predator.name,
                                coordinate: predator.location){
                                Image(systemName: "mappin.and.ellipse")
                                    .font(.largeTitle)
                                    .imageScale(.large)
                                    .symbolEffect(.pulse)
                            }
                            .annotationTitles(.hidden) //hide title
                        }
                        .frame(height: 125)
                        .overlay(alignment: .trailing){
                            Image(systemName: "greaterthan")
                                .imageScale(.large)
                                .font(.title3)
                                .padding(.trailing, 15)
                        }
                        .overlay(alignment: .topLeading){
                            Text("Current Location")
                                .padding([.leading, .bottom], 5)
                                .padding(.trailing, 8)
                                .background(.black.opacity(0.33))
                                .clipShape(.rect(bottomTrailingRadius: 15))
                        }
                        .clipShape(.rect(cornerRadius: 15))
                    }
                    .matchedTransitionSource(id: 1, in: namespace) // for transitioning to map view
                    
                    // List of movies dino appear in
                    Text("Appear In:")
                        .font(.title3)
                        .padding(.top, 15)
                    
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
        }
        .ignoresSafeArea()
        .toolbarBackground(.automatic)
    }
}

#Preview {
    let predator = Predators().apexPredators[2]
    
    NavigationStack{
        
        PredatorDetail(predator: predator, position: .camera(
            MapCamera(
                centerCoordinate: predator.location,
                distance: 30000
            )))
        .preferredColorScheme(.dark)
    }// let this preview know that there is navigation stack at upper level
}
