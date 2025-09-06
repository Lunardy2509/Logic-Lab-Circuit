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
        VStack(spacing: -100) {
            Text("XOR Logic Gate")
                .font(.title3)
                .bold()
            
            ZStack {
                XORWirePath(viewModel: viewModel)
                XORGateLayout(viewModel: viewModel)
            }
            .frame(width: 360, height: 300)
            .onChange(of: viewModel.inputA) { viewModel.computeOutput() }
            .onChange(of: viewModel.inputB) { viewModel.computeOutput() }
        }
    }
}

#Preview {
    let viewModel = XORViewModel()
    viewModel.inputA = false
    viewModel.inputB = true
    viewModel.computeOutput()
    return XORView(viewModel: viewModel)
}
