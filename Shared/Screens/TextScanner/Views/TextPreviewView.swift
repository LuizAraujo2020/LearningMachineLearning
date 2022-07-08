//
//  TextPreviewView.swift
//  ScanAndRecognizeText
//
//  Created by Gabriel Theodoropoulos.
//

import SwiftUI

struct TextPreviewView: View {
    var text: String
    @State var names = [TextItem]()
    
    var body: some View {
        GeometryReader { geo in
            let width = geo.size.width
            
            VStack {
                HStack {
                    Button {
                        
                    } label: {
                        ButtonView(title: "Names", sfSymbol: "person.crop.circle.badge.questionmark", isSelected: true, width: width / 5)
                    }
                    
                    Button {
                        
                    } label: {
                        ButtonView(title: "Organizations", sfSymbol: "briefcase.circle", isSelected: false, width: width / 5)
                    }
                    
                    Button {
                        
                    } label: {
                        ButtonView(title: "Places", sfSymbol: "location.circle", isSelected: false, width: width / 5)
                    }
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: Constants.sizes.cornerRadius)
                        .foregroundColor(.white)
                    
                    ScrollView {
                        Text(text)
                            .font(.body)
                            .foregroundColor(.gray)
                            .padding()
                    }
                }
            }
            .padding()
        }
        .background(Constants.colors.paper)
    }
}

struct TextPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        TextPreviewView(text: """
With the release of SwiftUI, you can now develop the app's UI with a declarative Swift syntax in Xcode. What that means to you is that the UI code is easier and more natural to write. Compared with the existing UI frameworks like UIKit, you can create the same UI with way less code.

The preview function has always been a weak point of Xcode. While you can preview simple layouts in Interface Builder, you usually can't preview the complete UI until the app is loaded onto the simulators. With SwiftUI, you get immediate feedback of the UI you are coding. For example, you add a new record to a table, Xcode renders the UI change on the fly in a preview canvas. If you want to preview how your UI looks in dark mode, you just need to change an option. This instant preview feature simply makes UI development a breeze and iteration much faster.

Not only does it allow you to preview the UI, the new canvas also lets you design the user interface visually using drag and drop. What's great is that Xcode automatically generates the SwiftUI code as you add the UI component visually. The code and the UI are always in sync. This is a feature Apple developers anticipated for a long time.
"""
                        , names: [TextItem()])
    }
}
