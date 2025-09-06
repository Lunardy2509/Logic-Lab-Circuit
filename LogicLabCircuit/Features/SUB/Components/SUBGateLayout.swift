//
//  SUBGateLayout.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 26/07/25.
//

import SwiftUI

struct SUBGateLayout: View {
    @ObservedObject var viewModel: SUBViewModel

    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            // Inputs
            VStack(spacing: 20) {
                logicNode(imageName: viewModel.inputA ? "IN_On" : "IN_Off", label: "A")
                logicNode(imageName: viewModel.inputB ? "IN_On" : "IN_Off", label: "B")
                VStack {
                    logicNode(imageName: viewModel.inputCi ? "IN_On" : "IN_Off", label: "Bi", font: .caption)
                }
                .padding(.top, 75)
            }
            .padding(.top, 5)

            // Gates
            VStack(alignment: .leading, spacing: 15) {
                HStack(alignment: .top, spacing: 15) {
                    Image(viewModel.inputA ? "NOT_On" : "NOT").resizable().frame(width: 35, height: 35) // NOT A
                    Image(viewModel.inputA && viewModel.inputB ? "AND_On" : "AND").resizable().frame(width: 50, height: 50) // AND1 (¬A & B)
                    HStack {
                        HStack {
                            Image(viewModel.inputA != viewModel.inputB ? "NOT_On" : "NOT").resizable().frame(width: 35, height: 35) // XOR1 (A ⊕ B)
                        }
                        .padding(.bottom, 20)
                        Image((viewModel.inputCi) ? "AND_On" : "AND").resizable().frame(width: 50, height: 50) // XOR2 ((A⊕B)⊕Ci)
                    }
                    .padding(.top, 40)
                    HStack {
                        Image(viewModel.outputCo ? "OR_On" : "OR").resizable().frame(width: 50, height: 50) // OR (AND1 | AND2)
                    }
                    .padding(.top, 10)
                }
                HStack {
                    HStack {
                        Image(viewModel.inputA != viewModel.inputB ? "XOR_On" : "XOR").resizable().frame(width: 50, height: 50) // AND2 (Ci & XOR1)
                    }
                    .padding(.bottom, 50)
                    .padding(.leading, 50)
                    Spacer()
                    Image(viewModel.outputD ? "XOR_On" : "XOR").resizable().frame(width: 50, height: 50) // OR (AND1 | AND2)
                }
            }

            // Outputs
            VStack(spacing: 105) {
                logicNode(imageName: viewModel.outputD ? "OUT_On" : "OUT_Off", label: "D")
                logicNode(imageName: viewModel.outputCo ? "OUT_On" : "OUT_Off", label: "Bo", font: .caption)
            }
            .padding(.top, 25)
        }
    }

    private func logicNode(imageName: String, label: String, font: Font = .footnote) -> some View {
        ZStack {
            Image(imageName)
                .resizable()
                .frame(width: 20, height: 20)
            Text(label)
                .font(font)
                .foregroundStyle(Color(.black))
        }
    }
}
