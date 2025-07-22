//
//  ALUViewModel.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 06/07/25.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var inputA: UInt8 = 0
    @Published var inputB: UInt8 = 0
    @Published var selectedOperation: ALUOperation = .add // default value
    @Published var result: UInt8 = 0
    @Published var isTapped: Bool = false
    
    func calculate() {
        result = ALUModel.compute(a: inputA, b: inputB, operation: selectedOperation)
    }
    
    var binaryResult: String {
        String(result, radix: 2).padLeft(toSize: 8)
    }
    
    var hexResult: String {
        String(format: "0x%02X", result)
    }
}
