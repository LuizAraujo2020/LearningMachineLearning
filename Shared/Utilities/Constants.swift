//
//  Constants.swift
//  LearningMachineLearning
//
//  Created by Luiz Araujo on 07/07/22.
//

import SwiftUI

struct Constants {
    
    //MARK: - SIZES
    static let sizes = ConstantsSizes()
    struct ConstantsSizes {
        let cornerRadius = CGFloat(20.0)
        let listTextSpacing = CGFloat(15)
    }
    
    //MARK: - COLORS
    static let colors = ConstantsColors()
    struct ConstantsColors {
        let paper = Color("Color-recycled_paper")
    }
    
    //MARK: - TEXTS
    static let texts = ConstantsTexts()
    struct ConstantsTexts {
        let tabItemMenu = String("Menu")
        let tabItemText = String("Text")
        
        let navigationTitleTextScannerView = String("Text Scanner")
        let buttonScanTextScannerView = String("Scan")
        
        let buttonNamesTextPreviewView = String("Names")
        let buttonOrganizationsTextPreviewView = String("Organizations")
        let buttonPlacesTextPreviewView = String("Places")
    }
    
    
}
