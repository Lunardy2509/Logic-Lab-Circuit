//
//  LogicLabCircuitApp.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 06/07/25.
//

import SwiftUI

@main
struct LogicLabCircuitApp: App {
    var body: some Scene {
        WindowGroup {
            MainView(
                viewModel: MainViewModel(),
                addViewModel: ADDViewModel(),
                subViewModel: SUBViewModel()
            )
        }
    }
}
