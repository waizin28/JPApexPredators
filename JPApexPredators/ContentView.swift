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
    @State var isAlphabetical = false
    
    var filteredDino: [ApexPredator]{ //computed property
        predators.sort(by: isAlphabetical)
        // if no search term give all dino back else filter
        return predators.search(for: searchText)
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
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button{
                        withAnimation{
                            isAlphabetical.toggle()
                        }
                    }label: {
                        // we are showing what we can sort by
                        Image(systemName: isAlphabetical ? "film" : "textformat")
                            .symbolEffect(.bounce, value: isAlphabetical)
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing){
                    Menu{
                        
                    }label:{
                        Image(systemName: "slider.horizontal.3")
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
