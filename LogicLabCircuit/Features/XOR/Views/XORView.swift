//
//  XORView.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 26/07/25.
//

import SwiftUI
import ComposableArchitecture

struct XORView: View {
    let store: StoreOf<XORFeature>

    var body: some View {
        WithViewStore(self.store, observe: { $0 }, content: { viewStore in
            VStack(spacing: -100) {
                Text("XOR Logic Gate")
                    .font(.title3)
                    .bold()
                
                ZStack {
                    XORWirePath(store: store)
                    XORGateLayout(store: store)
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
    XORView(
        store: Store(initialState: XORFeature.State(inputA: false, inputB: true)) {
            XORFeature()
        }
    )
}
