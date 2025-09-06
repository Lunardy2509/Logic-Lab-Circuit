//
//  XORViewModel.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 26/07/25.
//

import Combine
import Foundation

final class XORViewModel: ObservableObject {
    @Published var inputA: Bool = false
    @Published var inputB: Bool = false
    @Published var output: Bool = false

    func computeOutput() {
        let intA: UInt8 = inputA ? 1 : 0
        let intB: UInt8 = inputB ? 1 : 0
        let result = ALUModel.compute(intA: intA, intB: intB, operation: .xorGate)
        output = result == 1
    }
}
