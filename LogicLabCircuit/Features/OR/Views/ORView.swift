//
//  ORView.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 26/07/25.
//

import SwiftUI

struct ORView: View {
    @ObservedObject var viewModel: ORViewModel

    var body: some View {
        ZStack {
            ORWirePath(viewModel: viewModel)
            ORGateLayout(viewModel: viewModel)
        }
        .frame(width: 360, height: 300)
        .onChange(of: viewModel.inputA) { viewModel.computeOutput() }
        .onChange(of: viewModel.inputB) { viewModel.computeOutput() }
    }
}
#Preview {
    let vm = ORViewModel()
    vm.inputA = false
    vm.inputB = true
    vm.computeOutput()
    return ORView(viewModel: vm)
}
