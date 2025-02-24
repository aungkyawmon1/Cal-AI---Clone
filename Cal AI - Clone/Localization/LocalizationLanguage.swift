//
//  LocalizationLanguage.swift
//  Cal AI - Clone
//
//  Created by Aung Kyaw Mon on 2/22/2568.
//

import Foundation

enum LocalizationLanguage: String {
    case english = "en"
    case japanese = "ja"
    case turkish = "tr"
    
    var displayName: String {
        switch self {
        case .english: return "English"
        case .japanese: return "日本語"
        case .turkish: return "Türkçe"
        }
    }
}
