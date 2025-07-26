//
//  ANDGateLayout.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 26/07/25.
//

import SwiftUI

struct ANDGateLayout: View {
    @ObservedObject var viewModel: ANDViewModel

    var body: some View {
        HStack(alignment: .top, spacing: 40) {
            // Inputs
            VStack(spacing: 20) {
                logicNode(imageName: viewModel.inputA ? "IN_On" : "IN_Off", label: "A")
                logicNode(imageName: viewModel.inputB ? "IN_On" : "IN_Off", label: "B")
            }

            // Gate
            VStack {
                Image(viewModel.output ? "AND_On" : "AND").resizable().frame(width: 60, height: 60)
            }

            // Output
            VStack {
                logicNode(imageName: viewModel.output ? "OUT_On" : "OUT_Off", label: "O")
            }
            .padding(.top, 20)
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
