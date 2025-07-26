//
//  XORWirePath.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 26/07/25.
//

import SwiftUI

struct XORWirePath: View {
    @ObservedObject var viewModel: XORViewModel
    let activeColor = Color.green
    let inactiveColor = Color.gray

    var body: some View {
        Path { path in
            // Input A to XOR gate
            path.move(to: CGPoint(x: 105, y: 130))
            path.addLine(to: CGPoint(x: 155, y: 130))

            // Input B to XOR gate
            path.move(to: CGPoint(x: 105, y: 170))
            path.addLine(to: CGPoint(x: 155, y: 170))

            // XOR gate output to O
            path.move(to: CGPoint(x: 200, y: 150))
            path.addLine(to: CGPoint(x: 255, y: 150))
        }
        .stroke(viewModel.output ? activeColor : inactiveColor, lineWidth: 3)
    }
}
