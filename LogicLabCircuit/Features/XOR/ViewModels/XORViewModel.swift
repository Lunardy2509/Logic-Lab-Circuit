//
//  XORViewModel.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 26/07/25.
//

import Combine
import Foundation

class XORViewModel: ObservableObject {
    @Published var inputA: Bool = false
    @Published var inputB: Bool = false
    @Published var output: Bool = false

    func computeOutput() {
        let a: UInt8 = inputA ? 1 : 0
        let b: UInt8 = inputB ? 1 : 0
        let result = ALUModel.compute(a: a, b: b, operation: .xor)
        output = result == 1
    }
}
