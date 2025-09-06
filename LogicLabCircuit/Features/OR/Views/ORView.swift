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
        VStack(spacing: -100) {
            Text("OR Logic Gate")
                .font(.title3)
                .bold()
            
            ZStack {
                ORWirePath(viewModel: viewModel)
                ORGateLayout(viewModel: viewModel)
            }
            .frame(width: 360, height: 300)
            .onChange(of: viewModel.inputA) { viewModel.computeOutput() }
            .onChange(of: viewModel.inputB) { viewModel.computeOutput() }
        }
    }
}
#Preview {
    let viewModel = ORViewModel()
    viewModel.inputA = false
    viewModel.inputB = true
    viewModel.computeOutput()
    return ORView(viewModel: viewModel)
}
