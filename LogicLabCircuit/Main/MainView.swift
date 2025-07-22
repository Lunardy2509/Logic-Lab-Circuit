//
//  ALUView.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 06/07/25.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel = MainViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Logic Lab Circuit").bold()
                .font(.title)
            Text("8-bit ALU simulator")
                .font(.title3)
            
            HStack {
                VStack {
                    Text("Input A")
                    TextField("Input A (0-255)", text: Binding(
                        get: { String(viewModel.inputA) },
                        set: { viewModel.inputA = UInt8(clamping: Int($0) ?? 0) }
                    ))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                }
                
                VStack {
                    Text("Input B")
                    TextField("Input B (0-255)", text: Binding(
                        get: { String(viewModel.inputB) },
                        set: { viewModel.inputB = UInt8(clamping: Int($0) ?? 0) }
                    ))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                }
            }
            
            HStack {
                Picker("Operation", selection: $viewModel.selectedOperation){
                    ForEach(ALUOperation.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .background(RoundedRectangle(cornerRadius: 10).fill(Color(.systemGray6)))
                
                Button(action: {
                    UIApplication.shared.endEditing()
                    viewModel.calculate()
                    viewModel.isTapped = true
                }) {
                    Text("Calculate").bold()
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color.blue)
                        .foregroundColor(.primary)
                        .cornerRadius(8)
                }
            }
            
            Divider()
            
            ADDView()
            
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
    MainView()
}
