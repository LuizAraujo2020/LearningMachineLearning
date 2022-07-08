//
//  Enums.swift
//  LearningMachineLearning
//
//  Created by Luiz Araujo on 08/07/22.
//

import Foundation

enum TypesOfTaggers{
    case personalName
    case organizationName
    case placeName
    case none
    
    var tag: NSLinguisticTag {
        switch self {
        case .personalName:
            return NSLinguisticTag.personalName
            
        case .organizationName:
            return NSLinguisticTag.organizationName
            
        case .placeName:
            return NSLinguisticTag.placeName
            
        case .none:
            return NSLinguisticTag.personalName
        }
    }
}
