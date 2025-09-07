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
            HStack(alignment: .top, spacing: 20) {
                // Inputs
                VStack(spacing: 20) {
                    logicNode(imageName: viewStore.inputA ? "IN_On" : "IN_Off", label: "A")
                    logicNode(imageName: viewStore.inputB ? "IN_On" : "IN_Off", label: "B")
                    VStack {
                        logicNode(imageName: viewStore.inputCi ? "IN_On" : "IN_Off", label: "Bi", font: .caption)
                    }
                    .padding(.top, 75)
                }
                .padding(.top, 5)
                
                // Gates
                VStack(alignment: .leading, spacing: 15) {
                    HStack(alignment: .top, spacing: 15) {
                        Image(viewStore.inputA ? "NOT_On" : "NOT").resizable().frame(width: 35, height: 35) // NOT A
                        Image(viewStore.inputA && viewStore.inputB ? "AND_On" : "AND").resizable().frame(width: 50, height: 50) // AND1 (¬A & B)
                        HStack {
                            HStack {
                                Image(viewStore.inputA != viewStore.inputB ? "NOT_On" : "NOT").resizable().frame(width: 35, height: 35) // XOR1 (A ⊕ B)
                            }
                            .padding(.bottom, 20)
                            Image((viewStore.inputCi) ? "AND_On" : "AND").resizable().frame(width: 50, height: 50) // XOR2 ((A⊕B)⊕Ci)
                        }
                        .padding(.top, 40)
                        HStack {
                            Image(viewStore.outputCo ? "OR_On" : "OR").resizable().frame(width: 50, height: 50) // OR (AND1 | AND2)
                        }
                        .padding(.top, 10)
                    }
                    HStack {
                        HStack {
                            Image(viewStore.inputA != viewStore.inputB ? "XOR_On" : "XOR").resizable().frame(width: 50, height: 50) // AND2 (Ci & XOR1)
                        }
                        .padding(.bottom, 50)
                        .padding(.leading, 50)
                        Spacer()
                        Image(viewStore.outputD ? "XOR_On" : "XOR").resizable().frame(width: 50, height: 50) // OR (AND1 | AND2)
                    }
                }
                
                // Outputs
                VStack(spacing: 105) {
                    logicNode(imageName: viewStore.outputD ? "OUT_On" : "OUT_Off", label: "D")
                    logicNode(imageName: viewStore.outputCo ? "OUT_On" : "OUT_Off", label: "Bo", font: .caption)
                }
                .padding(.top, 25)
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
