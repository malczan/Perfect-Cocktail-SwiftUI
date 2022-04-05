//
//  IngredientsModel.swift
//  PerfectCockktail
//
//  Created by Jakub Malczyk on 03/04/2022.
//

import Foundation


struct IngredientsModel : Decodable, Hashable{
    
    var drinks : [Ingredients]
}

struct Ingredients : Decodable, Hashable{
    var strIngredient1 : String
}
