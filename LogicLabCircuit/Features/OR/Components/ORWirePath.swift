//
//  ORWirePath.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 26/07/25.
//

import SwiftUI

struct ORWirePath: View {
    @ObservedObject var viewModel: ORViewModel
    let activeColor = Color.green
    let inactiveColor = Color.gray

    var body: some View {
        ZStack {
            Path { path in
                // Input A to OR gate
                path.move(to: CGPoint(x: 105, y: 130))
                path.addLine(to: CGPoint(x: 160, y: 130))
            }
            .stroke(viewModel.inputA ? activeColor : inactiveColor, lineWidth: 3)
            
            Path { path in
                // Input B to OR gate
                path.move(to: CGPoint(x: 105, y: 170))
                path.addLine(to: CGPoint(x: 160, y: 170))
            }
            .stroke(viewModel.inputB ? activeColor : inactiveColor, lineWidth: 3)
            
            Path { path in
                // OR gate output to O
                path.move(to: CGPoint(x: 200, y: 150))
                path.addLine(to: CGPoint(x: 255, y: 150))
            }
            .stroke(viewModel.output ? activeColor : inactiveColor, lineWidth: 3)
        }
    }
}
