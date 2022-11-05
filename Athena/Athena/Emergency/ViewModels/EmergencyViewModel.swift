//
//  EmergencyViewModel.swift
//  Athena
//
//  Created by Dev Jacobson on 2022/11/05.
//

import SwiftUI

extension Identifiable where ID: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

class EmergencyViewModel: ObservableObject {

    // MARK: Stored Properties

    @Published var id: String

    private unowned let coordinator: EmergencyCoordinator

    // MARK: Initialization

    init(title: String,
         recipeService: RecipeService,
         coordinator: RecipeListCoordinator,
         filter: @escaping (Recipe) -> Bool) {
        self.title = title
        self.coordinator = coordinator
        self.recipeService = recipeService

        recipeService.fetchRecipes {
            self.recipes = $0.filter(filter)
        }
    }

    // MARK: Methods

    func open(_ recipe: Recipe) {
        self.coordinator.open(recipe)
    }

}
