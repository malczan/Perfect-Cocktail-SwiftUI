//
//  ContentView.swift
//  PerfectCoctail
//
//  Created by Jakub Malczyk on 02/04/2022.
//

import SwiftUI

struct MenuView: View {
    
    
    var body: some View {
        
        NavigationView{
            
            ZStack{
                
                LinearGradient(colors: [Color("FirstColor"), Color("SecondColor")], startPoint: .bottomTrailing, endPoint: .topLeading)
                    .ignoresSafeArea()
                
                ScrollView{
                    
                    Button {
                    } label: {
                        NavigationLink {
                            ListView(alcoholic: true)
                        } label: {
                            MenuElement(tittle: "Alcohol cocktails", color: Color.red, icon: "18.circle")
                        }
                    }
                    
                    Button {
                    } label: {
                        NavigationLink {
                            ListView(alcoholic: false)
                        } label: {
                            MenuElement(tittle: "Non-alcohol cocktails", color: Color.green, icon: "cup.and.saucer")
                        }
                    }
                    
                    Button {
                    } label: {
                        NavigationLink {
                            IngredientsView()
                        } label: {
                            MenuElement(tittle: "Search by ingredient", color: Color.mint, icon: "magnifyingglass")
                        }
                        
                    }
                    
                    Button {
                    } label: {
                        NavigationLink {
                            CocktailView(random: true)
                        } label: {
                            MenuElement(tittle: "Random", color: Color.yellow, icon: "questionmark")
                        }
                        
                    }
                    
                    
                } // ScrollView
                .navigationTitle("Menu")
            }
        }
        
        
    }
}


struct MenuElement : View{
    
    var tittle : String
    var color : Color
    var icon : String
    
    
    
    var body: some View{
        
        
        ZStack{
            
            Rectangle()
                .frame(width: 380, height: 100)
                .cornerRadius(20)
                .foregroundColor(Color.white)
            
            HStack{
                
                Text(tittle)
                    .foregroundColor(Color.black)
                
                Spacer()
                
                Rectangle()
                    .fill(color)
                    .frame(width: 50, height: 50)
                    .cornerRadius(10)
                    .overlay(Image(systemName: icon)
                        .foregroundColor(Color.white)
                        .font(.system(size: 26)))
                
            }
            .padding(.horizontal)
            .frame(width: 380, height: 100)
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

//questionmark
