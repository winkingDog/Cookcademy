//
//  ModifyRecipeView.swift
//  Cookcademy
//
//  Created by Jeldo Arno Meppen on 05.05.23.
//

import SwiftUI

struct ModifyRecipeView: View {
    
    @Binding var recipe: Recipe
    @State private var selection = Selection.main
    enum Selection: String, CaseIterable {
        case main = "Main Info"
        case ingredients = "Ingredients"
        case directions = "Directions"
    }
    
    
    var body: some View {
        
        VStack {
            Picker("View", selection: $selection) {
                ForEach(Selection.allCases, id: \.self) { view in
                    Text(view.rawValue)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            
            switch selection {
            case .main:
                ModifyMainInformation(mainInformation: $recipe.mainInformation)
            case .ingredients:
                Text("Ingredients")
            case .directions:
                Text("Directions")
            }
            
            Spacer()
        }
    }
}

struct ModifyRecipeView_Previews: PreviewProvider {
    @State static var recipe = Recipe()
    static var previews: some View {
        ModifyRecipeView(recipe: $recipe)
    }
}
