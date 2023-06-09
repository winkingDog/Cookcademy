//
//  RecipeListView.swift
//  Cookcademy
//
//  Created by Jeldo Arno Meppen on 04.05.23.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject private var recipeData: RecipeData
    let category: MainInformation.Category
    
    let listBackgroundColor = AppColor.background
    let listTextColor = AppColor.foreground
    
    var body: some View {
        List {
            ForEach(recipes) { recipe in
                NavigationLink(recipe.mainInformation.name, destination: RecipeDetailView(recipe: recipe))
            }
            .listRowBackground(listBackgroundColor)
            .foregroundColor(listTextColor)
        }
        .navigationTitle(navigationTitle)
    }
}

extension RecipeListView {
    
    private var recipes: [Recipe] {
        return recipeData.recipes(for: category)
    }
    
    private var navigationTitle: String {
        return "\(category.rawValue) Recipes"
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RecipeListView(category: .breakfast)
                .environmentObject(RecipeData())
        }
    }
}
