//
//  RecipeData.swift
//  Cookcademy
//
//  Created by Jeldo Arno Meppen on 04.05.23.
//

import Foundation

class RecipeData: ObservableObject {
    @Published var recipes = Recipe.testRecipes
}
