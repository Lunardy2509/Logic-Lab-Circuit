//
//  MainView.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 06/07/25.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: MainViewModel
    @ObservedObject var addViewModel: ADDViewModel
    @ObservedObject var subViewModel: SUBViewModel
    @ObservedObject var andViewModel: ANDViewModel
    @ObservedObject var orViewModel: ORViewModel
    @ObservedObject var xorViewModel: XORViewModel
    
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
                case .andGate:
                    ANDView(viewModel: andViewModel)
                case .orGate:
                    ORView(viewModel: orViewModel)
                case .xorGate:
                    XORView(viewModel: xorViewModel)
                }
            }
            .frame(width: 300, height: 300)
            .padding()
            
            // Inputs below the picker
            HStack {
                VStack {
                    Text("Input A")
                    Toggle("", isOn: Binding(
                        get: { viewModel.inputA },
                        set: { value in
                            viewModel.inputA = value
                            updateInputA(value: value)
                        }
                    ))
                    .labelsHidden()
                    .padding()
                }
                
                VStack {
                    Text("Input B")
                    Toggle("", isOn: Binding(
                        get: { viewModel.inputB },
                        set: { value in
                            viewModel.inputB = value
                            updateInputB(value: value)
                        }
                    ))
                    .labelsHidden()
                    .padding()
                }
                
                if viewModel.selectedOperation == .add || viewModel.selectedOperation == .sub {
                    VStack {
                        Text("Input Ci")
                        Toggle("", isOn: Binding(
                            get: { viewModel.inputCi },
                            set: { value in
                                viewModel.inputCi = value
                                updateInputCi(value: value)
                            }
                        ))
                        .labelsHidden()
                        .padding()
                    }
                }
            }
            
            // Basic Formula of the Logic Circuit
            VStack(alignment: .leading) {
                Text("Formula:")
                    .font(.headline)
                VStack(alignment: .leading, spacing: 5) {
                    ForEach(getFormula(for: viewModel.selectedOperation), id: \.self) { formula in
                        Text("• \(formula)")
                            .font(.body)
                            .foregroundColor(.primary)
                    }
                }
            }
            .padding()
            
            Spacer()
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
    
    private func updateInputA(value: Bool) {
        addViewModel.inputA = value
        subViewModel.inputA = value
        andViewModel.inputA = value
        orViewModel.inputA = value
        xorViewModel.inputA = value
    }
    
    private func updateInputB(value: Bool) {
        addViewModel.inputB = value
        subViewModel.inputB = value
        andViewModel.inputB = value
        orViewModel.inputB = value
        xorViewModel.inputB = value
    }
    
    private func updateInputCi(value: Bool) {
        addViewModel.inputCi = value
        subViewModel.inputCi = value
    }
    
    private func getFormula(for operation: ALUOperation) -> [String] {
        switch operation {
        case .add:
            return ["Sum: \(FullAdderFormula.sum)", "Carry Out: \(FullAdderFormula.carryOut)"]
        case .sub:
            return ["Difference: \(FullSubtractorFormula.difference)", "Borrow: \(FullSubtractorFormula.carryOut)"]
        case .andGate:
            return ["Conjunction: \(ANDFormula.conjunction)"]
        case .orGate:
            return ["Disjunction: \(ORFormula.disjunction)"]
        case .xorGate:
            return ["Exclusive OR: \(XORFormula.exclusiveOr)"]
        }
    }
}

#Preview {
    MainView(
        viewModel: MainViewModel(),
        addViewModel: ADDViewModel(),
        subViewModel: SUBViewModel(),
        andViewModel: ANDViewModel(),
        orViewModel: ORViewModel(),
        xorViewModel: XORViewModel()
    )
}
