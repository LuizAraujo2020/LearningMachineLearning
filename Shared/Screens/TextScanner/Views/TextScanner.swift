//
//  TextScanner.swift
//  LearningMachineLearning
//
//  Created by Luiz Araujo on 07/07/22.
//

import SwiftUI

struct TextScanner: View {
    @ObservedObject var recognizedContent = RecognizedContent()

    @State private var showScanner = false
    @State private var isRecognizing = false
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                List(recognizedContent.items, id: \.id) { textItem in
                    NavigationLink(destination: TextPreviewView(text: textItem.text)) {
                        Text(String(textItem.text.prefix(50)).appending("..."))
                    }
                }
                
                
                if isRecognizing {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: Color(UIColor.systemIndigo)))
                        .padding(.bottom, 20)
                }
                
            }
            .navigationTitle(Constants.texts.navigationTitleTextScannerView)
            .navigationBarItems(trailing: Button(action: {
                guard !isRecognizing else { return }
                showScanner = true
            }, label: {
                HStack {
                    Image(systemName: "doc.text.viewfinder")
                        .renderingMode(.template)
                        .foregroundColor(.white)
                    
                    Text(Constants.texts.buttonScanTextScannerView)
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 16)
                .frame(height: 36)
                .background(Color(UIColor.systemIndigo))
                .cornerRadius(18)
            }))
        }
        .sheet(isPresented: $showScanner, content: {
            ScannerView { result in
                
                switch result {
                    case .success(let scannedImages):
                        isRecognizing = true
                    
                    TextRecognition(scannedImages: scannedImages, recognizedContent: recognizedContent) {
                         
                            // Text recognition is finished, hide the progress indicator.
                            isRecognizing = false
                        }.recognizeText()
                    
                    case .failure(let error):
                        print(error.localizedDescription)
                }
                
                /// Make the sheet be dismissed in case the user has proceeded with scanning.
                showScanner = false
                
            /// In case the user cancels the scanning task, then all we have to do is to make sheet go away.
            } didCancelScanning: {
                // Dismiss the scanner controller and the sheet.
                showScanner = false
            }
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        TextScanner()
    }
}
