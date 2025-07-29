//
//  ADDGateLayout.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 22/07/25.
//

import SwiftUI

struct ADDGateLayout: View {
    @ObservedObject var viewModel: ADDViewModel
    
    var body: some View {
        HStack(alignment: .top, spacing: 40) {
            // Inputs
            VStack(spacing: 20) {
                ADDLogicNode(imageName: viewModel.inputA ? "IN_On" : "IN_Off", label: "A")
                ADDLogicNode(imageName: viewModel.inputB ? "IN_On" : "IN_Off", label: "B")
                ADDLogicNode(imageName: viewModel.inputCi ? "IN_On" : "IN_Off", label: "Ci", font: .caption)
            }
            
            // Gates
            VStack(alignment: .leading, spacing: 25) {
                HStack(alignment: .top, spacing: 50) {
                    Image(((viewModel.inputA || viewModel.inputB)) && (viewModel.inputA != viewModel.inputB) ? "XOR_On" : "XOR")
                        .resizable()
                        .frame(width: 60, height: 60)
                    Image(viewModel.outputS ? "XOR_On" : "XOR").resizable().frame(width: 60, height: 60).padding(.top, 35)
                }
                
                HStack(alignment: .top, spacing: 50) {
                    VStack(spacing: 30) {
                        Image((viewModel.inputA && viewModel.inputB && viewModel.inputCi) ? "AND" : ((viewModel.inputA || viewModel.inputB) && viewModel.inputCi) ? "AND_On" : "AND")
                            .resizable()
                            .frame(width: 60, height: 60)
                        Image(viewModel.outputCo || (viewModel.inputA && viewModel.inputB) ? "AND_On" : "AND").resizable().frame(width: 60, height: 60)
                    }
                    .padding(.leading, 50)
                    
                    Image(viewModel.outputCo ? "OR_On" : "OR").resizable().frame(width: 60, height: 60).padding(.top, 30)
                }
            }
            
            // Outputs
            VStack(spacing: 95) {
                ADDLogicNode(imageName: viewModel.outputS ? "OUT_On" : "OUT_Off", label: "S")
                ADDLogicNode(imageName: viewModel.outputCo ? "OUT_On" : "OUT_Off", label: "Co", font: .caption)
            }
            .padding(.top, 55)
        }
    }
}
