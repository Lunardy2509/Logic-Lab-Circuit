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
    @ObservedObject var subViewModel: SUBViewModel
    
    var body: some View {
        VStack {
            Text("Logic Lab Circuit").bold()
                .font(.title)
            Text("Simulator")
                .font(.title3)
            
            // Picker for selecting operation
            Picker("Operation", selection: $viewModel.selectedOperation) {
                ForEach(ALUOperation.allCases, id: \.self) { operation in
                    Text(operation.rawValue).tag(operation)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            Divider()
            
            // Dynamically display the selected view
            Group {
                switch viewModel.selectedOperation {
                case .add:
                    ADDView(viewModel: addViewModel)
                case .sub:
                    SUBView(viewModel: subViewModel)
                default:
                    Text("Operation not supported yet.")
                        .font(.headline)
                        .foregroundColor(.gray)
                }
                
            }
            .frame(width: 300, height: 300)
            // Inputs below the picker
            HStack {
                VStack {
                    Text("Input A")
                    Toggle("", isOn: Binding(
                        get: { addViewModel.inputA || subViewModel.inputA },
                        set: { value in
                            addViewModel.inputA = value
                            subViewModel.inputA = value
                        }
                    ))
                    .labelsHidden()
                    .padding()
                }
                
                VStack {
                    Text("Input B")
                    Toggle("", isOn: Binding(
                        get: { addViewModel.inputB || subViewModel.inputB },
                        set: { value in
                            addViewModel.inputB = value
                            subViewModel.inputB = value
                        }
                    ))
                    .labelsHidden()
                    .padding()
                }
                
                VStack {
                    Text("Input Ci")
                    Toggle("", isOn: Binding(
                        get: { addViewModel.inputCi || subViewModel.inputCi },
                        set: { value in
                            addViewModel.inputCi = value
                            subViewModel.inputCi = value
                        }
                    ))
                    .labelsHidden()
                    .padding()
                }
            }
            
            Spacer()
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
}

#Preview {
    MainView(viewModel: MainViewModel(), addViewModel: ADDViewModel(), subViewModel: SUBViewModel())
}
