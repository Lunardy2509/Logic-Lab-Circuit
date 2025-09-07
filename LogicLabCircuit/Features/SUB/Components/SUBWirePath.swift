//
//  SUBWirePath.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 26/07/25.
//

import SwiftUI
import ComposableArchitecture

struct SUBWirePath: View {
    let store: StoreOf<SUBFeature>
    let activeColor = Color.green
    let inactiveColor = Color.gray
    let radius: CGFloat = 3.0

    var body: some View {
        WithViewStore(self.store, observe: { $0 }, content: { viewStore in
            ZStack {
                // A to NOT gate
                Path { path in
                    path.move(to: CGPoint(x: 18, y: 60))
                    path.addLine(to: CGPoint(x: 40, y: 60))
                }
                .stroke(viewStore.inputA ? activeColor : inactiveColor, lineWidth: 3)
                
                // dot at A output to XOR1
                Path { path in
                    path.addEllipse(in: CGRect(x: 25 - radius, y: 60 - radius, width: radius * 2, height: radius * 2))
                }
                .stroke(viewStore.inputA ? activeColor : inactiveColor, lineWidth: 3)
                
                // NOT1 output to AND1
                Path { path in
                    path.move(to: CGPoint(x: 70, y: 62.5))
                    path.addLine(to: CGPoint(x: 90, y: 62.5))
                }
                .stroke((!viewStore.inputA) ? activeColor : inactiveColor, lineWidth: 3)
                
                // B to AND1
                Path { path in
                    path.move(to: CGPoint(x: 18, y: 100))
                    path.addLine(to: CGPoint(x: 70, y: 100))
                }
                .stroke(viewStore.inputB ? activeColor : inactiveColor, lineWidth: 3)
                
                Path { path in
                    path.move(to: CGPoint(x: 70, y: 82.5))
                    path.addLine(to: CGPoint(x: 70, y: 100))
                }
                .stroke(viewStore.inputB ? activeColor : inactiveColor, lineWidth: 3)
                
                // dot at B output to AND1
                Path { path in
                    path.addEllipse(in: CGRect(x: 70 - radius, y: 100 - radius, width: radius * 2, height: radius * 2))
                }
                .stroke(viewStore.inputB ? activeColor : inactiveColor, lineWidth: 3)
                
                Path { path in
                    path.move(to: CGPoint(x: 70, y: 82.5))
                    path.addLine(to: CGPoint(x: 90, y: 82.5))
                }
                .stroke(viewStore.inputB ? activeColor : inactiveColor, lineWidth: 3)
                
                // AND1 to OR
                Path { path in
                    path.move(to: CGPoint(x: 135, y: 70))
                    path.addLine(to: CGPoint(x: 275, y: 70))
                }
                .stroke((!viewStore.inputA && viewStore.inputB) ? activeColor : inactiveColor, lineWidth: 3)
                
                // dot at AND1 output to NOT
                Path { path in
                    path.addEllipse(in: CGRect(x: 145 - radius, y: 70 - radius, width: radius * 2, height: radius * 2))
                }
                .stroke((!viewStore.inputA && viewStore.inputB) ? activeColor : inactiveColor, lineWidth: 3)
                
                // OR to D (Difference)
                Path { path in
                    path.move(to: CGPoint(x: 310, y: 80))
                    path.addLine(to: CGPoint(x: 345, y: 80))
                }
                .stroke(viewStore.outputD ? activeColor : inactiveColor, lineWidth: 3)
                
                // A to XOR1
                Path { path in
                    path.move(to: CGPoint(x: 25, y: 60))
                    path.addLine(to: CGPoint(x: 25, y: 190))
                }
                .stroke(viewStore.inputA ? activeColor : inactiveColor, lineWidth: 3)
                
                Path { path in
                    path.move(to: CGPoint(x: 25, y: 190))
                    path.addLine(to: CGPoint(x: 95, y: 190))
                }
                .stroke(viewStore.inputA ? activeColor : inactiveColor, lineWidth: 3)
                
                // B to XOR1
                Path { path in
                    path.move(to: CGPoint(x: 70, y: 100))
                    path.addLine(to: CGPoint(x: 70, y: 170))
                }
                .stroke(viewStore.inputB ? activeColor : inactiveColor, lineWidth: 3)
                
                Path { path in
                    path.move(to: CGPoint(x: 70, y: 170))
                    path.addLine(to: CGPoint(x: 95, y: 170))
                }
                .stroke(viewStore.inputB ? activeColor : inactiveColor, lineWidth: 3)
                
                // XOR1 to XOR2
                Path { path in
                    path.move(to: CGPoint(x: 135, y: 180))
                    path.addLine(to: CGPoint(x: 180, y: 180))
                }
                .stroke((viewStore.inputA != viewStore.inputB) ? activeColor : inactiveColor, lineWidth: 3)
                
                Path { path in
                    path.move(to: CGPoint(x: 180, y: 180))
                    path.addLine(to: CGPoint(x: 180, y: 195))
                }
                .stroke((viewStore.inputA != viewStore.inputB) ? activeColor : inactiveColor, lineWidth: 3)
                
                Path { path in
                    path.move(to: CGPoint(x: 180, y: 195))
                    path.addLine(to: CGPoint(x: 275, y: 195))
                }
                .stroke((viewStore.inputA != viewStore.inputB) ? activeColor : inactiveColor, lineWidth: 3)
                
                // Ci to XOR2
                Path { path in
                    path.move(to: CGPoint(x: 18, y: 215))
                    path.addLine(to: CGPoint(x: 275, y: 215))
                }
                .stroke(viewStore.inputCi ? activeColor : inactiveColor, lineWidth: 3)
                
                // dot at Ci output to AND
                Path { path in
                    path.addEllipse(in: CGRect(x: 160 - radius, y: 215 - radius, width: radius * 2, height: radius * 2))
                }
                .stroke(viewStore.inputCi ? activeColor : inactiveColor, lineWidth: 3)
                
                // AND1 to NOT2
                Path { path in
                    path.move(to: CGPoint(x: 145, y: 70))
                    path.addLine(to: CGPoint(x: 145, y: 102.5))
                }
                .stroke((!viewStore.inputA && viewStore.inputB) ? activeColor : inactiveColor, lineWidth: 3)
                
                Path { path in
                    path.move(to: CGPoint(x: 145, y: 102.5))
                    path.addLine(to: CGPoint(x: 160, y: 102.5))
                }
                .stroke((!viewStore.inputA && viewStore.inputB) ? activeColor : inactiveColor, lineWidth: 3)
                
                // NOT2 to AND2
                Path { path in
                    path.move(to: CGPoint(x: 190, y: 102.5))
                    path.addLine(to: CGPoint(x: 200, y: 102.5))
                }
                .stroke((!viewStore.inputA && !viewStore.inputB) ? activeColor : inactiveColor, lineWidth: 3)
                
                // Ci to AND2
                Path { path in
                    path.move(to: CGPoint(x: 160, y: 125))
                    path.addLine(to: CGPoint(x: 160, y: 215))
                }
                .stroke(viewStore.inputCi ? activeColor : inactiveColor, lineWidth: 3)
                
                Path { path in
                    path.move(to: CGPoint(x: 160, y: 125))
                    path.addLine(to: CGPoint(x: 200, y: 125))
                }
                .stroke(viewStore.inputCi ? activeColor : inactiveColor, lineWidth: 3)
                
                // AND2 to OR
                Path { path in
                    path.move(to: CGPoint(x: 245, y: 115))
                    path.addLine(to: CGPoint(x: 255, y: 115))
                }
                .stroke(((viewStore.inputA || viewStore.inputB) && viewStore.inputCi) ? inactiveColor : viewStore.inputCi ? activeColor : inactiveColor, lineWidth: 3)
                
                Path { path in
                    path.move(to: CGPoint(x: 255, y: 90))
                    path.addLine(to: CGPoint(x: 255, y: 115))
                }
                .stroke(((viewStore.inputA || viewStore.inputB) && viewStore.inputCi) ? inactiveColor : viewStore.inputCi ? activeColor : inactiveColor, lineWidth: 3)
                Path { path in
                    path.move(to: CGPoint(x: 255, y: 90))
                    path.addLine(to: CGPoint(x: 270, y: 90))
                }
                .stroke(((viewStore.inputA || viewStore.inputB) && viewStore.inputCi) ? inactiveColor : viewStore.inputCi ? activeColor : inactiveColor, lineWidth: 3)
                
                // XOR to Co (Borrow)
                Path { path in
                    path.move(to: CGPoint(x: 317.5, y: 205))
                    path.addLine(to: CGPoint(x: 345, y: 205))
                }
                .stroke(viewStore.outputCo ? activeColor : inactiveColor, lineWidth: 3)
            }
        })
    }
}
