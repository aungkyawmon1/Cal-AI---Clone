//___FILEHEADER___

import SwiftUI

@main
struct MainApp: App {
    var body: some Scene {
        WindowGroup {
            IntroView()
                .preferredColorScheme(.light) // Forces light mode
        }
    }
}
