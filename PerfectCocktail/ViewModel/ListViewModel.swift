//
//  ListViewModel.swift
//  PerfectCoctail
//
//  Created by Jakub Malczyk on 03/04/2022.
//

import Foundation

class ListViewModel : ObservableObject{
    
    var coctailService : CocktailService!
    
    
    @Published var list = AlcoholicListModel(drinks: [])
    
    
    init(){
        self.coctailService = CocktailService()
    }
    
    func getList(alcholic : Bool){
        self.coctailService.fetchAlcoholicCocktails(alcoholic: alcholic ) { list in
            if let list = list {
                DispatchQueue.main.async {
                    self.list = list
                    
                }
            }
        }
    }
    
    func getListWithIngredients(ingredient : String){
        self.coctailService.fetchIngredientsCocktails(ingredient: ingredient) { list in
            if let list = list{
                DispatchQueue.main.async {
                    self.list = list
                }
            }
        }
    }
    
}
