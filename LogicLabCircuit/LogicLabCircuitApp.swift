//
//  LogicLabCircuitApp.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 06/07/25.
//

import SwiftUI
import ComposableArchitecture

@main
struct LogicLabCircuitApp: App {
    var body: some Scene {
        WindowGroup {
            MainView(
                store: Store(initialState: MainFeature.State()) {
                    MainFeature()
                }
            )
        }
    }
}
