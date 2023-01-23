//
//  TabCoordinator.swift
//  Athena
//
//  Created by Dev Jacobson on 2022/11/04.
//

import Foundation
import SwiftUI

enum Tab {
    case emergency
    case security
    case status
    case settings
}

class TabCoordinator: ObservableObject {

    // MARK: Stored Properties

    @Published var tab = Tab.emergency
//    @Published var veggieCoordinator: RecipeListCoordinator!
//    @Published var meatCoordinator: RecipeListCoordinator!

    @Published var openedURL: URL?

    // MARK: Initialization

    init() {

//        self.veggieCoordinator = .init(
//            title: "Veggie",
//            recipeService: recipeService,
//            parent: self,
//            filter: { $0.isVegetarian }
//        )
//
//        self.meatCoordinator = .init(
//            title: "Meat",
//            recipeService: recipeService,
//            parent: self,
//            filter: { !$0.isVegetarian }
//        )
    }

    // MARK: Methods

    func open(_ url: URL) {
        self.openedURL = url
    }

}
