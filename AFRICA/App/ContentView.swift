//
//  ContentView.swift
//  AFRICA
//
//  Created by Ekansh  on 04/12/23.
//

import SwiftUI

struct ContentView: View {
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    let gridLayout:  [GridItem] = Array(repeating: GridItem(.flexible()),count: 2)
    @State private var isGridViewActive: Bool = false
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    @State private var gridlayout: [GridItem] = [ GridItem(.flexible()) ]
    
    func gridSwitch(){
        gridlayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        print("Grid Number: \(gridColumn)")
        
        switch gridColumn {
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }
    var body: some View {
        NavigationView {
          Group {
            if !isGridViewActive {
              List {
                CoverImageView()
                  .frame(height: 300)
                  .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
                ForEach(animals) { animal in
                  NavigationLink(destination: AnimalDetailView(animal: animal)) {
                    AnimalListItemView(animal: animal)
                  } //: LINK
                } //: LOOP
                CreditsView()
                      .modifier(CenterModifier())
              } //: LIST
            } else {
              ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                  ForEach(animals) { animal in
                    NavigationLink(destination: AnimalDetailView(animal: animal)) {
                      AnimalGridItemView(animal: animal)
                    } //: LINK
                  } //: LOOP
                } //: GRID
                .padding(10)
                .animation(.easeIn)
              } //: SCROLL
            } //: CONDITION
          } //: GROUP
          .navigationTitle("Africa")
          .toolbar{
              ToolbarItem(placement: .navigationBarTrailing){
                  HStack(spacing: 16){
                      Button(action:{
                          print("list view activated")
                          isGridViewActive = false
                          haptics.impactOccurred()
                      }) {
                          Image(systemName: "square.fill.text.grid.1x2")
                              .font(.title2)
                              .foregroundColor(isGridViewActive ? .primary : .accentColor)
                          
                          
                          Button(action: {
                              print("grid view is activated")
                              isGridViewActive = true
                              haptics.impactOccurred()
                              gridSwitch()
                          }) {
                              Image(systemName: toolbarIcon)
                                  .font(.title2)
                                  .foregroundColor(isGridViewActive ? .accentColor : .primary)
                          }
                      }
                  }
              }
          }
        }

        
        
        
    }
}

#Preview {
    ContentView()
}



