//
//  ANDWirePath.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 26/07/25.
//

import SwiftUI

struct ANDWirePath: View {
    @ObservedObject var viewModel: ANDViewModel
    let activeColor = Color.green
    let inactiveColor = Color.gray

    var body: some View {
        Path { path in
            // Input A to AND gate
            path.move(to: CGPoint(x: 105, y: 130))
            path.addLine(to: CGPoint(x: 150, y: 130))

            // Input B to AND gate
            path.move(to: CGPoint(x: 105, y: 170))
            path.addLine(to: CGPoint(x: 150, y: 170))

            // AND gate output to O
            path.move(to: CGPoint(x: 200, y: 150))
            path.addLine(to: CGPoint(x: 255, y: 150))
        }
        .stroke(viewModel.output ? activeColor : inactiveColor, lineWidth: 3)
    }
}
