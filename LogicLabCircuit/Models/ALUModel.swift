//
//  ALU.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 06/07/25.
//

import Foundation

struct ALUModel {
    static func compute(intA: UInt8, intB: UInt8, operation: ALUOperation) -> UInt8 {
        switch operation {
        case .add:
            return intA &+ intB
        case .sub:
            return intA &- intB
        case .andGate:
            return intA & intB
        case .orGate:
            return intA | intB
        case .xorGate:
            return intA ^ intB
        }
    }
}
