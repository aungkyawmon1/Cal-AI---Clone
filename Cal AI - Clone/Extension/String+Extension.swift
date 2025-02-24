//
//  String+Extension.swift
//  Cal AI - Clone
//
//  Created by Aung Kyaw Mon on 2/22/2568.
//

import Foundation

extension String {
    var localized: String {
        let language = UserDefaults.standard.string(forKey: "AppLanguage") ?? "en"
        let path = Bundle.main.path(forResource: language, ofType: "lproj")
        let bundle = path != nil ? Bundle(path: path!) : Bundle.main
        return NSLocalizedString(self, tableName: nil, bundle: bundle ?? Bundle.main, value: "", comment: "")
    }
    
    func localizedFormat(_ arguments: CVarArg...) -> String {
        String(format: self.localized, arguments: arguments)
    }
}
