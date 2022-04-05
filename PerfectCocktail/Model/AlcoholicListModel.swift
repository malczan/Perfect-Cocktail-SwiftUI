//
//  AlcoholicListModel.swift
//  PerfectCocktail
//
//  Created by Jakub Malczyk on 03/04/2022.
//

import Foundation


struct AlcoholicListModel : Decodable, Hashable{
    
    var drinks : [Drinks]
}

struct Drinks : Decodable, Hashable{
    
    
    var strDrink : String
    var strDrinkThumb : String
    var idDrink : String
    
    
}
