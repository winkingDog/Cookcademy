//
//  RecipeListView.swift
//  Cookcademy
//
//  Created by Jeldo Arno Meppen on 04.05.23.
//

import SwiftUI

struct RecipeListView: View {
    
    @StateObject var recipeData = RecipeData()
    
    var body: some View {
        List {
            ForEach(recipes) { recipe in
                Text(recipe.mainInformation.name)
            }
        }
        .navigationTitle(navigationTitle)
    }
}

extension RecipeListView {
    var recipes: [Recipe] {
        return recipeData.recipes
    }
    
    var navigationTitle: String {
        return "All Recipes"
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RecipeListView()
        }
    }
}
