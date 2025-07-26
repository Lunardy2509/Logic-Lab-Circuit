//
//  WirePathView.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 22/07/25.
//
import SwiftUI

struct ADDWirePath: View {
    @ObservedObject var viewModel: ADDViewModel
    let activeColor = Color.green
    let inactiveColor = Color.gray
    let r: CGFloat = 3.0
    
    var body: some View {
        Path { path in
            // A to XOR1
            path.move(to: CGPoint(x: 18, y: 25))
            path.addLine(to: CGPoint(x: 65, y: 25))
            
            // B to XOR1
            path.move(to: CGPoint(x: 18, y: 65))
            path.addLine(to: CGPoint(x: 65, y: 65))
            
            // XOR1 output to XOR2
            path.move(to: CGPoint(x: 118, y: 45))
            path.addLine(to: CGPoint(x: 150, y: 45))
            
            // XOR1 output to XOR2
            path.move(to: CGPoint(x: 150, y: 45))
            path.addLine(to: CGPoint(x: 150, y: 65))
            
            // dot at XOR1 output to XOR2 (150, 65)
            path.addEllipse(in: CGRect(x: 150 - r, y: 65 - r, width: r * 2, height: r * 2))
            
            // XOR1 output to XOR2
            path.move(to: CGPoint(x: 150, y: 65))
            path.addLine(to: CGPoint(x: 175, y: 65))
            
            // Cin to XOR2
            path.move(to: CGPoint(x: 18, y: 105))
            path.addLine(to: CGPoint(x: 80, y: 105))
            
            // dot at Cin to XOR2 (80, 105)
            path.addEllipse(in: CGRect(x: 80 - r, y: 105 - r, width: r * 2, height: r * 2))
            
            // Cin to XOR2
            path.move(to: CGPoint(x: 80, y: 95))
            path.addLine(to: CGPoint(x: 80, y: 105))
            
            // Cin to XOR2
            path.move(to: CGPoint(x: 80, y: 95))
            path.addLine(to: CGPoint(x: 175, y: 95))
            
            // XOR2 output to SUM
            path.move(to: CGPoint(x: 228, y: 80))
            path.addLine(to: CGPoint(x: 325, y: 80))
            
            // dot at A to AND1 (50, 25)
            path.addEllipse(in: CGRect(x: 50 - r, y: 25 - r, width: r * 2, height: r * 2))
            
            // A to AND1
            path.move(to: CGPoint(x: 50, y: 25))
            path.addLine(to: CGPoint(x: 50, y: 240))
            
            // A to AND1
            path.move(to: CGPoint(x: 50, y: 240))
            path.addLine(to: CGPoint(x: 115, y: 240))
            
            // dot at B to AND1 (30, 65)
            path.addEllipse(in: CGRect(x: 30 - r, y: 65 - r, width: r * 2, height: r * 2))
            
            // B to AND1
            path.move(to: CGPoint(x: 30, y: 65))
            path.addLine(to: CGPoint(x: 30, y: 270))
            
            // B to AND1
            path.move(to: CGPoint(x: 30, y: 270))
            path.addLine(to: CGPoint(x: 115, y: 270))
            
            // Cin to AND2
            path.move(to: CGPoint(x: 80, y: 105))
            path.addLine(to: CGPoint(x: 80, y: 150))
            
            // Cin to AND2
            path.move(to: CGPoint(x: 80, y: 150))
            path.addLine(to: CGPoint(x: 115, y: 150))
            
            // XOR1 output to AND2
            path.move(to: CGPoint(x: 150, y: 65))
            path.addLine(to: CGPoint(x: 150, y: 120))
            
            // XOR1 output to AND2
            path.move(to: CGPoint(x: 150, y: 120))
            path.addLine(to: CGPoint(x: 95, y: 120))
            
            // XOR1 output to AND2
            path.move(to: CGPoint(x: 95, y: 120))
            path.addLine(to: CGPoint(x: 95, y: 180))
            
            // XOR1 output to AND2
            path.move(to: CGPoint(x: 95, y: 180))
            path.addLine(to: CGPoint(x: 110, y: 180))
            
            // AND1 output to OR
            path.move(to: CGPoint(x: 160, y: 165))
            path.addLine(to: CGPoint(x: 190, y: 165))
            
            // AND1 output to OR
            path.move(to: CGPoint(x: 190, y: 165))
            path.addLine(to: CGPoint(x: 190, y: 180))
            
            // AND1 output to OR
            path.move(to: CGPoint(x: 190, y: 180))
            path.addLine(to: CGPoint(x: 230, y: 180))
            
            // AND2 output to OR
            path.move(to: CGPoint(x: 160, y: 255))
            path.addLine(to: CGPoint(x: 190, y: 255))
            
            // AND2 output to OR
            path.move(to: CGPoint(x: 190, y: 255))
            path.addLine(to: CGPoint(x: 190, y: 210))
            
            // AND2 output to OR
            path.move(to: CGPoint(x: 190, y: 210))
            path.addLine(to: CGPoint(x: 230, y: 210))
            
            // OR output to COUT
            path.move(to: CGPoint(x: 278, y: 195))
            path.addLine(to: CGPoint(x: 325, y: 195))
        }
        .stroke(viewModel.outputS || viewModel.outputCo ? activeColor : inactiveColor, lineWidth: 3)
    }
}
