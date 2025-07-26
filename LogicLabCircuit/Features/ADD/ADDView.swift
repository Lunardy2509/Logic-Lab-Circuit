//
//  ADDView.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 06/07/25.
//

import SwiftUI

struct ADDView: View {
    @ObservedObject var viewModel: ADDViewModel

    var body: some View {
        ZStack {
            ADDWirePath(viewModel: viewModel)
            ADDGateLayout(viewModel: viewModel)
        }
        .frame(width: 300, height: 300)
        .onChange(of: viewModel.inputA) { viewModel.computeOutput() }
        .onChange(of: viewModel.inputB) { viewModel.computeOutput() }
        .onChange(of: viewModel.inputCi) { viewModel.computeOutput() }
    }
}

#Preview {
    ADDView(viewModel: ADDViewModel())
}
