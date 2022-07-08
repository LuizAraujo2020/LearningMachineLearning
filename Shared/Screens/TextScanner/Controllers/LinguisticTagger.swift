//
//  LinguisticTagger.swift
//  LearningMachineLearning
//
//  Created by Luiz Araujo on 08/07/22.
//

import Foundation

struct LinguisticTagger {
    static func getNames(text: String, typesOfTaggers: TypesOfTaggers) -> [TextItem] {
        var result = [String]()
        var names  = [TextItem]()
        
        switch typesOfTaggers {
        case .personalName:
            result = getPersonalNames(text)
            
        case .organizationName:
            result = getOrganizationsName(text)
            
        case .placeName:
            result = getPlacesName(text)
            
        case .none:
            result = []
        }
        
        for t in result {
            names.append(TextItem(text: t))
        }
        
        return names
    }
    
    static private func getPersonalNames(_ text: String) -> [String] {
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
    
    static private func getPlacesName(_ text: String) -> [String] {
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
    
    static private func getOrganizationsName(_ text: String) -> [String] {
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
