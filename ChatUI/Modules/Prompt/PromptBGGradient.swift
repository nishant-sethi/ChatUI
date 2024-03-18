//
//  PromptBGGradient.swift
//  ChatUI
//
//  Created by Nishant sethi on 31/01/2024.
//

import SwiftUI

enum PromptCategory: String, CaseIterable, Codable {
    case technologyDevelopment = "Technology and Development"
    case communicationLanguage = "Communication and Language"
    case itSolutions = "IT Solutions"
    case lifestylePersonalServices = "Lifestyle and Personal Services"
    case artsEntertainment = "Arts and Entertainment"
    case gamesEntertainment = "Games and Entertainment"
    case writingContentCreation = "Writing and Content Creation"
    case healthWellness = "Health and Wellness"
    case educationLearning = "Education and Learning"
    case mysticalCulturalStudies = "Mystical and Cultural Studies"
    case businessFinance = "Business and Finance"
    case miscellaneousToolsServices = "Miscellaneous Tools and Services"
    case literatureCreativeWriting = "Literature and Creative Writing"
    case legalEthicalConsiderations = "Legal and Ethical Considerations"
}

struct PromptBGColor {
    static var from: (String) -> Color = { category in
        switch category {
            case PromptCategory.technologyDevelopment.rawValue:
                return convertHexToRGB(hexaColor: "#007acc")
            case PromptCategory.communicationLanguage.rawValue:
                return convertHexToRGB(hexaColor: "#e0115f")
            case PromptCategory.itSolutions.rawValue:
                return convertHexToRGB(hexaColor: "#00ffff")
            case PromptCategory.lifestylePersonalServices.rawValue:
                return convertHexToRGB(hexaColor: "#daa520")
            case PromptCategory.artsEntertainment.rawValue:
                return convertHexToRGB(hexaColor: "#9400d3")
            case PromptCategory.gamesEntertainment.rawValue:
                return convertHexToRGB(hexaColor: "#ff6347")
            case PromptCategory.writingContentCreation.rawValue:
                return convertHexToRGB(hexaColor: "#8e4585")
            case PromptCategory.healthWellness.rawValue:
                return convertHexToRGB(hexaColor: "#40e0d0")
            case PromptCategory.educationLearning.rawValue:
                return convertHexToRGB(hexaColor: "#6a994e")
            case PromptCategory.mysticalCulturalStudies.rawValue:
                return convertHexToRGB(hexaColor: "#556b2f")
            case PromptCategory.businessFinance.rawValue:
                return convertHexToRGB(hexaColor: "#4682b4")
            case PromptCategory.miscellaneousToolsServices.rawValue:
                return convertHexToRGB(hexaColor: "#b22222")
            case PromptCategory.literatureCreativeWriting.rawValue:
                return convertHexToRGB(hexaColor: "#da72d6")
            case PromptCategory.legalEthicalConsiderations.rawValue:
                return convertHexToRGB(hexaColor: "#800020")
            default:
                return convertHexToRGB(hexaColor: "#000000")
        }
    }
    static var to: (String) -> Color = { category in
        switch category {
            case PromptCategory.technologyDevelopment.rawValue:
                return convertHexToRGB(hexaColor: "#007acc")
            case PromptCategory.communicationLanguage.rawValue:
                return convertHexToRGB(hexaColor: "#820000")
            case PromptCategory.itSolutions.rawValue:
                return convertHexToRGB(hexaColor: "#36454f")
            case PromptCategory.lifestylePersonalServices.rawValue:
                return convertHexToRGB(hexaColor: "#bdb76b")
            case PromptCategory.artsEntertainment.rawValue:
                return convertHexToRGB(hexaColor: "#4b0082")
            case PromptCategory.gamesEntertainment.rawValue:
                return convertHexToRGB(hexaColor: "#8b0000")
            case PromptCategory.writingContentCreation.rawValue:
                return convertHexToRGB(hexaColor: "#800080")
            case PromptCategory.healthWellness.rawValue:
                return convertHexToRGB(hexaColor: "#008080")
            case PromptCategory.educationLearning.rawValue:
                return convertHexToRGB(hexaColor: "#006400")
            case PromptCategory.mysticalCulturalStudies.rawValue:
                return convertHexToRGB(hexaColor: "#8b4513")
            case PromptCategory.businessFinance.rawValue:
                return convertHexToRGB(hexaColor: "#2f4f4f")
            case PromptCategory.miscellaneousToolsServices.rawValue:
                return convertHexToRGB(hexaColor: "#ff8c00")
            case PromptCategory.literatureCreativeWriting.rawValue:
                return convertHexToRGB(hexaColor: "#660066")
            case PromptCategory.legalEthicalConsiderations.rawValue:
                return convertHexToRGB(hexaColor: "#353839")
            default:
                return convertHexToRGB(hexaColor: "#000000")
        }
    }
}

func convertHexToRGB(hexaColor: String) -> Color {
    return Color(uiColor: UIColor(hex: hexaColor))
}

extension UIColor {
    public convenience init(hex: String, defaultColor: UIColor = .clear) {
        let r, g, b, a: CGFloat
        
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        
        // Use the default color in case of invalid hex string
        self.init(cgColor: defaultColor.cgColor)
    }
}

