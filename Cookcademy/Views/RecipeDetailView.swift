//
//  RecipeDetailView.swift
//  Cookcademy
//
//  Created by Jeldo Arno Meppen on 04.05.23.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe
    
    let listBackgroundColor = AppColor.background
    let listTextColor = AppColor.foreground
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("Author: \(recipe.mainInformation.author)")
                        .padding()
                        .font(.subheadline)
                    Spacer()
                }
                HStack {
                    Text(recipe.mainInformation.description)
                        .padding()
                        .font(.subheadline)
                    Spacer()
                }
                List {
                    Section(header: Text("Ingredients")) {
                        ForEach(recipe.ingredients.indices, id: \.self) { index in
                            let ingredient = recipe.ingredients[index]
                            Text(ingredient.description)
                        }
                        .listRowBackground(listBackgroundColor)
                        .foregroundColor(listTextColor)
                    }
                    Section(header: Text("Steps")) {
                        ForEach(recipe.directions.indices, id: \.self) { index in
                            let direction = recipe.directions[index]
                            HStack {
                                Text("\(index + 1)")
                                    .bold()
                                Text("\(direction.isOptional ? "(Optional) " : "")"
                                                    + "\(direction.description)")
                            }
                            .listRowBackground(listBackgroundColor)
                            .foregroundColor(listTextColor)
                        }
                    }
                }
            }
        }
        .navigationTitle(recipe.mainInformation.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    @State static var recipe = Recipe.testRecipes[0]
    static var previews: some View {
        NavigationView {
            RecipeDetailView(recipe: recipe)            
        }
    }
}
