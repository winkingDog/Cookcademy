//
//  RecipeCategoryGridView.swift
//  Cookcademy
//
//  Created by Jeldo Arno Meppen on 05.05.23.
//

import SwiftUI

struct RecipeCategoryGridView: View {
    private var recipeData = RecipeData()
    let colums = [GridItem(), GridItem()]
    
    var body: some View {
        NavigationView {
            LazyVGrid(columns: colums, content: {
                ForEach(MainInformation.Category.allCases, id: \.self) { category in
                    CategoryView(category: category)
                }
            })
            .navigationTitle("Categories")
        }
    }
}

struct CategoryView: View {
    let category: MainInformation.Category
    
    var body: some View {
        ZStack {
            Image(category.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0.8)
            Text(category.rawValue)
                .font(.title)
                .bold()
                .foregroundColor(.white)
                .shadow(color: .black, radius: 5, x: 0, y: 0)
        }
    }
}

struct RecipeCategoryGridView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCategoryGridView()
    }
}
