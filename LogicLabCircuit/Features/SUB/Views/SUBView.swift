//
//  SUBView.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 26/07/25.
//

import SwiftUI

struct SUBView: View {
    @ObservedObject var viewModel: SUBViewModel

    var body: some View {
        VStack(spacing: 0) {
            Text("Full Subtractor Circuit")
                .font(.title3)
                .bold()
            
            ZStack {
                SUBWirePath(viewModel: viewModel)
                SUBGateLayout(viewModel: viewModel)
            }
            .frame(width: 360, height: 300)
            .onChange(of: viewModel.inputA) { viewModel.computeOutput() }
            .onChange(of: viewModel.inputB) { viewModel.computeOutput() }
            .onChange(of: viewModel.inputCi) { viewModel.computeOutput() }
        }
    }
}

#Preview {
    let viewModel = SUBViewModel()
    viewModel.inputA = true
    viewModel.inputB = false
    viewModel.inputCi = true
    viewModel.computeOutput()
    return SUBView(viewModel: viewModel)
}
