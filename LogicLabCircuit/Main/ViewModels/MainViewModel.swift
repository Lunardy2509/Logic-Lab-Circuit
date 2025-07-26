//
//  ALUViewModel.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 06/07/25.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var inputA: Bool = false
    @Published var inputB: Bool = false
    @Published var inputCi: Bool = false
    @Published var selectedOperation: ALUOperation = .add // default value
    @Published var result: UInt8 = 0
    @Published var isTapped: Bool = false
    
}
