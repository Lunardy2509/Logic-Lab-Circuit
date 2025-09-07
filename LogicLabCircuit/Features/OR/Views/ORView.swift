//
//  ORView.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 26/07/25.
//

import SwiftUI
import ComposableArchitecture

struct ORView: View {
    let store: StoreOf<ORFeature>

    var body: some View {
        WithViewStore(self.store, observe: { $0 }, content: { viewStore in
            VStack(spacing: 0) {
                Text("OR Logic Gate")
                    .font(.title3)
                    .bold()
                
                ZStack {
                    ORWirePath(store: store)
                    ORGateLayout(store: store)
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
    ORView(
        store: Store(initialState: ORFeature.State(inputA: false, inputB: true)) {
            ORFeature()
        }
    )
}
