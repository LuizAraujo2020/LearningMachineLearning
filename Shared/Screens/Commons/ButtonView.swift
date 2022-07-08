//
//  ButtonView.swift
//  LearningMachineLearning
//
//  Created by Luiz Araujo on 07/07/22.
//

import SwiftUI

struct ButtonView: View {
    let title: String
    let sfSymbol: String
    let isSelected: Bool
    let width: CGFloat
    
    var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(isSelected ? .accentColor : .white)
                
                VStack {
                    Image(systemName: sfSymbol)
                        .resizable()
                        .frame(width: width * 0.4, height: width * 0.4)
                        .foregroundColor(isSelected ? .white : .accentColor)
                    
                    Text(title)
                        .foregroundColor(isSelected ? .white : .accentColor)
                        .font(.caption2)
                        .scaleEffect(width * 0.015)
                }
            }
            .frame(height: width * 1.5)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "Name", sfSymbol: "person.crop.circle.badge.questionmark", isSelected: true, width: UIScreen.main.bounds.width)
    }
}
//person.crop.circle.badge.questionmark
//location.circle
//briefcase.circle
