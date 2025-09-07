//
//  ANDWirePath.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 26/07/25.
//

import SwiftUI
import ComposableArchitecture

struct ANDWirePath: View {
    let store: StoreOf<ANDFeature>
    let activeColor = Color.green
    let inactiveColor = Color.gray

    var body: some View {
        WithViewStore(self.store, observe: { $0 }, content: { viewStore in
            ZStack {
                Path { path in
                    // Input A to AND gate
                    path.move(to: CGPoint(x: 105, y: 130))
                    path.addLine(to: CGPoint(x: 150, y: 130))
                }
                .stroke(viewStore.inputA ? activeColor : inactiveColor, lineWidth: 3)
                
                Path { path in
                    // Input B to AND gate
                    path.move(to: CGPoint(x: 105, y: 170))
                    path.addLine(to: CGPoint(x: 150, y: 170))
                }
                .stroke(viewStore.inputB ? activeColor : inactiveColor, lineWidth: 3)
                
                Path { path in
                    // AND gate output to O
                    path.move(to: CGPoint(x: 200, y: 150))
                    path.addLine(to: CGPoint(x: 255, y: 150))
                }
                .stroke(viewStore.output ? activeColor : inactiveColor, lineWidth: 3)
            }
        })
    }
}
