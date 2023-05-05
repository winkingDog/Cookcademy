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
    
    @State private var isPresenting = false
    @State private var newRecipe = Recipe()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(recipes) { recipe in
                    NavigationLink(recipe.mainInformation.name, destination: RecipeDetailView(recipe: recipe))
                }
            }
            .listRowBackground(listBackgroundColor)
            .foregroundColor(listTextColor)
            .navigationTitle(navigationTitle)
            .toolbar(content: {ToolbarItem {
                Button (action: {isPresenting = true}) {
                    Image(systemName: "plus")
                }
            }})
            .sheet(isPresented: $isPresenting, content: {
                NavigationView {
                    ModifyRecipeView(recipe: $newRecipe)
                        .navigationTitle("Add a new recipe")
                        .toolbar(content: {
                            ToolbarItem(placement: .confirmationAction, content: {
                                Button(action: {
                                    recipeData.recipes.append(newRecipe)
                                    isPresenting = false
                                }, label: {Text("Add")})
                            })
                            ToolbarItem(placement: .cancellationAction, content: {
                                Button(action: {isPresenting = false}, label: {Text("Cancel")})
                            })
                        })
                }
            })
        }
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
