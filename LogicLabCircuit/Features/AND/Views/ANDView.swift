//
//  ANDView.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 26/07/25.
//

import SwiftUI

struct ANDView: View {
    @ObservedObject var viewModel: ANDViewModel

    var body: some View {
        VStack(spacing: -100) {
            Text("AND Logic Gate")
                .font(.title3)
                .bold()
            
            ZStack {
                ANDWirePath(viewModel: viewModel)
                ANDGateLayout(viewModel: viewModel)
            }
            .frame(width: 360, height: 300)
            .onChange(of: viewModel.inputA) { viewModel.computeOutput() }
            .onChange(of: viewModel.inputB) { viewModel.computeOutput() }
        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
    }
}

#Preview {
    let vm = ANDViewModel()
    vm.inputA = false
    vm.inputB = true
    vm.computeOutput()
    return ANDView(viewModel: vm)
}
