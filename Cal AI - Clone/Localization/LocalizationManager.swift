//
//  LocalizationManager.swift
//  Cal AI - Clone
//
//  Created by Aung Kyaw Mon on 2/22/2568.
//

import Foundation

class LocalizationManager: ObservableObject {
    @Published var currentLanguage: LocalizationLanguage {
        didSet {
            UserDefaults.standard.set(currentLanguage.rawValue, forKey: "AppLanguage")
        }
    }
    
    init() {
        if let savedLanguage = UserDefaults.standard.string(forKey: "AppLanguage"),
           let language = LocalizationLanguage(rawValue: savedLanguage) {
            self.currentLanguage = language
        } else {
            let deviceLanguage = Locale.current.languageCode ?? "en"
            switch deviceLanguage {
            case "ja":
                self.currentLanguage = .japanese
            case "tr":
                self.currentLanguage = .turkish
            default:
                self.currentLanguage = .english
            }
        }
    }
    
    func changeLanguage(to language: LocalizationLanguage) {
        currentLanguage = language
        UserDefaults.standard.set([language.rawValue], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
        
        // Post notification for views to update
        NotificationCenter.default.post(name: Notification.Name("LanguageChanged"), object: nil)
    }
}
