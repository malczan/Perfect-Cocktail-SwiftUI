//
//  IngredientsView.swift
//  PerfectCocktail
//
//  Created by Jakub Malczyk on 03/04/2022.
//

import SwiftUI

struct IngredientsView: View {
    
    @ObservedObject var ingredientsVM = IngredientsViewModel()
    
    
    var body: some View {
        
        ZStack{
            
            LinearGradient(colors: [Color("FirstColor"), Color("SecondColor")], startPoint: .bottomTrailing, endPoint: .topLeading)
                .ignoresSafeArea()
            
            List{
                ForEach(ingredientsVM.ingredients.drinks, id: \.self) { ingredients in
                    NavigationLink {
                        ListView(ingredient: ingredients.strIngredient1)
                    } label: {
                        Text(ingredients.strIngredient1)
                            .font(.system(size: 20))
                            .fontWeight(.light)
                    }
                }// ForEach
            }// List
            .background(LinearGradient(colors: [Color("FirstColor"), Color("SecondColor")], startPoint: .bottomTrailing, endPoint: .topLeading).ignoresSafeArea())
            .navigationTitle("Ingredients")
            .onAppear{
                UITableView.appearance().backgroundColor = .clear
                ingredientsVM.getIngredients()
            }
            
        }// ZStack
    }
}

struct IngredientsView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsView()
    }
}
