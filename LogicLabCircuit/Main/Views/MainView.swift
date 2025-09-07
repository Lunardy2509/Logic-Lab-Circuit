//
//  MainView.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 06/07/25.
//

import SwiftUI
import ComposableArchitecture

struct MainView: View {
    let store: StoreOf<MainFeature>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }, content: { viewStore in
            VStack {
                Text("Logic Lab Circuit").bold()
                    .font(.title)
                Text("Simulator")
                    .font(.title3)
                
                // Picker for selecting operation
                Picker("Operation", selection: viewStore.binding(
                    get: \.selectedOperation,
                    send: MainFeature.Action.operationChanged
                )) {
                    ForEach(ALUOperation.allCases, id: \.self) { operation in
                        Text(operation.rawValue).tag(operation)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                Divider()
                
                // Dynamically display the selected view
                Group {
                    switch viewStore.selectedOperation {
                    case .add:
                        ADDView(store: store.scope(state: \.addFeature, action: \.addFeature))
                    case .sub:
                        SUBView(store: store.scope(state: \.subFeature, action: \.subFeature))
                    case .andGate:
                        ANDView(store: store.scope(state: \.andFeature, action: \.andFeature))
                    case .orGate:
                        ORView(store: store.scope(state: \.orFeature, action: \.orFeature))
                    case .xorGate:
                        XORView(store: store.scope(state: \.xorFeature, action: \.xorFeature))
                    }
                }
                .frame(width: 300, height: 300)
                .padding()
                
                // Inputs below the picker
                HStack {
                    VStack {
                        Text("Input A")
                        Toggle("", isOn: viewStore.binding(
                            get: \.inputA,
                            send: MainFeature.Action.inputAChanged
                        ))
                        .labelsHidden()
                        .padding()
                    }
                    
                    VStack {
                        Text("Input B")
                        Toggle("", isOn: viewStore.binding(
                            get: \.inputB,
                            send: MainFeature.Action.inputBChanged
                        ))
                        .labelsHidden()
                        .padding()
                    }
                    
                    if viewStore.selectedOperation == .add || viewStore.selectedOperation == .sub {
                        VStack {
                            Text("Input Ci")
                            Toggle("", isOn: viewStore.binding(
                                get: \.inputCi,
                                send: MainFeature.Action.inputCiChanged
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
                        ForEach(getFormula(for: viewStore.selectedOperation), id: \.self) { formula in
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
        })
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
        store: Store(initialState: MainFeature.State()) {
            MainFeature()
        }
    )
}
