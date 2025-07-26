//
//  ALUView.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 06/07/25.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: MainViewModel
    @ObservedObject var addViewModel: ADDViewModel

    var body: some View {
        VStack(spacing: 20) {
            Text("Logic Lab Circuit").bold()
                .font(.title)

            HStack {
                VStack {
                    Text("Input A")
                    Toggle("", isOn: $addViewModel.inputA)
                        .labelsHidden()
                        .padding()
                }

                VStack {
                    Text("Input B")
                    Toggle("", isOn: $addViewModel.inputB)
                        .labelsHidden()
                        .padding()
                }

                VStack {
                    Text("Input Ci")
                    Toggle("", isOn: $addViewModel.inputCi)
                        .labelsHidden()
                        .padding()
                }
            }

            Divider()

            ADDView(viewModel: addViewModel)

            if viewModel.isTapped {
                Text("Result")
                    .font(.headline)
                Text("Decimal: \(viewModel.result)")
                Text("Binary: \(viewModel.binaryResult)")
                Text("Hex: \(viewModel.hexResult)")
            }

            Spacer()
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
}

#Preview {
    MainView(viewModel: MainViewModel(), addViewModel: ADDViewModel())
}
