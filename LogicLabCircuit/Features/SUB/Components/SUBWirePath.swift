//
//  SUBWirePath.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 26/07/25.
//

import SwiftUI

struct SUBWirePath: View {
    @ObservedObject var viewModel: SUBViewModel
    let activeColor = Color.green
    let inactiveColor = Color.gray
    let r: CGFloat = 3.0

    var body: some View {
        Path { path in
            // A to NOT gate
            path.move(to: CGPoint(x: 18, y: 60))
            path.addLine(to: CGPoint(x: 40, y: 60))
            
            // dot at A output to XOR1 (25, 60)
            path.addEllipse(in: CGRect(x: 25 - r, y: 60 - r, width: r * 2, height: r * 2))

            // NOT1 output to AND1
            path.move(to: CGPoint(x: 70, y: 62.5))
            path.addLine(to: CGPoint(x: 90, y: 62.5))
            
            // B to AND1
            path.move(to: CGPoint(x: 18, y: 100))
            path.addLine(to: CGPoint(x: 70, y: 100))
            
            // B to AND1
            path.move(to: CGPoint(x: 70, y: 82.5))
            path.addLine(to: CGPoint(x: 70, y: 100))
            
            // dot at B output to AND1 (70, 100)
            path.addEllipse(in: CGRect(x: 70 - r, y: 100 - r, width: r * 2, height: r * 2))
            
            // B to AND1
            path.move(to: CGPoint(x: 70, y: 82.5))
            path.addLine(to: CGPoint(x: 90, y: 82.5))

            // AND1 to OR
            path.move(to: CGPoint(x: 135, y: 70))
            path.addLine(to: CGPoint(x: 275, y: 70))
            
            // dot at AND1 output to NOT (135, 100)
            path.addEllipse(in: CGRect(x: 145 - r, y: 70 - r, width: r * 2, height: r * 2))
            
            // OR to D (Difference)
            path.move(to: CGPoint(x: 310, y: 80))
            path.addLine(to: CGPoint(x: 345, y: 80))
            
            // A to XOR1
            path.move(to: CGPoint(x: 25, y: 60))
            path.addLine(to: CGPoint(x: 25, y: 190))
            
            // A to XOR1
            path.move(to: CGPoint(x: 25, y: 190))
            path.addLine(to: CGPoint(x: 95, y: 190))

            // B to XOR1
            path.move(to: CGPoint(x: 70, y: 100))
            path.addLine(to: CGPoint(x: 70, y: 170))
            
            // B to XOR1
            path.move(to: CGPoint(x: 70, y: 170))
            path.addLine(to: CGPoint(x: 95, y: 170))

            // XOR1 to XOR2
            path.move(to: CGPoint(x: 135, y: 180))
            path.addLine(to: CGPoint(x: 180, y: 180))
            
            // XOR1 to XOR2
            path.move(to: CGPoint(x: 180, y: 180))
            path.addLine(to: CGPoint(x: 180, y: 195))
            
            // XOR1 to XOR2
            path.move(to: CGPoint(x: 180, y: 195))
            path.addLine(to: CGPoint(x: 275, y: 195))

            // Ci to XOR2
            path.move(to: CGPoint(x: 18, y: 215))
            path.addLine(to: CGPoint(x: 275, y: 215))
            
            // dot at Ci output to AND (160, 215)
            path.addEllipse(in: CGRect(x: 160 - r, y: 215 - r, width: r * 2, height: r * 2))

            // AND1 to NOT2
            path.move(to: CGPoint(x: 145, y: 70))
            path.addLine(to: CGPoint(x: 145, y: 102.5))
            
            // AND1 to NOT2
            path.move(to: CGPoint(x: 145, y: 102.5))
            path.addLine(to: CGPoint(x: 160, y: 102.5))
            
            // AND to NOT2
            path.move(to: CGPoint(x: 190, y: 102.5))
            path.addLine(to: CGPoint(x: 200, y: 102.5))

            // Ci to AND2
            path.move(to: CGPoint(x: 160, y: 125))
            path.addLine(to: CGPoint(x: 160, y: 215))
            
            // Ci to AND2
            path.move(to: CGPoint(x: 160, y: 125))
            path.addLine(to: CGPoint(x: 200, y: 125))

            // AND2 to OR
            path.move(to: CGPoint(x: 245, y: 115))
            path.addLine(to: CGPoint(x: 255, y: 115))
            
            // AND2 to OR
            path.move(to: CGPoint(x: 255, y: 90))
            path.addLine(to: CGPoint(x: 255, y: 115))
            
            // AND2 to OR
            path.move(to: CGPoint(x: 255, y: 90))
            path.addLine(to: CGPoint(x: 270, y: 90))

            // XOR to Co (Borrow)
            path.move(to: CGPoint(x: 317.5, y: 205))
            path.addLine(to: CGPoint(x: 345, y: 205))
        }
        .stroke(viewModel.outputD || viewModel.outputCo ? activeColor : inactiveColor, lineWidth: 3)
    }
}
