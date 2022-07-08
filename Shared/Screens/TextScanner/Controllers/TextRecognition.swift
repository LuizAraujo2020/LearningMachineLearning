//
//  TextRecognition.swift
//  LearningMachineLearning
//
//  Created by Luiz Araujo on 07/07/22.
//

import SwiftUI
import Vision

struct TextRecognition {
    var scannedImages: [UIImage]
    @ObservedObject var recognizedContent: RecognizedContent
    var didFinishRecognition: () -> Void
    
    
    func recognizeText() {
        let queue = DispatchQueue(label: "textRecognitionQueue", qos: .userInitiated)
        queue.async {
            for image in scannedImages {
                guard let cgImage = image.cgImage else { return }
                
                let requestHandler = VNImageRequestHandler(cgImage: cgImage, options: [:])
                
                do {
                    let textItem = TextItem()
                    try requestHandler.perform([getTextRecognitionRequest(with: textItem)])
                    
                    DispatchQueue.main.async {
                        recognizedContent.items.append(textItem)
                    }
                } catch {
                    print(error.localizedDescription)
                }
                
                DispatchQueue.main.async {
                    didFinishRecognition()
                }
            }
        }
    }
    
    
    private func getTextRecognitionRequest(with textItem: TextItem) -> VNRecognizeTextRequest {
        let request = VNRecognizeTextRequest { request, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let observations = request.results as? [VNRecognizedTextObservation] else { return }
            
            observations.forEach { observation in
                guard let recognizedText = observation.topCandidates(1).first else { return }
                textItem.text += recognizedText.string
                textItem.text += "\n"
            }
        }
        
        request.recognitionLevel = .accurate
        request.usesLanguageCorrection = true
        
        return request
    }
    
    
    //MARK: - LinguisticTagger
    
    func getPersonalNames(_ text: String) -> [String] {
        let tagger = NSLinguisticTagger(tagSchemes: [NSLinguisticTagScheme.nameType], options: 0)

        tagger.string = text

        let range = NSMakeRange(0, text.utf16.count)

        let options: NSLinguisticTagger.Options = [.omitPunctuation, .omitWhitespace, .joinNames]

        var names: [String] = []
//        let tags: [NSLinguisticTag] = [.personalName, .placeName, .organizationName]

        tagger.enumerateTags(in: range, unit: .word, scheme: .nameType, options: options) { tag, tokenRange, stop in
            guard let tag = tag else { return }
            
            let token = (text as NSString).substring(with: tokenRange)
            
            switch tag {
            case .personalName:
                names.append(token)
                
            default: break
            }
            
        }

        print(names)
        
        return names

    }
    func getPlacesName(_ text: String) -> [String] {
        let tagger = NSLinguisticTagger(tagSchemes: [NSLinguisticTagScheme.nameType], options: 0)

        tagger.string = text

        let range = NSMakeRange(0, text.utf16.count)

        let options: NSLinguisticTagger.Options = [.omitPunctuation, .omitWhitespace, .joinNames]

        var places: [String] = []

        tagger.enumerateTags(in: range, unit: .word, scheme: .nameType, options: options) { tag, tokenRange, stop in
            guard let tag = tag else { return }
            
            let token = (text as NSString).substring(with: tokenRange)
            
            switch tag {
            case .placeName:
                places.append(token)
            default: break
            }
            
        }

        print(places)
        return places

    }
    func getOrganizationsName(_ text: String) -> [String] {
        let tagger = NSLinguisticTagger(tagSchemes: [NSLinguisticTagScheme.nameType], options: 0)

        tagger.string = text

        let range = NSMakeRange(0, text.utf16.count)

        let options: NSLinguisticTagger.Options = [.omitPunctuation, .omitWhitespace, .joinNames]

        var orgs: [String] = []

        tagger.enumerateTags(in: range, unit: .word, scheme: .nameType, options: options) { tag, tokenRange, stop in
            guard let tag = tag else { return }
            
            let token = (text as NSString).substring(with: tokenRange)
            
            switch tag {
            case .organizationName:
                orgs.append(token)
            default: break
            }
            
        }

        print(orgs)
        return orgs
    }
}
