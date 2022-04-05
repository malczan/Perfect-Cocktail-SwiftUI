//
//  CoctailViewModel.swift
//  PerfectCoctail
//
//  Created by Jakub Malczyk on 02/04/2022.
//

import Foundation

class CocktailViewModel : ObservableObject{
    
    var service : CocktailService!
    
    var cocktailModel = CocktailModel(drinks: [])
    
    @Published var cocktail : Cocktail
    @Published var loading = false
    
    
    init(){
        self.service = CocktailService()
        self.cocktail = Cocktail(tittle: "", alcoholic: false, instruction: "", ingredients: [], photo: "")
    }
    
    func getExact(id: String){
        self.service.fetchExactCocktails(id: id) { exact in
            if let exact = exact {
                DispatchQueue.main.async {
                    self.cocktailModel = exact
                    self.update()
                    print(exact.drinks.count)
                }
            }
        }
    }
    
    
    func getRandom(){
        self.service.fetchRandomCocktail { random in
            if let random = random {
                DispatchQueue.main.async {
                    self.cocktailModel = random
                    self.update()
                }
            }
        }
    }
    
    func update(){
        
        cocktail.tittle = cocktailModel.drinks[0].strDrink
        cocktail.alcoholic = cocktailModel.drinks[0].strAlcoholic == "Alcoholic" ? true : false
        cocktail.instruction = cocktailModel.drinks[0].strInstructions
        
        
        cocktail.ingredients.removeAll()
        
        fullFIllIngredients(ingredient: cocktailModel.drinks[0].strIngredient1, measure: cocktailModel.drinks[0].strMeasure1)
        fullFIllIngredients(ingredient: cocktailModel.drinks[0].strIngredient2, measure: cocktailModel.drinks[0].strMeasure2)
        fullFIllIngredients(ingredient: cocktailModel.drinks[0].strIngredient3, measure: cocktailModel.drinks[0].strMeasure3)
        fullFIllIngredients(ingredient: cocktailModel.drinks[0].strIngredient4, measure: cocktailModel.drinks[0].strMeasure4)
        fullFIllIngredients(ingredient: cocktailModel.drinks[0].strIngredient5, measure: cocktailModel.drinks[0].strMeasure5)
        fullFIllIngredients(ingredient: cocktailModel.drinks[0].strIngredient6, measure: cocktailModel.drinks[0].strMeasure6)
        fullFIllIngredients(ingredient: cocktailModel.drinks[0].strIngredient7, measure: cocktailModel.drinks[0].strMeasure7)
        fullFIllIngredients(ingredient: cocktailModel.drinks[0].strIngredient8, measure: cocktailModel.drinks[0].strMeasure8)
        fullFIllIngredients(ingredient: cocktailModel.drinks[0].strIngredient9, measure: cocktailModel.drinks[0].strMeasure9)
        fullFIllIngredients(ingredient: cocktailModel.drinks[0].strIngredient10, measure: cocktailModel.drinks[0].strMeasure10)
        fullFIllIngredients(ingredient: cocktailModel.drinks[0].strIngredient11, measure: cocktailModel.drinks[0].strMeasure11)
        fullFIllIngredients(ingredient: cocktailModel.drinks[0].strIngredient12, measure: cocktailModel.drinks[0].strMeasure12)
        fullFIllIngredients(ingredient: cocktailModel.drinks[0].strIngredient13, measure: cocktailModel.drinks[0].strMeasure13)
        fullFIllIngredients(ingredient: cocktailModel.drinks[0].strIngredient14, measure: cocktailModel.drinks[0].strMeasure14)
        fullFIllIngredients(ingredient: cocktailModel.drinks[0].strIngredient15, measure: cocktailModel.drinks[0].strMeasure15)
        
        cocktail.photo = cocktailModel.drinks[0].strDrinkThumb
    }
    
    
    
    func fullFIllIngredients(ingredient : String?, measure : String?){
        if let ingredient = ingredient, let measure = measure{
            cocktail.ingredients.append("\(ingredient) \(measure)")
        }
    }
    
    
}
