//
//  SUBView.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 26/07/25.
//

import SwiftUI
import ComposableArchitecture

struct SUBView: View {
    let store: StoreOf<SUBFeature>

    var body: some View {
        WithViewStore(self.store, observe: { $0 }, content: { viewStore in
            VStack(spacing: 0) {
                Text("Full Subtractor Circuit")
                    .font(.title3)
                    .bold()
                
                ZStack {
                    SUBWirePath(store: store)
                    SUBGateLayout(store: store)
                }
                .frame(width: 360, height: 300)
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
        })
    }
}

#Preview {
    SUBView(
        store: Store(initialState: SUBFeature.State(inputA: true, inputB: false, inputCi: true)) {
            SUBFeature()
        }
    )
}
