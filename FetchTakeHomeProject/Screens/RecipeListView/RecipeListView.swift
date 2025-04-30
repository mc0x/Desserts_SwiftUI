//
//  RecipeListView.swift
//  FetchTakeHomeProject
//
//  Created by Mayra Cortez on 1/8/25.
//

import SwiftUI

struct RecipeListView: View {
    
    @StateObject var vm = RecipeListViewModel()
    
    
    var body: some View {
        ZStack{
            NavigationView {
                List(vm.recipes, id: \.uuid) {
                    recipe in
                    RecipeListCell(recipe: recipe)
                        .listRowInsets(EdgeInsets(.init(top: 8, leading: 8, bottom: 5, trailing: 5)))
                        .onTapGesture {
                            vm.selectedRecipe = recipe
                            vm.isShowingDetail = true
                        }
                }
                .navigationTitle("Recipes")
                .listStyle(.plain)
                .disabled(vm.isShowingDetail)
            }
            .task {
                vm.getRecipes()
            }
            .blur(radius: vm.isShowingDetail ? 20 : 0)
            
            if vm.isShowingDetail {
                RecipeDetailsView(recipe: vm.selectedRecipe!, isShowingDetailView: $vm.isShowingDetail)
            }
            
            if vm.isLoading {
                LoadingView()
            }
        }
        .alert(item: $vm.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)

        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
