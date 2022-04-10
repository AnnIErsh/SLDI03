//
//  SLDI03App.swift
//  SLDI03
//
//  Created by Anna Ershova on 08.04.2022.
//

import SwiftUI

@main
struct SLDI03App: App {
    init() {
        Configurator.shared.register()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
