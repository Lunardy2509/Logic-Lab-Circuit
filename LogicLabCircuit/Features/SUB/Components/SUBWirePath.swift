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
        ZStack {
            // A to NOT gate
            Path { path in
                path.move(to: CGPoint(x: 18, y: 60))
                path.addLine(to: CGPoint(x: 40, y: 60))
            }
            .stroke(viewModel.inputA ? activeColor : inactiveColor, lineWidth: 3)
            
            // dot at A output to XOR1
            Path { path in
                path.addEllipse(in: CGRect(x: 25 - r, y: 60 - r, width: r * 2, height: r * 2))
            }
            .stroke(viewModel.inputA ? activeColor : inactiveColor, lineWidth: 3)

            // NOT1 output to AND1
            Path { path in
                path.move(to: CGPoint(x: 70, y: 62.5))
                path.addLine(to: CGPoint(x: 90, y: 62.5))
            }
            .stroke((!viewModel.inputA) ? activeColor : inactiveColor, lineWidth: 3)
            
            // B to AND1
            Path { path in
                path.move(to: CGPoint(x: 18, y: 100))
                path.addLine(to: CGPoint(x: 70, y: 100))
            }
            .stroke(viewModel.inputB ? activeColor : inactiveColor, lineWidth: 3)
            
            Path { path in
                path.move(to: CGPoint(x: 70, y: 82.5))
                path.addLine(to: CGPoint(x: 70, y: 100))
            }
            .stroke(viewModel.inputB ? activeColor : inactiveColor, lineWidth: 3)
            
            // dot at B output to AND1
            Path { path in
                path.addEllipse(in: CGRect(x: 70 - r, y: 100 - r, width: r * 2, height: r * 2))
            }
            .stroke(viewModel.inputB ? activeColor : inactiveColor, lineWidth: 3)
            
            Path { path in
                path.move(to: CGPoint(x: 70, y: 82.5))
                path.addLine(to: CGPoint(x: 90, y: 82.5))
            }
            .stroke(viewModel.inputB ? activeColor : inactiveColor, lineWidth: 3)

            // AND1 to OR
            Path { path in
                path.move(to: CGPoint(x: 135, y: 70))
                path.addLine(to: CGPoint(x: 275, y: 70))
            }
            .stroke((!viewModel.inputA && viewModel.inputB) ? activeColor : inactiveColor, lineWidth: 3)
            
            // dot at AND1 output to NOT
            Path { path in
                path.addEllipse(in: CGRect(x: 145 - r, y: 70 - r, width: r * 2, height: r * 2))
            }
            .stroke((!viewModel.inputA && viewModel.inputB) ? activeColor : inactiveColor, lineWidth: 3)
            
            // OR to D (Difference)
            Path { path in
                path.move(to: CGPoint(x: 310, y: 80))
                path.addLine(to: CGPoint(x: 345, y: 80))
            }
            .stroke(viewModel.outputD ? activeColor : inactiveColor, lineWidth: 3)
            
            // A to XOR1
            Path { path in
                path.move(to: CGPoint(x: 25, y: 60))
                path.addLine(to: CGPoint(x: 25, y: 190))
            }
            .stroke(viewModel.inputA ? activeColor : inactiveColor, lineWidth: 3)
            
            Path { path in
                path.move(to: CGPoint(x: 25, y: 190))
                path.addLine(to: CGPoint(x: 95, y: 190))
            }
            .stroke(viewModel.inputA ? activeColor : inactiveColor, lineWidth: 3)

            // B to XOR1
            Path { path in
                path.move(to: CGPoint(x: 70, y: 100))
                path.addLine(to: CGPoint(x: 70, y: 170))
            }
            .stroke(viewModel.inputB ? activeColor : inactiveColor, lineWidth: 3)
            
            Path { path in
                path.move(to: CGPoint(x: 70, y: 170))
                path.addLine(to: CGPoint(x: 95, y: 170))
            }
            .stroke(viewModel.inputB ? activeColor : inactiveColor, lineWidth: 3)

            // XOR1 to XOR2
            Path { path in
                path.move(to: CGPoint(x: 135, y: 180))
                path.addLine(to: CGPoint(x: 180, y: 180))
            }
            .stroke((viewModel.inputA != viewModel.inputB) ? activeColor : inactiveColor, lineWidth: 3)
            
            Path { path in
                path.move(to: CGPoint(x: 180, y: 180))
                path.addLine(to: CGPoint(x: 180, y: 195))
            }
            .stroke((viewModel.inputA != viewModel.inputB) ? activeColor : inactiveColor, lineWidth: 3)
            
            Path { path in
                path.move(to: CGPoint(x: 180, y: 195))
                path.addLine(to: CGPoint(x: 275, y: 195))
            }
            .stroke((viewModel.inputA != viewModel.inputB) ? activeColor : inactiveColor, lineWidth: 3)

            // Ci to XOR2
            Path { path in
                path.move(to: CGPoint(x: 18, y: 215))
                path.addLine(to: CGPoint(x: 275, y: 215))
            }
            .stroke(viewModel.inputCi ? activeColor : inactiveColor, lineWidth: 3)
            
            // dot at Ci output to AND
            Path { path in
                path.addEllipse(in: CGRect(x: 160 - r, y: 215 - r, width: r * 2, height: r * 2))
            }
            .stroke(viewModel.inputCi ? activeColor : inactiveColor, lineWidth: 3)

            // AND1 to NOT2
            Path { path in
                path.move(to: CGPoint(x: 145, y: 70))
                path.addLine(to: CGPoint(x: 145, y: 102.5))
            }
            .stroke((!viewModel.inputA && viewModel.inputB) ? activeColor : inactiveColor, lineWidth: 3)
            
            Path { path in
                path.move(to: CGPoint(x: 145, y: 102.5))
                path.addLine(to: CGPoint(x: 160, y: 102.5))
            }
            .stroke((!viewModel.inputA && viewModel.inputB) ? activeColor : inactiveColor, lineWidth: 3)
            
            // NOT2 to AND2
            Path { path in
                path.move(to: CGPoint(x: 190, y: 102.5))
                path.addLine(to: CGPoint(x: 200, y: 102.5))
            }
            .stroke((!viewModel.inputA && !viewModel.inputB) ? activeColor : inactiveColor, lineWidth: 3)

            // Ci to AND2
            Path { path in
                path.move(to: CGPoint(x: 160, y: 125))
                path.addLine(to: CGPoint(x: 160, y: 215))
            }
            .stroke(viewModel.inputCi ? activeColor : inactiveColor, lineWidth: 3)
            
            Path { path in
                path.move(to: CGPoint(x: 160, y: 125))
                path.addLine(to: CGPoint(x: 200, y: 125))
            }
            .stroke(viewModel.inputCi ? activeColor : inactiveColor, lineWidth: 3)

            // AND2 to OR
            Path { path in
                path.move(to: CGPoint(x: 245, y: 115))
                path.addLine(to: CGPoint(x: 255, y: 115))
            }
            .stroke(((viewModel.inputA || viewModel.inputB) && viewModel.inputCi) ? inactiveColor : viewModel.inputCi ? activeColor : inactiveColor, lineWidth: 3)
            
            Path { path in
                path.move(to: CGPoint(x: 255, y: 90))
                path.addLine(to: CGPoint(x: 255, y: 115))
            }
            .stroke(((viewModel.inputA || viewModel.inputB) && viewModel.inputCi) ? inactiveColor : viewModel.inputCi ? activeColor : inactiveColor, lineWidth: 3)
            Path { path in
                path.move(to: CGPoint(x: 255, y: 90))
                path.addLine(to: CGPoint(x: 270, y: 90))
            }
            .stroke(((viewModel.inputA || viewModel.inputB) && viewModel.inputCi) ? inactiveColor : viewModel.inputCi ? activeColor : inactiveColor, lineWidth: 3)

            // XOR to Co (Borrow)
            Path { path in
                path.move(to: CGPoint(x: 317.5, y: 205))
                path.addLine(to: CGPoint(x: 345, y: 205))
            }
            .stroke(viewModel.outputCo ? activeColor : inactiveColor, lineWidth: 3)
        }
    }
}
