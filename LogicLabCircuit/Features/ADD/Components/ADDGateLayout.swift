//
//  ADDGateLayout.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 22/07/25.
//

import SwiftUI
import ComposableArchitecture

struct ADDGateLayout: View {
    let store: StoreOf<ADDFeature>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }, content: { viewStore in
            let andAB = viewStore.inputA && viewStore.inputB
            let orAB = viewStore.inputA || viewStore.inputB
            let xorAB = viewStore.inputA != viewStore.inputB
            HStack(alignment: .top, spacing: 40) {
                // Inputs
                VStack(spacing: 20) {
                    ADDLogicNode(imageName: viewStore.inputA ? "IN_On" : "IN_Off", label: "A")
                    ADDLogicNode(imageName: viewStore.inputB ? "IN_On" : "IN_Off", label: "B")
                    ADDLogicNode(imageName: viewStore.inputCi ? "IN_On" : "IN_Off", label: "Ci", font: .caption)
                }
                
                // Gates
                VStack(alignment: .leading, spacing: 25) {
                    HStack(alignment: .top, spacing: 50) {
                        Image(orAB && xorAB ? "XOR_On" : "XOR")
                            .resizable()
                            .frame(width: 60, height: 60)
                        Image(viewStore.outputS ? "XOR_On" : "XOR").resizable().frame(width: 60, height: 60).padding(.top, 35)
                    }
                    
                    HStack(alignment: .top, spacing: 50) {
                        VStack(spacing: 30) {
                            let and1AllInputsOn = andAB && viewStore.inputCi
                            let and1PartialInputsOn = orAB && viewStore.inputCi
                            Image(and1AllInputsOn ? "AND" : and1PartialInputsOn ? "AND_On" : "AND")
                                .resizable()
                                .frame(width: 60, height: 60)
                            Image(viewStore.outputCo || andAB ? "AND_On" : "AND")
                                .resizable()
                                .frame(width: 60, height: 60)
                        }
                        .padding(.leading, 50)
                        
                        Image(viewStore.outputCo ? "OR_On" : "OR").resizable().frame(width: 60, height: 60).padding(.top, 30)
                    }
                }
                
                // Outputs
                VStack(spacing: 95) {
                    ADDLogicNode(imageName: viewStore.outputS ? "OUT_On" : "OUT_Off", label: "S")
                    ADDLogicNode(imageName: viewStore.outputCo ? "OUT_On" : "OUT_Off", label: "Co", font: .caption)
                }
                .padding(.top, 55)
            }
        })
    }
}
