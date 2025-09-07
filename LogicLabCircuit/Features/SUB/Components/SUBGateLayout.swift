//
//  SUBGateLayout.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 26/07/25.
//

import SwiftUI
import ComposableArchitecture

struct SUBGateLayout: View {
    let store: StoreOf<SUBFeature>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }, content: { viewStore in
            let orAB = viewStore.inputA || viewStore.inputB
            let xorAB = viewStore.inputA != viewStore.inputB
            let xnorAB = !(viewStore.inputA != viewStore.inputB)
            let notA = !viewStore.inputA
            HStack(alignment: .top, spacing: 20) {
                // Inputs
                VStack(spacing: 10) {
                    logicNode(imageName: viewStore.inputBi ? "IN_On" : "IN_Off", label: "Bin", font: .custom("SF Pro", size: 9))
                        .padding(.bottom, 10)
                    logicNode(imageName: viewStore.inputA ? "IN_On" : "IN_Off", label: "A")
                    logicNode(imageName: viewStore.inputB ? "IN_On" : "IN_Off", label: "B")
                }
                
                // Gates
                VStack(alignment: .leading) {
                    HStack(alignment: .top, spacing: 150) {
                        Image(xorAB ? "XOR_On" : "XOR").resizable().frame(width: 45, height: 45)
                            .padding(.leading, 20)
                            .padding(.top, 45)
                        Image(viewStore.outputD ? "XOR_On" : "XOR").resizable().frame(width: 45, height: 45)
                    }
                    
                    HStack(alignment: .top, spacing: 20) {
                        Spacer()
                        Image(orAB ? "NOT_On" : "NOT").resizable().frame(width: 30, height: 30)
                        Image(xnorAB && viewStore.inputBi ? "AND_On" : "AND").resizable().frame(width: 45, height: 45)
                        Image(viewStore.outputBo ? "OR_On" : "OR").resizable().frame(width: 45, height: 45)
                            .padding(.top, 10)
                    }
                    
                    HStack(alignment: .top, spacing: 15) {
                        Image(viewStore.inputA ? "NOT_On" : "NOT").resizable().frame(width: 30, height: 30)
                        Image(viewStore.inputB && notA ? "AND_On" : "AND").resizable().frame(width: 45, height: 45)
                    }
                    .padding(.leading, 25)
                }
                
                // Outputs
                VStack(spacing: 87.5) {
                    logicNode(imageName: viewStore.outputD ? "OUT_On" : "OUT_Off", label: "D")
                    logicNode(imageName: viewStore.outputBo ? "OUT_On" : "OUT_Off", label: "Bo", font: .custom("SF Pro", size: 9))
                }
                .padding(.top, 12.5)
            }
        })
    }
    
    private func logicNode(imageName: String, label: String, font: Font = .footnote) -> some View {
        ZStack {
            Image(imageName)
                .resizable()
                .frame(width: 20, height: 20)
            Text(label)
                .font(font)
                .foregroundStyle(Color(.black))
        }
    }
}
