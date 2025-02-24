//
//  WorkoutSectionVO.swift
//  Cal AI - Clone
//
//  Created by Aung Kyaw Mon on 2/23/2568.
//

import Foundation

struct WorkoutSectionVO: Hashable, Identifiable {
    let id = UUID() // Adds unique identifier
    let name: String
    let caption: String
    let icon: String
}
