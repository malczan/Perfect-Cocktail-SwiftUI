//
//  CocktailService.swift
//  PerfectCocktail
//
//  Created by Jakub Malczyk on 02/04/2022.
//

import Foundation


class CocktailService{
    
    
    func fetchRandomCocktail(completion: @escaping (CocktailModel?) -> ()){
        
        guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/random.php") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else{
                return
            }
            
            let coctail = try? JSONDecoder().decode(CocktailModel.self, from: data)
            if let coctail = coctail{
                let coctail = coctail
                completion(coctail)
            } else {
                completion(nil)
            }
        }
        .resume()
    }
    
    func fetchExactCocktails(id : String, completion: @escaping (CocktailModel?) -> ()){
        
        guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=\(id)") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else{
                return
            }
            
            let coctail = try? JSONDecoder().decode(CocktailModel.self, from: data)
            if let coctail = coctail{
                let coctail = coctail
                completion(coctail)
            } else {
                completion(nil)
            }
        }
        .resume()
    }
    
    //  MARK: - Lists
    
    func fetchAlcoholicCocktails(alcoholic : Bool, completion: @escaping(AlcoholicListModel?) -> ()){
        
        let category = alcoholic ? "Alcoholic" : "Non_Alcoholic"
        
        guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=\(category)") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else{
                return
            }
            
            let list = try? JSONDecoder().decode(AlcoholicListModel.self, from: data)
            if let list = list{
                let list = list
                completion(list)
            } else {
                completion(nil)
            }
        }
        .resume()
    }
    
    
    func fetchIngredientsList(completion: @escaping(IngredientsModel?) -> ()){
        
        guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else{
                return
            }
            
            let ingredients = try? JSONDecoder().decode(IngredientsModel.self, from: data)
            if let ingredients = ingredients{
                let ingredients = ingredients
                completion(ingredients)
            } else {
                completion(nil)
            }
        }
        .resume()
    }
    
    
    func fetchIngredientsCocktails(ingredient : String, completion: @escaping(AlcoholicListModel?) -> ()){
        
        
        guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=\(ingredient)") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else{
                return
            }
            
            let list = try? JSONDecoder().decode(AlcoholicListModel.self, from: data)
            if let list = list{
                let list = list
                completion(list)
            } else {
                completion(nil)
            }
        }
        .resume()
    }
    
    
    
    
    
    
}
