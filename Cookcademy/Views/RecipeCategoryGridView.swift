//
//  RecipeCategoryGridView.swift
//  Cookcademy
//
//  Created by Jeldo Arno Meppen on 05.05.23.
//

import SwiftUI

struct RecipeCategoryGridView: View {
    @StateObject private var recipeData = RecipeData()
    let colums = [GridItem(), GridItem()]
    
    var body: some View {
        NavigationView {
            LazyVGrid(columns: colums, content: {
                ForEach(MainInformation.Category.allCases, id: \.self) { category in
                    NavigationLink(destination: RecipeListView(category: category)
                        .environmentObject(recipeData), label: {
                        CategoryView(category: category)
                    })
                }
            })
            .padding()
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
                .cornerRadius(10)
                .shadow(radius: 3)
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
