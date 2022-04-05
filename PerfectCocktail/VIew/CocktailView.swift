//
//  CoctailView.swift
//  PerfectCoctail
//
//  Created by Jakub Malczyk on 02/04/2022.
//

import SwiftUI

struct CocktailView: View {
    
    
    @ObservedObject var cocktailVM = CocktailViewModel()
    
    
    var random : Bool
    var id : String?
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [Color("FirstColor"), Color("SecondColor")], startPoint: .bottomTrailing, endPoint: .topLeading)
                .ignoresSafeArea()
            
            ScrollView(){
                
                VStack(alignment: .leading){
                    
                    Text(cocktailVM.cocktail.tittle)
                        .font(.largeTitle)
                        .fontWeight(.light)
                    
                    
                    Text(cocktailVM.cocktail.alcoholic ? "Alcohol" : "Softdrink")
                        .font(.title3)
                        .fontWeight(.light)
                        .foregroundColor(Color.gray)
                    
                    
                    
                    Image(uiImage: cocktailVM.cocktail.photo.getImage())
                        .resizable()
                        .frame(width: 380, height: 350)
                        .cornerRadius(35)
                    
                    
                    VStack(alignment: .leading, spacing: 15){
                        
                        VStack(alignment: .leading, spacing: 5){
                            
                            Text("Ingredients")
                                .font(.largeTitle)
                                .fontWeight(.light)
                            VStack(alignment: .leading){
                                ForEach(cocktailVM.cocktail.ingredients, id: \.self) { ingredient in
                                    Text(ingredient)
                                        .fontWeight(.light)
                                }
                            }
                        }// VStack - Ingredients
                        
                        
                        VStack(alignment: .leading, spacing: 5){
                            Text("Prepare instruction")
                                .font(.largeTitle)
                                .fontWeight(.light)
                            
                            Text(cocktailVM.cocktail.instruction)
                                .fontWeight(.light)
                                .multilineTextAlignment(.leading)
                        }// VStack - Instruction
                        
                        
                    } // VStack - Ingredients and Instruction
                }
                
                
            } // ScrollView - all
            .padding(.horizontal, 5)
        }// ZStack
        .onAppear{
            random ? cocktailVM.getRandom() : cocktailVM.getExact(id: id!)
            
        }
        
    }
}


struct CoctailView_Previews: PreviewProvider {
    static var previews: some View {
        CocktailView(random: true)
    }
}


extension String{
    
    func getImage() -> UIImage{
        
        do {
            guard let url = URL(string: self) else {
                return UIImage() }
            
            let data: Data = try Data(contentsOf: url)
            
            return UIImage(data: data) ?? UIImage()
            
        } catch {
            //
        }
        
        return UIImage()
    }
    
}
