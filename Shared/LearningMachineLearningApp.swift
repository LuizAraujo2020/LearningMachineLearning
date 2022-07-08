//
//  LearningMachineLearningApp.swift
//  Shared
//
//  Created by Luiz Araujo on 05/07/22.
//

import SwiftUI

@main
struct LearningMachineLearningApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            MainView()
        }
    }
}
