//
//  TextScannerModel.swift
//  LearningMachineLearning (iOS)
//
//  Created by Luiz Araujo on 07/07/22.
//

import Foundation

class RecognizedContent: ObservableObject {
    @Published var items = [TextItem]()
}

class TextItem: Identifiable {
    var id: String
    var text: String = ""
    
    init() {
        id = UUID().uuidString
    }
    
    init(text: String) {
        id = UUID().uuidString
        self.text = text
    }
}
