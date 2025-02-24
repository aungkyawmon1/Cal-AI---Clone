//
//  UserData.swift
//  Cal AI - Clone
//
//  Created by Aung Kyaw Mon on 2/22/2568.
//

import SwiftUI

class UserData: ObservableObject {
    @Published var gender: String = ""
    @Published var workoutsPerWeek: String = ""
    @Published var socialSource: String = ""
    @Published var hasTriedOtherApps: Bool?
    @Published var useMetricSystem: Bool = false
    @Published var height: (feet: Int, inches: Int, cm: Int) = (5, 8, 173)
    @Published var weight: (lb: Int, kg: Int) = (150, 68)
    @Published var birthDate: Date = Calendar.current.date(byAdding: .year, value: -25, to: Date()) ?? Date()
    @Published var goal: String = ""
    @Published var desiredWeight: Double = 0.0
    @Published var maintainanceObstacle: String = ""
    @Published var specificDiet: String = ""
    @Published var accomplishment: String = ""
    @Published var weightLossSpeed: Double = 0.0
    @Published var referralCode: String = ""
}
