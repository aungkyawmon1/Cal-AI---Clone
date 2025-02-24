//
//  View+Extension.swift
//  Cal AI - Clone
//
//  Created by Aung Kyaw Mon on 2/22/2568.
//

import SwiftUI

extension View {
    func onChange<V>(of values: [V], perform action: @escaping () -> Void) -> some View where V: Equatable {
        self.onChange(of: values[0]) { _ in action() }
            .onChange(of: values[1]) { _ in action() }
            .onChange(of: values[2]) { _ in action() }
    }
}
