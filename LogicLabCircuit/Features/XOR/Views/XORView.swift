//
//  XORView.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 26/07/25.
//

import SwiftUI

struct XORView: View {
    @ObservedObject var viewModel: XORViewModel

    var body: some View {
        ZStack {
            XORWirePath(viewModel: viewModel)
            XORGateLayout(viewModel: viewModel)
        }
        .frame(width: 360, height: 300)
        .onChange(of: viewModel.inputA) { viewModel.computeOutput() }
        .onChange(of: viewModel.inputB) { viewModel.computeOutput() }
    }
}

#Preview {
    let vm = XORViewModel()
    vm.inputA = false
    vm.inputB = true
    vm.computeOutput()
    return XORView(viewModel: vm)
}
