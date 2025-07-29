//
//  ADDWirePath.swift
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
        ZStack {
            // A to XOR1
            Path { path in
                path.move(to: CGPoint(x: 18, y: 25))
                path.addLine(to: CGPoint(x: 65, y: 25))
            }
            .stroke(viewModel.inputA ? activeColor : inactiveColor, lineWidth: 3)
            
            // B to XOR1
            Path { path in
                path.move(to: CGPoint(x: 18, y: 65))
                path.addLine(to: CGPoint(x: 65, y: 65))
            }
            .stroke(viewModel.inputB ? activeColor : inactiveColor, lineWidth: 3)
            
            // XOR1 output to XOR2
            Path { path in
                path.move(to: CGPoint(x: 118, y: 45))
                path.addLine(to: CGPoint(x: 150, y: 45))
            }
            .stroke((viewModel.inputA != viewModel.inputB) ? activeColor : inactiveColor, lineWidth: 3)
            
            Path { path in
                path.move(to: CGPoint(x: 150, y: 45))
                path.addLine(to: CGPoint(x: 150, y: 65))
            }
            .stroke((viewModel.inputA != viewModel.inputB) ? activeColor : inactiveColor, lineWidth: 3)
            
            Path { path in
                path.addEllipse(in: CGRect(x: 150 - r, y: 65 - r, width: r * 2, height: r * 2))
            }
            .stroke((viewModel.inputA != viewModel.inputB) ? activeColor : inactiveColor, lineWidth: 3)
            
            Path { path in
                path.move(to: CGPoint(x: 150, y: 65))
                path.addLine(to: CGPoint(x: 175, y: 65))
            }
            .stroke((viewModel.inputA != viewModel.inputB) ? activeColor : inactiveColor, lineWidth: 3)
            
            // Cin to XOR2
            Path { path in
                path.move(to: CGPoint(x: 18, y: 105))
                path.addLine(to: CGPoint(x: 80, y: 105))
            }
            .stroke(viewModel.inputCi ? activeColor : inactiveColor, lineWidth: 3)
            
            Path { path in
                path.addEllipse(in: CGRect(x: 80 - r, y: 105 - r, width: r * 2, height: r * 2))
            }
            .stroke(viewModel.inputCi ? activeColor : inactiveColor, lineWidth: 3)
            
            Path { path in
                path.move(to: CGPoint(x: 80, y: 95))
                path.addLine(to: CGPoint(x: 80, y: 105))
            }
            .stroke(viewModel.inputCi ? activeColor : inactiveColor, lineWidth: 3)
            
            Path { path in
                path.move(to: CGPoint(x: 80, y: 95))
                path.addLine(to: CGPoint(x: 175, y: 95))
            }
            .stroke(viewModel.inputCi ? activeColor : inactiveColor, lineWidth: 3)
            
            // XOR2 output to SUM
            Path { path in
                path.move(to: CGPoint(x: 228, y: 80))
                path.addLine(to: CGPoint(x: 325, y: 80))
            }
            .stroke(viewModel.outputS ? activeColor : inactiveColor, lineWidth: 3)
            
            // dot at A to AND1
            Path { path in
                path.addEllipse(in: CGRect(x: 50 - r, y: 25 - r, width: r * 2, height: r * 2))
            }
            .stroke(viewModel.inputA ? activeColor : inactiveColor, lineWidth: 3)
            
            Path { path in
                path.move(to: CGPoint(x: 50, y: 25))
                path.addLine(to: CGPoint(x: 50, y: 240))
            }
            .stroke(viewModel.inputA ? activeColor : inactiveColor, lineWidth: 3)
            
            Path { path in
                path.move(to: CGPoint(x: 50, y: 240))
                path.addLine(to: CGPoint(x: 115, y: 240))
            }
            .stroke(viewModel.inputA ? activeColor : inactiveColor, lineWidth: 3)
            
            // dot at B to AND1
            Path { path in
                path.addEllipse(in: CGRect(x: 30 - r, y: 65 - r, width: r * 2, height: r * 2))
            }
            .stroke(viewModel.inputB ? activeColor : inactiveColor, lineWidth: 3)
            
            Path { path in
                path.move(to: CGPoint(x: 30, y: 65))
                path.addLine(to: CGPoint(x: 30, y: 270))
            }
            .stroke(viewModel.inputB ? activeColor : inactiveColor, lineWidth: 3)
            
            Path { path in
                path.move(to: CGPoint(x: 30, y: 270))
                path.addLine(to: CGPoint(x: 115, y: 270))
            }
            .stroke(viewModel.inputB ? activeColor : inactiveColor, lineWidth: 3)
            
            // Cin to AND2
            Path { path in
                path.move(to: CGPoint(x: 80, y: 105))
                path.addLine(to: CGPoint(x: 80, y: 150))
            }
            .stroke(viewModel.inputCi ? activeColor : inactiveColor, lineWidth: 3)
            
            Path { path in
                path.move(to: CGPoint(x: 80, y: 150))
                path.addLine(to: CGPoint(x: 115, y: 150))
            }
            .stroke(viewModel.inputCi ? activeColor : inactiveColor, lineWidth: 3)
            
            // XOR1 output to AND2
            Path { path in
                path.move(to: CGPoint(x: 150, y: 65))
                path.addLine(to: CGPoint(x: 150, y: 120))
            }
            .stroke((viewModel.inputA != viewModel.inputB) ? activeColor : inactiveColor, lineWidth: 3)
            
            Path { path in
                path.move(to: CGPoint(x: 150, y: 120))
                path.addLine(to: CGPoint(x: 95, y: 120))
            }
            .stroke((viewModel.inputA != viewModel.inputB) ? activeColor : inactiveColor, lineWidth: 3)
            
            Path { path in
                path.move(to: CGPoint(x: 95, y: 120))
                path.addLine(to: CGPoint(x: 95, y: 180))
            }
            .stroke((viewModel.inputA != viewModel.inputB) ? activeColor : inactiveColor, lineWidth: 3)
            
            Path { path in
                path.move(to: CGPoint(x: 95, y: 180))
                path.addLine(to: CGPoint(x: 110, y: 180))
            }
            .stroke((viewModel.inputA != viewModel.inputB) ? activeColor : inactiveColor, lineWidth: 3)
            
            // AND1 output to OR
            Path { path in
                path.move(to: CGPoint(x: 160, y: 165))
                path.addLine(to: CGPoint(x: 190, y: 165))
            }
            .stroke((viewModel.inputA && viewModel.inputB) ? inactiveColor : viewModel.outputCo ? activeColor : inactiveColor, lineWidth: 3)
            
            Path { path in
                path.move(to: CGPoint(x: 190, y: 165))
                path.addLine(to: CGPoint(x: 190, y: 180))
            }
            .stroke((viewModel.inputA && viewModel.inputB) ? inactiveColor : viewModel.outputCo ? activeColor : inactiveColor, lineWidth: 3)
            
            Path { path in
                path.move(to: CGPoint(x: 190, y: 180))
                path.addLine(to: CGPoint(x: 230, y: 180))
            }
            .stroke((viewModel.inputA && viewModel.inputB) ? inactiveColor : viewModel.outputCo ? activeColor : inactiveColor, lineWidth: 3)
            
            // AND2 output to OR
            Path { path in
                path.move(to: CGPoint(x: 160, y: 255))
                path.addLine(to: CGPoint(x: 190, y: 255))
            }
            .stroke(viewModel.outputCo ? activeColor : inactiveColor, lineWidth: 3)
            
            Path { path in
                path.move(to: CGPoint(x: 190, y: 255))
                path.addLine(to: CGPoint(x: 190, y: 210))
            }
            .stroke(viewModel.outputCo ? activeColor : inactiveColor, lineWidth: 3)
            
            Path { path in
                path.move(to: CGPoint(x: 190, y: 210))
                path.addLine(to: CGPoint(x: 230, y: 210))
            }
            .stroke(viewModel.outputCo ? activeColor : inactiveColor, lineWidth: 3)
            
            // OR output to COUT
            Path { path in
                path.move(to: CGPoint(x: 278, y: 195))
                path.addLine(to: CGPoint(x: 325, y: 195))
            }
            .stroke(viewModel.outputCo ? activeColor : inactiveColor, lineWidth: 3)
        }
    }
}
