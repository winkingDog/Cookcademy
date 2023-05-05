//
//  RecipeData.swift
//  Cookcademy
//
//  Created by Jeldo Arno Meppen on 04.05.23.
//

import Foundation

class RecipeData: ObservableObject {
    @Published var recipes = Recipe.testRecipes
    
    func recipes(for category: MainInformation.Category) -> [Recipe] {
        var filteredRecipes = [Recipe]()
        for recipe in self.recipes {
            if recipe.mainInformation.category == category {
                filteredRecipes.append(recipe)
            }
        }
        return filteredRecipes
    }
    
    func add(_ recipe: Recipe) -> Void {
        if recipe.isValid {
            recipes.append(recipe)
        }
    }
}
