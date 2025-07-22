//
//  ALU.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 06/07/25.
//

import Foundation

enum ALUOperation: String, CaseIterable {
    case add = "ADD"
    case sub = "SUB"
    case and = "AND"
    case or = "OR"
    case xor = "XOR"
    case shiftLeft = "SHL"
    case shiftRight = "SHR"
}

struct ALUModel {
    static func compute(a: UInt8, b: UInt8, operation: ALUOperation) -> UInt8 {
        switch operation {
        case .add:
            return a &+ b
        case .sub:
            return a &- b
        case .and:
            return a & b
        case .or:
            return a | b
        case .xor:
            return a ^ b
        case .shiftLeft:
            return a << 1
        case .shiftRight:
            return a >> 1
        }
    }
}
