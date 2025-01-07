//
//  ContentView.swift
//  JPApexPredators
//
//  Created by Wai Zin Linn on 1/6/25.
//

import SwiftUI

struct ContentView: View {
    
    let predators = Predators()
    
    @State var searchText = ""
    
    var filteredDino: [ApexPredator]{ //computed property
        // if no search term give all dino back else filter
        if searchText.isEmpty{
            return predators.apexPredators
        }else{
            return predators.apexPredators.filter{ //if true add to predator collection
                predator in
                predator.name.localizedCaseInsensitiveContains(searchText) //filter to have predators that have name on searchText
            }
        }
    }
    
    var body: some View {
        NavigationStack{
            List(filteredDino){ predator in
                NavigationLink{
                    // Navigate to details page of each dinosaur
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                }label: {
                    HStack{
                        // Dinosaur image
                        Image(predator.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .shadow(color: .white, radius: 1)
                        
                        VStack(alignment: .leading){
                            
                            // Dinosaur name
                            Text(predator.name)
                                .fontWeight(.bold)
                            
                            // Dinosaur type
                            Text(predator.type.rawValue.capitalized)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.horizontal, 13)
                                .padding(.vertical, 5)
                                .background(predator.type.background)
                                .clipShape(.capsule)
                        }
                    }
                }
            }
            .navigationTitle(Text("Apex predators"))
            .searchable(text: $searchText)  //automatically create search bar and bind to search text
            .autocorrectionDisabled()
            .animation(.default, value: searchText) // make sure there is some animation when filtering
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
