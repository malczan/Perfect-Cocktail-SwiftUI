//
//  IngredientsViewModel.swift
//  PerfectCocktail
//
//  Created by Jakub Malczyk on 03/04/2022.
//

import Foundation

class IngredientsViewModel : ObservableObject{
    
    var coctailService : CocktailService!
    @Published var ingredients = IngredientsModel(drinks: [])
    
    init(){
        self.coctailService = CocktailService()
    }
    
    
    func getIngredients(){
        self.coctailService.fetchIngredientsList { ingredients in
            if let ingredients = ingredients {
                DispatchQueue.main.async {
                    self.ingredients = ingredients
                }
            }
        }
    }
    
}
