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

#Preview {
    let vm = SUBViewModel()
    vm.inputA = true
    vm.inputB = false
    vm.inputCi = true
    vm.computeOutput()
    return SUBView(viewModel: vm)
}
