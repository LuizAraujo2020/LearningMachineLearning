//
//  MainView.swift
//  LearningMachineLearning
//
//  Created by Luiz Araujo on 07/07/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label(Constants.texts.tabItemMenu, systemImage: "list.dash")
                }

            TextScanner()
                .tabItem {
                    Label(Constants.texts.tabItemText, systemImage: "text.magnifyingglass")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
