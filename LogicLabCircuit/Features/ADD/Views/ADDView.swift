//
//  ADDView.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 06/07/25.
//

import SwiftUI
import ComposableArchitecture

struct ADDView: View {
    let store: StoreOf<ADDFeature>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }, content: { viewStore in
            VStack(spacing: 0) {
                Text("Full Adder Circuit")
                    .font(.title3)
                    .bold()
                
                ZStack {
                    ADDWirePath(store: store)
                    ADDGateLayout(store: store)
                }
                .frame(width: 300, height: 300)
                .onAppear {
                    viewStore.send(.computeOutput)
                }
                .onChange(of: viewStore.inputA) {
                    viewStore.send(.computeOutput)
                }
                .onChange(of: viewStore.inputB) {
                    viewStore.send(.computeOutput)
                }
                .onChange(of: viewStore.inputCi) {
                    viewStore.send(.computeOutput)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
        })
    }
}

#Preview {
    ADDView(
        store: Store(initialState: ADDFeature.State()) {
            ADDFeature()
        }
    )
}
