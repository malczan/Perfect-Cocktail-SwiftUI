//
//  ListVIew.swift
//  PerfectCoctail
//
//  Created by Jakub Malczyk on 03/04/2022.
//

import SwiftUI

struct ListView: View {
    
    
    
    @ObservedObject var listVM = ListViewModel()
    
    var alcoholic : Bool?
    var ingredient : String?
    
    var tittle : String{
        if let alcoholic = alcoholic {
            return alcoholic ? "Alcoholic" : "Soft drinks"
        } else {
            return ingredient!
        }
    }
    
    var body: some View {
        
        ZStack{
            
            LinearGradient(colors: [Color("FirstColor"), Color("SecondColor")], startPoint: .bottomTrailing, endPoint: .topLeading)
                .ignoresSafeArea()
            
            List{
                
                ForEach(listVM.list.drinks, id: \.self) { drink in
                    NavigationLink {
                        CocktailView(random: false, id: drink.idDrink)
                    } label: {
                        HStack {
                            Text(drink.strDrink)
                                .font(.system(size: 20))
                                .fontWeight(.light)
                            
                            Spacer()
                            
                            Image(uiImage: drink.strDrinkThumb.getImage())
                                .resizable()
                                .frame(width: 60, height: 60)
                        }
                    }
                }// ForEach
            }// List
            .background(LinearGradient(colors: [Color("FirstColor"), Color("SecondColor")], startPoint: .bottomTrailing, endPoint: .topLeading).ignoresSafeArea())
            .navigationTitle(tittle)
            .onAppear{
                UITableView.appearance().backgroundColor = .clear
                if let alcoholic = alcoholic{
                    listVM.getList(alcholic: alcoholic)
                } else {
                    listVM.getListWithIngredients(ingredient: ingredient!)
                }
            }
            
        }// ZStack
        
        
        
    }
}

struct ListVIew_Previews: PreviewProvider {
    static var previews: some View {
        ListView(alcoholic: true)
    }
}
