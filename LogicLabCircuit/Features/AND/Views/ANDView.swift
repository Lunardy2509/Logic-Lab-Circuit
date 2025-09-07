//
//  ANDView.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 26/07/25.
//

import SwiftUI
import ComposableArchitecture

struct ANDView: View {
    let store: StoreOf<ANDFeature>

    var body: some View {
        WithViewStore(self.store, observe: { $0 }, content: { viewStore in
            VStack(spacing: 0) {
                Text("AND Logic Gate")
                    .font(.title3)
                    .bold()
                
                ZStack {
                    ANDWirePath(store: store)
                    ANDGateLayout(store: store)
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
            }
        })
    }
}

#Preview {
    ANDView(
        store: Store(initialState: ANDFeature.State(inputA: false, inputB: true)) {
            ANDFeature()
        }
    )
}
