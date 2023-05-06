//
//  ModifyMainInformation.swift
//  Cookcademy
//
//  Created by Jeldo Arno Meppen on 06.05.23.
//

import SwiftUI

struct ModifyMainInformation: View {
    @Binding var mainInformation: MainInformation
    
    var body: some View {
        Form {
            TextField("Recipe Name", text: $mainInformation.name)
            
            TextField("Author", text: $mainInformation.author)
            Section(header: Text("Description")) {
                TextEditor(text: $mainInformation.description)
            }
            
            Picker(selection: $mainInformation.category, label: HStack {
                Text("Category")
                Spacer()
//                Text(mainInformation.category.rawValue)
            }) {
                ForEach(MainInformation.Category.allCases, id: \.self) { category in
                    Text(category.rawValue)
                }
            }
            .pickerStyle(.menu)
        }
    }
}

struct ModifyMainInformation_Previews: PreviewProvider {
    @State static var mainInformation = MainInformation(name: "", description: "", author: "", category: .breakfast)
    static var previews: some View {
        ModifyMainInformation(mainInformation: $mainInformation)
    }
}
